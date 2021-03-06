public class ExportTestCoverage{

    public CoverageWrapper cw {get;set;}
	
    public ExportTestCoverage(){
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(Url.getOrgDomainUrl().toExternalForm()+'/services/data/v43.0/tooling/query/?q=Select+id,ApexClassorTrigger.Name,NumLinesCovered,NumLinesUncovered+from+ApexCodeCoverageAggregate');
        req.setMethod('GET');
        Http h = new Http();
        HttpResponse resp = h.send(req);
        if(resp.getStatusCode() == 200){
            cw  = (CoverageWrapper)JSON.deserialize(resp.getBody(),CoverageWrapper.class);
            system.debug('cw  '+cw  );
        }
    }
    
    public class Attributes {
        public String type;
        public String url;
    }

    public class Records {
        public Attributes attributes;
        public String Id;
        public ApexClassOrTrigger ApexClassOrTrigger {get;set;}
        public Integer NumLinesCovered {get;set;}
        public Integer NumLinesUncovered {get;set;}
    }

    public class ApexClassOrTrigger {
        public Attributes attributes;
        public String Name{get;set;}
    }
    
    public class CoverageWrapper{
        public Integer size;
        public Integer totalSize;
        public Boolean done;
        public Object queryLocator;
        public String entityTypeName;
        public List<Records> records{get;set;}
    }
}
