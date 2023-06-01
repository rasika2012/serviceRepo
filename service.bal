import ballerina/http;
import ballerina/log;

type ApiConfigurations record {|
    string baseUrl;
    string scope;
    string accessTokenUrl;
    string clientId;
    string clientSecret;
|};

configurable ApiConfigurations apiConfigurations = ?;

http:Client httpClient = check new (apiConfigurations.baseUrl, 
    auth = {
        tokenUrl: apiConfigurations.accessTokenUrl,
        clientId: apiConfigurations.clientId,
        clientSecret: apiConfigurations.clientSecret,
        scopes: [apiConfigurations.scope]
    }
);

public listener http:Listener listenerPolice = new (9090);

service /app on listenerPolice {
    resource function get sayHello() returns json|error {
        json|error result = httpClient->get("/services/product-api/1.0.0/products");
        if (result is error) {
            log:printError(result.message());
            return result;
        }
        log:printInfo(result.toString());
        return result;

    }
}
