// A YAML document is a sequence of YAML nodes
public type Document Node[];

// A YAML node could be a mapping, sequence, or scalar
public type Node Mapping|List|YamlScalar;

// A YAML mapping is a map of strings to YAML nodes
public type Mapping map<Node>|never; // Tempary Fix

// A YAML sequence is an array of YAML nodes
public type List Node[]|never; // Tempary Fix

// A YAML scalar could be a string, integer, decimal, boolean, or null
public type YamlScalar string|int|decimal|boolean|null;
