# xsl-import

xsl-import is a simple command-line tool, written in Python, that generates a
single XSLT document from a XSLT document and its xsl:import references.

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
$ xsl-import _your-file.xsl_
~~~

There are 4 sample XSLT files included with the project.  Together, they test
two levels of xsl:import (an imported file that itself includes a third file).
Run the test:

~~~
$ xsl-import base.xsl
~~~

## Description

This command-line tool will read an XSLT file, and recursively incorporate
unique element children of the document element xsl:stylesheet of files indicated
with xsl:import elements.

The output will be the text of a single XSLT document that directly contains the
unique elements of the imported files.  Sending this file to an end-user instead
of the set of files it represents will improve performance, particularly in a
web-delivery system that would otherwise have many server round-trips to confirm
the validity of each imported file.

Sending a single file also benefits users of Web-kit-based browsers, whose
XSLProcessor object cannot handle xsl:import.

## Limitations

Currently, this utility will only attempt to incorporate files referenced by
xsl:import.  This is because the location of the xsl:import element and the
rules by which conflicts are resolved are stricly defined.

Currently, comment block children of xsl:stylesheet from imported files are
not transfered.  The comments of the base file are not disturbed, nor are the
comments within elements of the included files removed.

## Future Possibilities

The inclusion of comments should be either more or less comprehensive and
selectable with a command line parameter.  It would be nice to allow the removal
of all comments, both within the base xsl:stylesheet and all child elements.
This would make this tool somewhat of a minimizer.

There is no plan to support reconciling xsl:include references unless there is
expressed interest.
