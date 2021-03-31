/// Description
Class Fit.Coach Extends (%Persistent, Fit.Person)
{

/// массив наград, в качестве ключей используются даты получения награды
Property Awards As array Of %String;

/// Текстовый поток
Property Info As %Stream.GlobalCharacter;

/// Бинарный поток (фото тренера)
Property Img As %Stream.GlobalBinary;

Relationship Trainings As Fit.Training [ Cardinality = many, Inverse = Coach ];

Storage Default
{
<Data name="Awards">
<Attribute>Awards</Attribute>
<Structure>subnode</Structure>
<Subscript>"Awards"</Subscript>
</Data>
<Data name="CoachDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Email</Value>
</Value>
<Value name="4">
<Value>Phone</Value>
</Value>
<Value name="5">
<Value>Price</Value>
</Value>
<Value name="6">
<Value>Info</Value>
</Value>
<Value name="7">
<Value>Img</Value>
</Value>
</Data>
<DataLocation>^Fit.CoachD</DataLocation>
<DefaultData>CoachDefaultData</DefaultData>
<IdLocation>^Fit.CoachD</IdLocation>
<IndexLocation>^Fit.CoachI</IndexLocation>
<StreamLocation>^Fit.CoachS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
