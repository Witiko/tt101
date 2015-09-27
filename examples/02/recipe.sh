xmllint -noout --dtdvalid recipe.dtd recipe.xml
xmllint -noout --schema   recipe.xsd recipe.xml
trang recipe.rnc recipe.rng
xmllint -noout --relaxng  recipe.rng recipe.xml
