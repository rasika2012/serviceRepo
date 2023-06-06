import ballerina/log;
import ballerina/http;


function Hello() returns error? {
    log:printInfo("new request:");
}

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "rateconvert",
    id: "rateconvert-311bc702-c4cb-4836-abde-a377e04bfe2d"
}

service / on new http:Listener(9090) {
    // @display {
    //     label: "Exchange Rates",
    //     id: "exchangerates-e54d8d17-1549-4177-9dfd-7b368b4a8896"
    // }
    // exchangerates:Client exchangeratesEp;

    @display {
        label: "CountryProfile",
        id: "countryprofile-c456774b-e9a3-4f09-968c-ba524293029c"
    }
    // countryprofile:Client countryprofileEp;

    function init() returns error? {
         error? e = Hello();
        // self.exchangeratesEp = check new ();
        // self.countryprofileEp = check new (config = {
        //     auth: {
        //         clientId: clientId,
        //         clientSecret: clientSecret
        //     }
        // });
    }

    resource function get convert(decimal amount = 1.0, string target = "AUD", string base = "USD") returns json|error {
        log:printInfo("new request:", base = base, target = target, amount = amount);
        // countryprofile:Currency _ = check self.countryprofileEp->getCurrencyCode(code = target);
        json a = {a: 1};
        error? e = Hello();
        return e;
    }
}

type PricingInfo record {
    string currencyCode;
    string displayName;
    decimal amount;
};

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string exchangeRateAPIKey = ?;

