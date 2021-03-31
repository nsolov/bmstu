/// Description
Class API.REST Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

Parameter CONTENTTYPE = "application/json";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <Route Url="/test" Method="GET" Call="Test"/>
  <Route Url="/client/:ID" Method="GET" Call="GetClient"/>
  <Route Url="/client" Method="Post" Call="SaveClient" />
</Routes>
}

/// в теле запроса приходит json следующего формата
/// {
///  "name":"TTT",
///  "email":"ttt@aa.ru",
///  "phones":["12345","23456"],
///  "dob":"1988-03-12"
/// }
ClassMethod SaveClient() As %Status
{
  Set sc = $$$OK
  try {
    set jo = {}.%FromJSON(%request.Content) // jo - JSON  объект с пришедшими данными
    set client = ##class(Fit.Client).%New()
    set client.Name = jo.name
    set client.Email = jo.email
    set client.DOB = $zdh(jo.dob,3)
    set iter = jo.phones.%GetIterator()
	  while iter.%GetNext(.key , .value ) {
	    do client.Phone.Insert(value)
	  }
    set sc = client.%Save()
    if $$$ISOK(sc) { 
      set resultJO = {"id":(client.%Id())}
      write resultJO.%ToJSON()
    }
  } catch ex {
    return ex.AsStatus()
  }
  Return sc
}

ClassMethod GetClient(ID As %Integer) As %Status
{
  set c = ##class(Fit.Client).%OpenId(ID,,.st)
  Return:($$$ISERR(st)) st
  set st = c.%JSONExportToString(.str)
  Return:($$$ISERR(st)) st
  write str
  return $$$OK
}

ClassMethod Test() As %Status
{
  Set currentDate = $ZDate($Now(), 3)
  Set obj = {"msg":"It works","today": (currentDate)}
  Write obj.%ToJSON()
  Return $$$OK
}

}
