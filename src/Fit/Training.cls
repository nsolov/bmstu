/// Description
Class Fit.Training Extends (%Persistent, %Populate, %JSON.Adaptor, %XML.Adaptor)
{

/// Description
Property Name As %String(MAXLEN = 100, VALUELIST = ",Zumba,Yoga Nidra,Yoga,Yoga Vanyasa,Pilates,BOSU Training");

Property MaxPersons As %Integer(MAXVAL = 6, MINVAL = 1);

Property Date As %Date(MAXVAL = "3+$h", MINVAL = "+$h");

Property Time As %Time;

Property Duration As %Time(VALUELIST = ",3600,4500,6000");

/// Description
Relationship Coach As Fit.Coach [ Cardinality = one, Inverse = Trainings ];

Relationship Appointments As Fit.Appointment [ Cardinality = children, Inverse = Training ];

/// Description
Index CoachIndex On Coach;

Storage Default
{
<Data name="TrainingDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>MaxPersons</Value>
</Value>
<Value name="4">
<Value>Date</Value>
</Value>
<Value name="5">
<Value>Time</Value>
</Value>
<Value name="6">
<Value>Duration</Value>
</Value>
<Value name="7">
<Value>Coach</Value>
</Value>
</Data>
<DataLocation>^Fit.TrainingD</DataLocation>
<DefaultData>TrainingDefaultData</DefaultData>
<IdLocation>^Fit.TrainingD</IdLocation>
<IndexLocation>^Fit.TrainingI</IndexLocation>
<StreamLocation>^Fit.TrainingS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
