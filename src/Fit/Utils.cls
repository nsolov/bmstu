Class Fit.Utils
{

ClassMethod TestJSON() As %Status
{
    set jo = {}
    set jo."first_name" = "Peter"
    do jo.%Set("last_name","Ivanov")
    set jo.Phone = "123-123-1234"
    do jo.%Set("newby",1,"boolean")
    set str = jo.%ToJSON()
    write str

    set jo2 = {}.%FromJSON(str)
    write !,jo2."last_name"

    Return $$$OK
}

}
