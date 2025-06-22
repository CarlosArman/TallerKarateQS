function fn() {
    var env = karate.env; // get system property 'karate.env'
    var baseURL = '';
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }

    if (env == 'dev') {
        baseURL = "https://reqres.in";
    } else if (env == 'cert') {
        baseURL = "https://reqres.in";
    }
    var config = {
        env: env,
        baseURL: baseURL,
        myVarName: 'someValue'
    }

    return config;
}