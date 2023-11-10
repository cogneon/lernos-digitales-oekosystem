#PATH=$PATH:/opt/homebrew/bin
echo Starting lernOS Guide Generation ...

# Variables
filename="lernos-digitales-oekosystem"
chapters="./src/index.md ./src/1-0-Basics.md ./src/2-0-Learning-Pathway.md ./src/2-01-Digitization.md ./src/2-02-Digital-Ecosystems.md ./src/2-03-Opportunities.md ./src/2-04-Roles.md ./src/2-05-Business-Model.md ./src/2-06-Types.md ./src/2-07-Phases.md ./src/2-08-Mindset.md ./src/2-09-Monetization.md ./src/2-10-DATEV.md ./src/2-11-SAP.md ./src/2-12-Continental.md"

# Delete Old Versions
echo Deleting old versions ...
rm -rf $filename.*
rm -rf ../docs/de/*
rm -ff ../docs/de-slides/index.html

# Create Web Version (mkdocs)
echo Creating Web Version ...
mkdocs build

# Create Microsoft Word Version (docx)
echo Creating Word version ...
pandoc metadata.yaml -s --resource-path="./src" -N --toc -V lang=de-de -o $filename.docx $chapters

# Create HTML Version (html)
echo Creating HTML version ...
pandoc metadata.yaml -s --resource-path="./src" -N --toc -V lang=de-de -o $filename.html $chapters

# Create PDF Version (pdf)
echo Creating PDF version ...
pandoc metadata.yaml -s --resource-path="./src" --template lernos -N --toc -V lang=de-de -o $filename.pdf $chapters

# Create eBook Versions (epub, mobi)
echo Creating eBook versions ...
pandoc metadata.yaml -s --resource-path="./src" -N --toc -V lang=de-de -o $filename.epub $chapters

# Create Slides (revealjs)
# echo Creating Presentation ...
# pandoc metadata.yaml --from markdown -s --resource-path="./src" -t revealjs -V theme=night -s ./slides/index.md -o ../docs/de-slides/index.html
