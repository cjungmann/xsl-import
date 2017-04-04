# xsl-import

xsl-import is a simple command-line tool, written in Python, that generates a
single XSLT document from a XSLT document and its _xsl:import_ references.

It is often desirable to split large code projects into several files to group
related elements.  It helps by increasing code readability, clarity, and modularity.
This is particularly useful for XSLT stylesheets, whose language is verbose and
more difficult to follow than most other computer languages.  This tool enables
a user to take advantage of the benefits of developing with multiple files while
making it easy to deliver a single stylesheet.  As a command-line tool, it can
be incorporated into a Makefile to ensure the consolidated stylesheet is up-to-date.
## Installation

~~~
$ git clone https://github.com/cjungmann/xsl-import.git
~~~

Installation contains the Python program, README.md and LICENSE files, and several
simple stylesheets for testing the output.  The Python source file can be moved or
copied to an appropriate directory to make it universally accessible (ie /usr/bin/).

## Usage

~~~
$ xsl-import [-is] _your-file.xsl_
~~~

**-i** will add an _**i**mport_ source comment to each imported element.  
**-s** will _**s**trip_ all comments from imported elements.

There are 4 sample XSLT files included with the project.  Together, they test
two levels of _xsl:import_ (an imported file that itself includes a third file).

Run the test, including the import file comments to see how priorities are
resolved:

~~~
$ xsl-import -i base.xsl
~~~

The strip comments flag, -s, is intended to generate a somewhat minimized
document for delivery, especially over the web.  This makes it more feasible
to liberally document the XSLT files to help clarify what is otherwise a
rather difficult computer language to scan.

The output can be a bit ragged.  Linux users can take advantage of the
command line utility _xmllint_ (packaged with Rather than trying to make a pretty-print
feature, it is recommended that (Linux) users take advantage of the _xmllint_
tool for a cleaner looking file:

To install xmllint:
~~~
$ sudo apt-get install libxml2-utils
$ man xmllint
~~~

To use xmllint:
~~~
$ xsl-import -s base.xsl | xmllint --format -
~~~

## Description

This command-line tool will read an XSLT file, and recursively incorporate
unique element children of the document element _xsl:stylesheet_ of files indicated
with _xsl:import_ elements.

The output will be the text of a single XSLT document that directly contains the
unique elements of the imported files.  Sending this file to an end-user instead
of the set of files it represents will improve performance, particularly in a
web-delivery system that would otherwise have many server round-trips to confirm
the validity of each imported file.

Sending a single file also benefits users of Web-kit-based browsers, whose
XSLProcessor object cannot handle _xsl:import_.

## Limitations

Currently, this utility will only attempt to incorporate files referenced by
_xsl:import_.  This is because the location of the _xsl:import_ element and the
rules by which conflicts are resolved are stricly defined.  _xsl:include_
references will not be reconciled, and if used, these files must be made
available for parsers to access.

Currently, comment block children of _xsl:stylesheet_ from imported files are
not transfered.  The comments of the base file are not disturbed.  The comments
within imported elements are left in place unless the -s (strip comment) flag
is used.

## Future Possibilities

There is no plan to support reconciling _xsl:include_ references unless there is
expressed interest.
