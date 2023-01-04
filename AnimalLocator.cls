public with sharing class AnimalLocator {

  public static String getAnimalNameById(Integer id) {
    String s = '';
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(
      'https://th-apex-http-callout.herokuapp.com/animals/' + id
    );
    request.setMethod('GET');
    HttpResponse response = http.send(request);

    if (response.getStatusCode() == 200) {
      Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(
        response.getBody()
      );
      System.debug(result);
      
      Map<String, Object> animal = (Map<String, Object>) result.get('animal'); 
      System.debug(animal);
                 
      
      s = String.valueOf(animal.get('name'));
      System.debug(s);

    
    }
    return s;
  }
}
