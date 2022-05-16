import panflute as pf


def change_md_link(elem, doc):
    if isinstance(elem, pf.Image):
        elem.attributes.pop('width', None)
        elem.attributes.pop('height', None)
    return elem


if __name__ == "__main__":
    pf.run_filter(change_md_link)