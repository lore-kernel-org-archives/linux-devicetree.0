From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH 1/5] Documentation: dt-bindings: add documentation on new DT binding format
Date: Fri, 28 Aug 2015 01:23:49 -0400
Message-ID: <1440739433-6799-2-git-send-email-mporter@konsulko.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440739433-6799-1-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Documentation explaining the syntax and format of the YAML-based DT binding
documentation.

Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/dt-binding-format.txt      | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dt-binding-format.txt

diff --git a/Documentation/devicetree/bindings/dt-binding-format.txt b/Documentation/devicetree/bindings/dt-binding-format.txt
new file mode 100644
index 0000000..f9acc22
--- /dev/null
+++ b/Documentation/devicetree/bindings/dt-binding-format.txt
@@ -0,0 +1,106 @@
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
+* Scope is denoted by indentation of two spaces
+* Key value pairs are denoted by "key: value"
+* Sequences are denoted by "- "
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
+The following YAML types are supported in the DT binding format:
+
+* [R] id: unique identifier in property form (e.g. skel-device)
+
+* [R] title: title of the binding
+
+* [O] maintainer: sequence of maintainers
+      [R] name: name and email of maintainer or mailing list in RFC822
+                form.
+
+* [O] description: full description of the binding
+
+* [O] compatible: sequence of valid compatible descriptors
+      [R] name: the compatible string surrounded in double quotes
+      [O] deprecated: a deprecated compatible string surrounded in
+                      double quotes
+      [O] description: description of the compatible string
+
+* [O] required: sequence of required properties:
+      [R] name: name of the property surrounded in double quotes
+      [R] description: description of the property
+      [O] reference: optional reference to a binding id
+
+* [O] optional: sequence of optional properties:
+      [R] name: name of the property surrounded in double quotes
+      [R] description: description of the property
+      [O] reference: optional reference to a binding id
+
+* [O] deprecated: sequence of deprecated properties:
+      [R] name: name of the property surrounded in double quotes
+      [R] description: description of the property
+      [O] reference: optional reference to a binding id
+
+* [R] example: sequence of examples:
+      [R] dts: DT source of example usage. The example text must use
+               literal style ("|") so that it retains indentation and
+               newlines.
+      [O] description: description of the example
+
+Note: [R] and [O] denote required and optional fields, respectively.
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
2.1.4
