/// Description
Class Fit.Client Extends (%Persistent, Fit.Person)
{

Property DOB As %Date;

Storage Default
{
<Data name="ClientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DOB</Value>
</Value>
<Value name="3">
<Value>Email</Value>
</Value>
<Value name="4">
<Value>Phone</Value>
</Value>
<Value name="5">
<Value>Name</Value>
</Value>
</Data>
<DataLocation>^Fit.ClientD</DataLocation>
<DefaultData>ClientDefaultData</DefaultData>
<IdLocation>^Fit.ClientD</IdLocation>
<IndexLocation>^Fit.ClientI</IndexLocation>
<StreamLocation>^Fit.ClientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
