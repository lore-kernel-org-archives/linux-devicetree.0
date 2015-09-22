From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH v2 1/3] Documentation: dt-bindings: add documentation on new DT binding format
Date: Mon, 21 Sep 2015 23:59:16 -0400
Message-ID: <1442894358-15606-2-git-send-email-mporter@konsulko.com>
References: <1442894358-15606-1-git-send-email-mporter@konsulko.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442894358-15606-1-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Documentation explaining the syntax and format of the YAML-based DT binding
documentation.

Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/dt-binding-format.txt      | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dt-binding-format.txt

diff --git a/Documentation/devicetree/bindings/dt-binding-format.txt b/Documentation/devicetree/bindings/dt-binding-format.txt
new file mode 100644
index 0000000..3763487
--- /dev/null
+++ b/Documentation/devicetree/bindings/dt-binding-format.txt
@@ -0,0 +1,105 @@
+--------------------------
+Device Tree Binding Format
+--------------------------
+
+Background
+----------
+
+DT bindings historically were written as text in prose format which
+led to issues in usability of that source documentation. Some of
+these issues include the need to programmatically process binding
+source documentation to do DTS validation, perform mass updates to
+format/style, and to generate publishable documentation in HTML or
+PDF form.
+
+Overview
+--------
+
+The DT binding format is based on the YAML text markup language.
+Although there are many text markup options available, YAML
+fulfills all requirements considered for a DT binding source format
+which include:
+
+1) Must be human readable
+2) Must be easily translated to other data formats (XML, JSON, etc).
+3) Must have sufficient tools and libraries to enable developers to
+   build new tools for DT binding processing
+4) Must have a complete spec to refer to syntax
+
+YAML is documentated in the specification found at
+http://www.yaml.org/spec/1.2/spec.html
+
+The required YAML DT binding tag format and syntax are defined in
+the following sections.
+
+YAML DT Binding Syntax
+----------------------
+
+* Lines starting with "#" are comments and not part of the binding itself
+* "%YAML 1.2" starts a file, indicating the version of YAML in use
+* "---" starts a binding document
+* "..." ends a binding document
+* Multiple binding documents may exist in a single file
+* Tabs are not permitted
+* Scope is denoted by indentation of four spaces
+* Key value pairs are denoted by "key: value"
+* Sequences are denoted by "-"
+* Scalar values may convert newlines to spaces and preserve blank
+  lines for long description formatting using ">"
+* Scalar values may escape all reserved characters and preserve
+  newlines by using "|" to denote literal style
+
+For additional information on YAML syntax, refer to the specification
+at http://www.yaml.org/spec/1.2/spec.html
+
+YAML DT Binding Format
+----------------------
+
+The DT binding format is based on the YAML Core schema defined in the
+specification. The following YAML sequences and keys are supported in
+the DT binding format:
+
+[Note: [R] and [O] denote required and optional sequences/keys,respectively]
+
+* [R] version: DT binding format version. Currently 1.
+
+* [R] id: unique identifier in property form (e.g. skel-device)
+
+* [R] title: title of the binding
+
+* [R] maintainer: sequence of maintainers
+      [R] name: name and email of maintainer or mailing list in RFC822
+                form.
+
+* [O] description: full description of the binding
+
+* [O] inherits: sequence of inherited bindings
+      [R] id: unique identifier of inherited binding
+
+* [R] properties: sequence of properties
+      [R] name: name of property surrounded in double quotes
+      [R} category: category of property. One of "required",
+                    "optional", or "deprecated".
+      [R] type: type of property. One of "string", "int", "empty",
+                "phandle", or "array".
+      [O] constraint: constraint expression using C syntax
+      [O] deprecated: C syntax expression of deprecated compatible
+                      strings.
+      [O] description: description of the property
+
+* [O] notes: Any additional notes about properties in this binding.
+
+* [O] example: sequence of examples:
+      [R] dts: DT source of example usage. The example text must use
+               literal style ("|") so that it retains indentation and
+               newlines.
+      [O] description: description of the example
+
+Skeleton Binding
+----------------
+
+The skeleton.yaml binding found in the top of the DT binding tree
+is the canonical example of syntax and format to use when writing
+a DT binding document. It is maintained with the latest formatting
+conventions, making it the best starting point when writing a new DT
+binding.
-- 
2.5.1
