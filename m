From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH v2 0/3] DT binding documents using text markup
Date: Mon, 21 Sep 2015 23:59:15 -0400
Message-ID: <1442894358-15606-1-git-send-email-mporter@konsulko.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes since v1:
	* Add dt binding format version
	* Treat compatible strings as another property
	* Required, optional, deprecated now a property field
	* Add property type field
	* Add property constraint field using C syntax for constraints
	* Move binding references to a top level inherits sequence
	* Dropped eeprom and phy examples. Example bindings are now only
	  the spi-slave binding and the skeleton device binding which
	  inherits the spi-slave binding.
	* Added notes field to capture any notes on properties
	* Update DT format docs to match new format.
	* Add language about use of YAML core binding
	* Refer to defined YAML sequences/keys consistently as such, remove
	  all vague reference to types and tags.

TODO:
	* reach agreement on format of sequences/keys
		* need a flexible constraint syntax. this is only described
		  in examples but needs a specific description in the format
		  document.
		* determine if compatibles can be handled generically in the
		  property sequence or are better handled in their own specific
		  compatible sequence
		* compatibles as properties have the ugliness of how to
		  handle deprecated strings, for now this is a "deprecated"
		  key that contains a C-syntax expression of all deprecated
		  strings.
	* simple binding doc validator
	* simple checkpatch.pl dts compatible string validator against yaml
	  binding doc compatible property constraints
	* update dtdocgen.py to process inherited bindings and current
	  sequence/key format.

---

During the Device Tree microconference at Linux Plumbers 2015, we had
a short discussion about how to improve DT Binding Documentation. A
number of issues were raised (again, as these things have been
discussed in the past) including:

	* Inconsistency between binding documents due to prose text
	  format.
	* Inability to reliably machine read bindings for mass update
          or search.
        * Bit rot of bindings as new conventions are agreed upon but
	  only new bindings are changed.

When the topic of needing the bindings in a rigid format was raised,
there was general head nodding that this was needed. It was noted that
this has been discussed many times before and nothing has been done.

My proposed solution to the problem is to convert all DT bindings
a rigid text markup format. In choosing a text markup language my
requirements were:

	1) Human readable
	2) Well documented
	3) Easy to translate to other data formats
	4) Well supported by tools and libraries

After looking at a number of markup options, YAML stood out as the
one that meets all of these requirements. The YAML syntax is adopted
in many projects specifically because of the high level of readability.
A comprehensive spec is at http://www.yaml.org/spec/1.2/spec.html.
There's a number of tools to convert between YAML and other popular
data formats such as JSON and XML. XML was cited by Behan Webster
during the microconference as an important data format as the type
of developers that may produce comprehensive DTS Binding validation
tools will want to use XML. Every major scripting language has a
high level binding to the low level libyaml C library to facilitate
handling of YAML data files.

This series is broken up into three parts:

1) The documentation defining the YAML DT binding format
2) A conversion of the generic SPI slave binding
2) A skeleton device binding example illustrating use of this format
   and inheriting the generic SPI slave binding properties.

As a proof of concept of what can be done with a proper machine
readable DT binding source file, there's a simple markdown document
generator at https://github.com/konsulko/dtgendoc. Also, to see
actual output from the generator, the generated markdown from those
bindings is viewable at https://github.com/konsulko/dtgendoc/wiki
(Note: this is not updated yet for v2, see TODO list)

There's a lot of other possibilities for validation tools using
only the data we have today in the bindings. In addition, Frank
Rowand covered some DT debug techniques that would benefit from
the binding documentation being 100% reliably searchable.

-Matt

Matt Porter (3):
  Documentation: dt-bindings: add documentation on new DT binding format
  Documentation: dt-bindings: spi: add generic YAML SPI slave binding
  Documentation: dt-bindings: add example DT binding document

 .../devicetree/bindings/dt-binding-format.txt      | 105 ++++++++++++++++
 Documentation/devicetree/bindings/skeleton.yaml    | 138 +++++++++++++++++++++
 .../devicetree/bindings/spi/spi-slave.yaml         | 108 ++++++++++++++++
 3 files changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dt-binding-format.txt
 create mode 100644 Documentation/devicetree/bindings/skeleton.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/spi-slave.yaml

-- 
2.5.1
