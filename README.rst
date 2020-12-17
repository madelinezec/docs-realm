===========================
MongoDB Realm Documentation
===========================

This repository contains documentation regarding components of
MongoDB Realm .

This documentation builds on the work of the `MongoDB
Manual <http://docs.mongodb.org/manual/>`_. You can download and build
this documentation locally if you already have `Sphinx
<http://sphinx.pocoo.org/>`_ installed, with the following command: ::

     pip install giza
     git clone git://github.com/mongodb/docs-ecosystem
     cd docs-ecosystem/
     make html

To build on Windows (using Cygwin):

- Ensure you have python installed
- install Sphinx using ``easy_install -U Sphinx``
- install pyyamml using ``pip install pyyaml``
- Build the docs using ``sphinx-build  -b html -d build/doctrees-html -c ./ source build/html``

You may also wish to install `Pygments
<http://pygments.org>`_ to provide syntax highlighting for code
examples.

Contribute
----------

The MongoDB Documentation Project is governed by the terms of the
`MongoDB Contributor Agreement
<https://www.mongodb.com/legal/contributor-agreement>`_.

To contribute to the documentation,

- If you have not done so already, please sign the `MongoDB Contributor Agreement <https://www.mongodb.com/legal/contributor-agreement>`_.

- Fork this repository on GitHub and issue a pull request.


Report Issues
-------------

File issue reports or requests at the `Documentation Jira Project
<https://jira.mongodb.org/browse/DOCS>`_.

License
-------

All documentation is available under the terms of a `Creative Commons
License <http://creativecommons.org/licenses/by-nc-sa/3.0/>`_.

If you have any questions, please contact `docs@10gen.com
<mailto:docs@10gen.com>`_.

-- The MongoDB/10gen Docs Team
