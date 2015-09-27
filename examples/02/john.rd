<?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
         xmlns:dc="http://purl.org/dc/terms/"
         xmlns:foaf="http://xmlns.com/foaf/0.1/">
  <rdf:Description rdf:about="http://example.org/document.html">
    <dc:title xml:lang="en">The Web page of John Smith</dc:title>
    <dc:creator rdf:resource="http://example.org/john-smith"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://example.org/john-smith">
    <rdf:type rdf:resource="foaf:Person"/>
    <foaf:name>John Smith</foaf:name>
  </rdf:Description>
</rdf:RDF>
