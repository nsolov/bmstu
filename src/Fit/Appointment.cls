/// Description
Class Fit.Appointment Extends (%Persistent, %Populate, %JSON.Adaptor, %XML.Adaptor) [ CompileAfter = (Fit.Client, Fit.Training) ]
{

/// Description
Relationship Client As Fit.Client [ Cardinality = one, Inverse = Appointments ];

/// Description
Relationship Training As Fit.Training [ Cardinality = parent, Inverse = Appointments ];

Storage Default
{
<Data name="AppointmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Client</Value>
</Value>
</Data>
<DataLocation>^Fit.AppointmentD</DataLocation>
<DefaultData>AppointmentDefaultData</DefaultData>
<ExtentSize>20</ExtentSize>
<IdLocation>^Fit.AppointmentD</IdLocation>
<IndexLocation>^Fit.AppointmentI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>7.15</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Client">
<AverageFieldSize>3.15</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="Training">
<AverageFieldSize>3.6</AverageFieldSize>
<Selectivity>8.3333%</Selectivity>
</Property>
<Property name="childsub">
<AverageFieldSize>3.55</AverageFieldSize>
<Selectivity>5.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Fit.AppointmentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
