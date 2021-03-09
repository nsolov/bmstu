/// Description
Class Simple.Human Extends %Persistent
{

/// Description
Property Name As %String [ Required ];

Property Phone As %String;

Property State As %String(MAXLEN = 2);

/// Метод объекта, вызываем только через  OREF
Method Print(state As %String) As %Status
{
    write ..Name
    write $$$NL
    write ..Phone
    if (state = ..State) {
        write $$$NL_"Ура, штат совпал"
    } else {
        write $$$NL_"Зачем пришел?"
    }
    Return $$$OK
}

/// Description
ClassMethod ShowAll() As %Status
{
    set sql = "SELECT ID,  Name, Phone FROM Simple.Human ORDER BY Name"
    set stmt = ##class(%SQL.Statement).%New()
    set tSC = stmt.%Prepare(sql)
    /// нужна проверка статуса tSC
    set rset = stmt.%Execute()
    while rset.%Next() {
        write $$$NL
        write rset.ID_" "_rset.Name_ " "_rset.Phone
    }
}

Storage Default
{
<Data name="HumanDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Phone</Value>
</Value>
<Value name="4">
<Value>State</Value>
</Value>
</Data>
<DataLocation>^Simple.HumanD</DataLocation>
<DefaultData>HumanDefaultData</DefaultData>
<IdLocation>^Simple.HumanD</IdLocation>
<IndexLocation>^Simple.HumanI</IndexLocation>
<StreamLocation>^Simple.HumanS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
