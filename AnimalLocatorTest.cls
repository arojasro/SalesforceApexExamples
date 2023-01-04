@isTest
public class AnimalLocatorTest {
  @isTest
  static void testRESTMethodwithMockClass() {
    // Set up the mock callout using the AnimalLocatorMock class
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
    // Call the method being tested
    String s = AnimalLocator.getAnimalNameById(1);
    // Verify the response received
    System.assertEquals('chicken', s, 'not a chicken');
  }

  @isTest
  static void testRESTMethodStaticResource() {
    // Create a mock response using a static Resource CallOutMock
    StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
    mock.setStaticResource('GetAnimaById');
    mock.setStatusCode(200);
    mock.setHeader('Content-Type', 'application/json;charset=UTF-8');

    // Set up the mock callout
    Test.setMock(HttpCalloutMock.class, mock);
    // Call the method being tested
    String s = AnimalLocator.getAnimalNameById(1);
    // Verify the response received
    System.assertEquals('chicken', s, 'not a chicken');
  }
}


