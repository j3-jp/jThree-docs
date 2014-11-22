#!/bin/bash
cd `dirname $0`
for i in src/*.md;do j=${i#src/};pandoc $i -f markdown_github+definition_lists -t html5 --template=template/pandoc_template.html -c css/normalize.css -c css/doc.css -c css/common.css --toc --toc-depth=6 -s -o html/${j%.md}.html;done
