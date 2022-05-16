# DLI-docs

Documentation for the DLI platform.

### Setup environment

- tested on Python >= 2.7.2

```
python -m pip install --upgrade pip
pip install pymdown-extensions
pip install mkdocs
pip install mkdocs-awesome-pages-plugin
pip install mkdocs-material==5.0.1
```

pip install -r requirements.txt
pip install -r requirements.txt

## run locally:

```shell
mkdocs serve
```

## build site

```
mkdocs build --clean
```

pandoc --reference-doc=mystyle.docx -f html -t docx -s --highlight-style pygments -o dli-product-enhancement-guide.docx index.html

pandoc --reference-doc=mystyle.docx -f html -t docx -s --highlight-style pygments -o dli-product-enhancement-guide.docx http://127.0.0.1:8000/product-enhancement/product-enhancement-full/

