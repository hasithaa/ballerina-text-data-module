
# Represent CSV data. 
# 
# This is the defaul representation of CSV data.
type Csv Row[];

# Represent a CSV row containing cells.
# 
# The default represention of a CSV row. 
public type Row Cell[];

# Represent a CSV cell type.
# 
# Note: the float type removed intentionally.
# Epmty cell is represented in null, unless represented as empty string.
public type Cell string|int|decimal|boolean|null;

// Alternative representation of CSV data.

// As an Array of records.

# Represent a CSV row containing cells.
# 
# Here, field names are inferred from the header row. if header row is not
# present, field names are generated as "field1", "field2", etc.
public type RowRecord record {|
 Cell...;
|};

# Represent a CSV record containing row as an array of records.
public type RecordList RowRecord[];

// As a table.

# Represent a CSV table containing row as a table.
public type Table table<RowRecord>;

// Any CSV Format
public type CsvFormat Csv|RecordList|Table;


// Proposed Funnctions
public type Options record {
    string delimiter = ",";
    record {
        int headerRows = 1;
        typedesc<Row> headerType = Row;
    }|() header = ();
};

public function fromString(string text, Options options) returns Csv|error {
    return [[]];
}

public function fromStringWithRecordListType(string text, Options options, typedesc<RecordList> t = <>) returns t|error = external;

public function fromStringWithTableType(string text, Options options, typedesc<Table> t = <>) returns t|error = external;

// Instead of above fromStringWithRecordListType and fromStringWithTableType, we can have a single function as below.

public function fromStringWtihType(string text, Options options, typedesc<CsvFormat> t = <>) returns t = external;

public function toString(CsvFormat csv, Options otions) returns string {
    return "";
}

public function main(string s) returns error? {
    Csv csv = check fromString(s, {header : {headerRows : 1, headerType : Row}});
}