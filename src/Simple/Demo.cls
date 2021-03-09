/// First Class
Class Simple.Demo
{

/// Hello world example
ClassMethod Hello(name As %String, Output count As %Integer) As %Status
{
    Set sc = $$$OK
    try {
        Set count = $LENGTH(name)
        For i=0:1:$RANDOM(5) {
            Write "Hello "_name_$$$NL
        }
    } catch ex {
        set sc = ex.AsStatus()
    }

    /*
    if ($data(name)) {
        Set count = $LENGTH(name)
        For i=0:1:$RANDOM(5) {
            Write "Hello "_name_$$$NL
        }
    } else {
        Set sc = $$$ERROR(5001,"первый аргумент не задан")
    }*/
    Return sc
}

}
