@ECHO OFF
for %%i in (src\*.md) do (
echo %%~ni
pandoc %%i -f markdown_github+definition_lists -t html5 --template=template\pandoc_template.html --toc --toc-depth=4 -s -o html\%%~ni.html
)