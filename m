From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 02/34] dt-bindings: Add a writing DT schemas how-to and annotated example
Date: Mon,  3 Dec 2018 15:31:51 -0600
Message-ID: <20181203213223.16986-3-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add a how-to doc on writing DT schema documentation. This gives a
description of each section and details on how to validate the DT schema
file. The DT schema are written using json-schema vocabulary in a YAML
encoded document. Using jsonschema gives us access to existing tooling.
A YAML encoding gives us something easy to edit. The example is
annotated to help explain what each section does.

This example is just the tip of the iceberg, but is it the part most
developers writing bindings will interact with. Backing all this up
are meta-schema (to validate the binding schemas), some DT core schema,
YAML encoded DT output with dtc, and a small number of python scripts to
run validation.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/example-schema.yaml   | 170 ++++++++++++++++++
 Documentation/devicetree/writing-schema.md    | 130 ++++++++++++++
 2 files changed, 300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/example-schema.yaml
 create mode 100644 Documentation/devicetree/writing-schema.md

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
new file mode 100644
index 000000000000..593567f7c6f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2018 Linaro Ltd.
+%YAML 1.2
+---
+# All the top-level keys are standard json-schema keywords except for
+# 'maintainers' and 'select'
+
+# $id is a unique idenifier based on the filename. There may or may not be a
+# file present at the URL.
+$id: "http://devicetree.org/schemas/example-schema.yaml#"
+# $schema is the meta-schema this schema should be validated with.
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: An example schema annotated with jsonschema details
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  A more detailed multi-line description of the binding.
+
+  Details about the hardware device and any links to datasheets can go here.
+
+  Literal blocks are marked with the '|' at the beginning. The end is marked by
+  indentation less than the first line of the literal block. Lines also cannot
+  begin with a tab character.
+
+select: false
+  # 'select' is a schema applied to a DT node to determine if this binding
+  # schema should be applied to the node. It is optional and by default the
+  # possible compatible strings are extracted and used to match.
+
+  # In this case, a 'false' schema will never match.
+
+properties:
+  # A dictionary of DT properties for this binding schema
+  compatible:
+    # More complicated schema can use oneOf (XOR), anyOf (OR), or allOf (AND)
+    # to handle different conditions.
+    # In this case, it's needed to handle a variable number of values as there
+    # isn't another way to express a constraint of the last string value.
+    # The boolean schema must be a list of schemas.
+    oneOf:
+      - items:
+          # items is a list of possible values for the property. The number of
+          # values is determined by the number of elements in the list.
+          # Order in lists is significant, order in dicts is not
+          # Must be one of the 1st enums followed by the 2nd enum
+          #
+          # Each element in items should be 'enum' or 'const'
+          - enum:
+              - vendor,soc4-ip
+              - vendor,soc3-ip
+              - vendor,soc2-ip
+          - enum:
+              - vendor,soc1-ip
+        # additionalItems being false is implied
+        # minItems/maxItems equal to 2 is implied
+      - items:
+          # 'const' is just a special case of an enum with a single possible value
+          - const: vendor,soc1-ip
+
+  reg:
+    # The core schema already checks that reg values are numbers, so device
+    # specific schema don't need to do those checks.
+    # The description of each element defines the order and implicitly defines
+    # the number of reg entries.
+    items:
+      - description: core registers
+      - description: aux registers
+    # minItems/maxItems equal to 2 is implied
+
+  reg-names:
+    # The core schema enforces this is a string array
+    items:
+      - const: core
+      - const: aux
+
+  clocks:
+    # Cases that have only a single entry just need to express that with maxItems
+    maxItems: 1
+    description: bus clock
+
+  clock-names:
+    items:
+      - const: bus
+
+  interrupts:
+    # Either 1 or 2 interrupts can be present
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: tx or combined interrupt
+      - description: rx interrupt
+    description:
+      A variable number of interrupts warrants a description of what conditions
+      affect the number of interrupts. Otherwise, descriptions on standard
+      properties are not necessary.
+
+  interrupt-names:
+    # minItems must be specified here because the default would be 2
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: tx irq
+      - const: rx irq
+
+  # Property names starting with '#' must be quoted
+  '#interrupt-cells':
+    # A simple case where the value must always be '2'.
+    # The core schema handles that this must be a single integer.
+    const: 2
+
+  interrupt-controller: true
+    # The core checks this is a boolean, so just have to list it here to be
+    # valid for this binding.
+
+  clock-frequency:
+    # The type is set in the core schema. Per device schema only need to set
+    # constraints on the possible values.
+    minimum: 100
+    maximum: 400000
+    # The value that should be used if the property is not present
+    default: 200
+
+  foo-gpios:
+    maxItems: 1
+    description: A connection of the 'foo' gpio line.
+
+  vendor,int-property:
+    description: Vendor specific properties must have a description
+    # 'allOf' is the json-schema way of subclassing a schema. Here the base
+    # type schema is referenced and then additional constraints on the values
+    # are added.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [2, 4, 6, 8, 10]
+
+  vendor,bool-property:
+    description: Vendor specific properties must have a description
+    # boolean properties is one case where the json-schema 'type' keyword
+    # can be used directly
+    type: boolean
+
+  vendor,string-array-property:
+    description: Vendor specific properties should reference a type in the
+      core schema.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/stringarray
+      - items:
+          - enum: [ foo, bar ]
+          - enum: [ baz, boo ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+
+examples:
+  # Examples are now compiled with dtc
+  - |
+    node@1000 {
+          compatible = "vendor,soc4-ip", "vendor,soc1-ip";
+          reg = <0x1000 0x80>,
+                <0x3000 0x80>;
+          reg-names = "core", "aux";
+          interrupts = <10>;
+          interrupt-controller;
+    };
diff --git a/Documentation/devicetree/writing-schema.md b/Documentation/devicetree/writing-schema.md
new file mode 100644
index 000000000000..a3652d33a48f
--- /dev/null
+++ b/Documentation/devicetree/writing-schema.md
@@ -0,0 +1,130 @@
+# Writing DeviceTree Bindings in json-schema
+
+Devicetree bindings are written using json-schema vocabulary. Schema files are
+written in a JSON compatible subset of YAML. YAML is used instead of JSON as it
+considered more human readable and has some advantages such as allowing
+comments (Prefixed with '#').
+
+## Schema Contents
+
+Each schema doc is a structured json-schema which is defined by a set of
+top-level properties. Generally, there is one binding defined per file. The
+top-level json-schema properties used are:
+
+- __$id__ - A json-schema unique identifier string. The string must be a valid
+URI typically containing the binding's filename and path. For DT schema, it must
+begin with "http://devicetree.org/schemas/". The URL is used in constructing
+references to other files specified in schema "$ref" properties. A $ref values
+with a leading '/' will have the hostname prepended. A $ref value a relative
+path or filename only will be prepended with the hostname and path components
+of the current schema file's '$id' value. A URL is used even for local files,
+but there may not actually be files present at those locations.
+
+- __$schema__ - Indicates the meta-schema the schema file adheres to.
+
+- __title__ - A one line description on the contents of the binding schema.
+
+- __maintainers__ - A DT specific property. Contains a list of email address(es)
+for maintainers of this binding.
+
+- __description__ - Optional. A multi-line text block containing any detailed
+information about this binding. It should contain things such as what the block
+or device does, standards the device conforms to, and links to datasheets for
+more information.
+
+- __select__ - Optional. A json-schema used to match nodes for applying the
+schema. By default without 'select', nodes are matched against their possible
+compatible string values or node name. Most bindings should not need select.
+
+- __allOf__ - Optional. A list of other schemas to include. This is used to
+include other schemas the binding conforms to. This may be schemas for a
+particular class of devices such as I2C or SPI controllers.
+
+- __properties__ - A set of sub-schema defining all the DT properties for the
+binding. The exact schema syntax depends on whether properties are known,
+common properties (e.g. 'interrupts') or are binding/vendor specific properties.
+
+  A property can also define a child DT node with child properties defined
+under it.
+
+  For more details on properties sections, see 'Property Schema' section.
+
+- __patternProperties__ - Optional. Similar to 'properties', but names are regex.
+
+- __required__ - A list of DT properties from the 'properties' section that
+must always be present.
+
+- __examples__ - Optional. A list of one or more DTS hunks implementing the
+binding. Note: YAML doesn't allow leading tabs, so spaces must be used instead.
+
+Unless noted otherwise, all properties are required.
+
+## Property Schema
+
+The 'properties' section of the schema contains all the DT properties for a
+binding. Each property contains a set of constraints using json-schema
+vocabulary for that property. The properties schemas are what is used for
+validation of DT files.
+
+For common properties, only additional constraints not covered by the common
+binding schema need to be defined such as how many values are valid or what
+possible values are valid.
+
+Vendor specific properties will typically need more detailed schema. With the
+exception of boolean properties, they should have a reference to a type in
+schemas/types.yaml. A "description" property is always required.
+
+The Devicetree schemas don't exactly match the YAML encoded DT data produced by
+dtc. They are simplified to make them more compact and avoid a bunch of
+boilerplate. The tools process the schema files to produce the final schema for
+validation. There are currently 2 transformations the tools perform.
+
+The default for arrays in json-schema is they are variable sized and allow more
+entries than explicitly defined. This can be restricted by defining 'minItems',
+'maxItems', and 'additionalItems'. However, for DeviceTree Schemas, a fixed
+size is desired in most cases, so these properties are added based on the
+number of entries in an 'items' list.
+
+The YAML Devicetree format also makes all string values an array and scalar
+values a matrix (in order to define groupings) even when only a single value
+is present. Single entries in schemas are fixed up to match this encoding.
+
+## Testing
+
+### Dependencies
+
+The DT schema project must be installed in order to validate the DT schema
+binding documents and validate DTS files using the DT schema. The DT schema
+project can be installed with pip:
+
+`pip3 install git+https://github.com/robherring/yaml-bindings.git@master`
+
+dtc must also be built with YAML output support enabled. This requires that
+libyaml and its headers be installed on the host system.
+
+### Running checks
+
+The DT schema binding documents must be validated using the meta-schema (the
+schema for the schema) to ensure they are both valid json-schema and valid
+binding schema. All of the DT binding documents can be validated using the
+`dt_binding_check` target:
+
+`make dt_binding_check`
+
+In order to perform validation of DT source files, use the `dtbs_check` target:
+
+`make dtbs_check`
+
+This will first run the `dt_binding_check` which generates the processed schema.
+
+It is also possible to run checks with a single schema file by setting the
+'DT_SCHEMA_FILES' variable to a specific schema file.
+
+`make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/trivial-devices.yaml`
+
+
+## json-schema Resources
+
+[JSON-Schema Specifications](http://json-schema.org/)
+
+[Using JSON Schema Book](http://usingjsonschema.com/)
-- 
2.19.1
