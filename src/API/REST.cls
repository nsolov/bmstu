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
</Routes>
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
