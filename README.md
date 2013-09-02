# oss_rb


A very initial Ruby Client for OpenSearchServer (v1.5) http://www.open-search-server.com


## Installation

Add this line to your application's Gemfile:

    gem 'oss_rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install oss_rb

## Usage

Obtain a client instance
```ruby
index = Oss::Index.new 'my_index', 'http://localhost:8080'
```

Create an index
```ruby
index.create 'EMPTY_INDEX'
```

Create some fields
```ruby
index.set_field {'name' => 'id', 'indexed' => 'YES'}
index.set_field(
	{	'name' => 'name',
		'analyzer' => 'StandardAnalyzer',
		'stored' => 'YES',
		'indexed' => 'YES'
	}
)
```

Set the default field, and the primary key
```ruby
index.set_field_default_unique 'name', 'id' 
```

Put a document in the index
```ruby
doc = Oss::Document.new
doc.fields << Oss::Field.new('id', "1")
doc.fields << Oss::Field.new('name', "john smith")
index.documents << doc
index.index!
```

Ok, time to make a search
```ruby
result = index.search_field(
	{	'query' => 'john',
		'searchFields' => [ {'field' => 'name', 'phrase'=>true, 'boost' => 1.0} ],
		'start' => 0,
		'rows' => 10,
		'returnedFields' => ['id', 'name']
 	}
)
```

It is possible to store a search template
```ruby
index.search_store_template_field('fieldsearch',
	{	'query' => 'john',
		'searchFields' => [ {'field' => 'name', 'phrase'=>true, 'boost' => 1.0} ],
		'start' => 0,
		'rows' => 10,
		'returnedFields' => ['id', 'name']
	}
)
```
     
Use the stored search template to make a search
```ruby
result = index.search_template_field 'fieldsearch', {'query' => 'john2'}
```

Deleting a search template
```ruby
index.search_template_delete 'fieldsearch'
```

You may remove documents by value or by query
```ruby
index.delete_document_by_value 'id', 1
index.delete_document_by_query 'name:john'
```
Or remove field
```ruby
index.delete_field 'name'
```

And finally here is how to delete the index
```ruby
index.delete!
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
