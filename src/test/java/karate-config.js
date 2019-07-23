function() {    
  var env = karate.env;

  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'prod';
  }

  var config = {
    env: env,
	baseUrl: 'http://api.apixu.com'
  }

  if (env == 'prod')
  {
    config.baseUrl = 'http://api.apixu.com'

  }

  else if (env == 'stage')
  {
  
  }

  karate.log('karate.baseUrl property was:', config.baseUrl);

  return config;
}