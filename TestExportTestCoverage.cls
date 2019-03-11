@isTest(isparallel=true)
global class TestExportTestCoverage implements HttpCalloutMock{
    
    static testMethod void testCallout(){
        Test.setMock(HttpCalloutMock.class, new TestExportTestCoverage());
        ExportTestCoverage etc = new ExportTestCoverage();
        System.assertNotEquals(etc.cw,null);
        System.assertNotEquals(etc.cw.records,null);
        System.assertEquals(etc.cw.records[0].NumLinesCovered,0);
        System.assertEquals(etc.cw.records[0].NumLinesUnCovered,10);
        System.assertEquals(etc.cw.records[0].ApexClassOrTrigger.Name,'TestClass');
    } 
    
    
    global HTTPResponse respond(HTTPRequest req) {
          // Create a fake response
          HttpResponse res = new HttpResponse();
          res.setHeader('Content-Type', 'application/json');
          res.setBody('{"size":182,"totalSize":182,"done":true,"queryLocator":null,"entityTypeName":"ApexCodeCoverageAggregate","records":[{"attributes":{"type":"ApexCodeCoverageAggregate","url":"/services/data/v43.0/tooling/sobjects/ApexCodeCoverageAggregate/715000000LdFWSA0"},"Id":"715000000LdFWSA0","ApexClassOrTrigger":{"attributes":{"type":"Name","url":"/services/data/v43.0/tooling/sobjects/ApexClass/01p000000C9D3AAK"},"Name":"TestClass"},"NumLinesCovered":0,"NumLinesUncovered":69},{"attributes":{"type":"ApexCodeCoverageAggregate","url":"/services/data/v43.0/tooling/sobjects/ApexCodeCoverageAggregate/715e0000000LxSAAA0"},"Id":"710000000LxSAAA0","ApexClassOrTrigger":{"attributes":{"type":"Name","url":"/services/data/v43.0/tooling/sobjects/ApexClass/01pe0000000C9RCAA0"},"Name":"TestClass2"},"NumLinesCovered":10,"NumLinesUncovered":53}]}');
          res.setStatusCode(200);
          return res;
    }
}
