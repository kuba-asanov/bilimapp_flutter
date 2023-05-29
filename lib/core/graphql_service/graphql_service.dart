/* External Dependencies */
import 'package:graphql_flutter/graphql_flutter.dart';

/* Local Dependencies */
import 'client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GraphQLService {
  GraphQLClient? client;

  Future<void> initClient() async {
    if (client != null) {
      client?.link.dispose();

      client = null;
    }

    client = await createClient();
  }

  Future<Map<String, dynamic>?> query<T>(
    String query, {
    required Map<String, dynamic> variables,
    FetchPolicy? fetchPolicy,
  }) async {
    final options = QueryOptions(
      document: gql(query),
      variables: variables,
      fetchPolicy: fetchPolicy ?? FetchPolicy.cacheAndNetwork,
      errorPolicy: ErrorPolicy.all,
    );

    if (client == null) {
      await initClient();
    }

    final QueryResult queryResult = await client!.query(options);

    if (queryResult.hasException) {
      if (isTokenExpired(queryResult.exception!)) {
        await initClient();

        return await this.query(
          query,
          variables: variables,
        );
      }

      throw queryResult.exception!;
    }

    return queryResult.data;
  }

  Future<Map<String, dynamic>?> mutate<T>(
    String query, {
    required Map<String, dynamic> variables,
  }) async {
    final options = MutationOptions(
      document: gql(query),
      variables: variables,
      fetchPolicy: FetchPolicy.noCache,
      errorPolicy: ErrorPolicy.all,
    );

    if (client == null) {
      await initClient();
    }

    final QueryResult mutationResult = await client!.mutate(options);

    if (mutationResult.hasException) {
      if (isTokenExpired(mutationResult.exception!)) {
        await initClient();

        return await mutate(
          query,
          variables: variables,
        );
      }

      throw mutationResult.exception!;
    }

    return mutationResult.data;
  }

  Future<Stream<T?>> subscribe<T>({
    required String query,
    required Map<String, dynamic> variables,
    String? root,
    dynamic Function(dynamic rawJson)? toRoot,
    required T Function(Map<String, dynamic> json) convert,
  }) async {
    final hasRoot = root != null && root.isNotEmpty;
    final hasToRoot = toRoot != null;
    assert(!(hasRoot && hasToRoot), 'Assign "root" or "toRoot" or nothing');

    final operation = SubscriptionOptions(
      document: gql(query),
      variables: variables,
      fetchPolicy: FetchPolicy.noCache,
      errorPolicy: ErrorPolicy.all,
    );

    if (client == null) {
      await initClient();
    }

    return client!.subscribe(operation).map(
      (QueryResult queryResult) {
        if (queryResult.hasException) {
          throw queryResult.exception!;
        }

        final rawJson = hasRoot
            ? queryResult.data![root]
            : hasToRoot
                ? toRoot(queryResult.data)
                : queryResult.data;

        return (rawJson == null)
            ? null
            : convert(rawJson as Map<String, dynamic>);
      },
    );
  }

  bool isTokenExpired(OperationException exception) {
    return exception.linkException != null &&
        (exception.linkException as ServerException).parsedResponse != null &&
        (exception.linkException as ServerException)
                .parsedResponse!
                .errors![0]
                .message ==
            'The security token included in the request is expired';
  }
}
