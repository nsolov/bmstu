Class Fit.Client Extends (%Persistent, Fit.Person)
{

Property DOB As %Date;

Property Age As %Integer [ Calculated, SqlComputeCode = { if ({DOB}="") { 
                                                        set {*} = ""} else {
                                                        set {*} = ($h-{DOB})\365.4
                                                    }}, SqlComputed ];

Relationship Appointments As Fit.Appointment(%JSONINCLUDE = "none") [ Cardinality = many, Inverse = Appointment ];

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
