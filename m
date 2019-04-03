From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 1/2] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
Date: Wed,  3 Apr 2019 09:48:04 +0200
Message-ID: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The NAND chips in MTD have a bunch of generic options that are needed in a
device tree. Add a YAML schemas for those.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v2:
  - Fix the regex for the NAND chip node
  - Move the minimum into an allOf for nand-ecc-strength and
    nand-ecc-step-size

Changes from v1:
  - Removed free form text binding
  - Enhanced properties descriptions
  - Fixed the SPDX license tag
  - Added minimums for nand-ecc-strength and nand-ecc-step-size
  - Removed Boris from the maintainers
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 143 +++++++-
 Documentation/devicetree/bindings/mtd/nand.txt             |  75 +----
 2 files changed, 143 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/nand-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
new file mode 100644
index 000000000000..199ba5ac2a06
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAND Chip and NAND Controller Generic Binding
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+description: |
+  The NAND controller should be represented with its own DT node, and
+  all NAND chips attached to this controller should be defined as
+  children nodes of the NAND controller. This representation should be
+  enforced even for simple controllers supporting only one chip.
+
+  The ECC strength and ECC step size properties define the user
+  desires in terms of correction capability of a controller. Together,
+  they request the ECC engine to correct {strength} bit errors per
+  {size} bytes.
+
+  The interpretation of these parameters is implementation-defined, so
+  not all implementations must support all possible
+  combinations. However, implementations are encouraged to further
+  specify the value(s) they support.
+
+properties:
+  $nodename:
+    pattern: "^nand-controller(@.*)?"
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  ranges: true
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    properties:
+      reg:
+        description:
+          Contains the native Ready/Busy IDs.
+
+      nand-ecc-mode:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/string
+          - enum: [ none, soft, hw, hw_syndrome, hw_oob_first, on-die ]
+        description:
+          Desired ECC engine, either hardware (most of the time
+          embedded in the NAND controller) or software correction
+          (Linux will handle the calculations). soft_bch is deprecated
+          and should be replaced by soft and nand-ecc-algo.
+
+      nand-ecc-algo:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/string
+          - enum: [ hamming, bch, rs ]
+        description:
+          Desired ECC algorithm.
+
+      nand-bus-width:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [ 8, 16 ]
+          - default: 8
+        description:
+          Bus width to the NAND chip
+
+      nand-on-flash-bbt:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          With this property, the OS will search the device for a Bad
+          Block Table (BBT). If not found, it will create one, reserve
+          a few blocks at the end of the device to store it and update
+          it as the device ages. Otherwise, the out-of-band area of a
+          few pages of all the blocks will be scanned at boot time to
+          find Bad Block Markers (BBM). These markers will help to
+          build a volatile BBT in RAM.
+
+      nand-ecc-strength:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - minimum: 1
+        description:
+          Maximum number of bits that can be corrected per ECC step.
+
+      nand-ecc-step-size:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - minimum: 1
+        description:
+          Number of data bytes covered by a single ECC step.
+
+      nand-ecc-maximize:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Whether or not the ECC strength should be maximized. The
+          maximum ECC strength is both controller and chip
+          dependent. The ECC engine has to select the ECC config
+          providing the best strength and taking the OOB area size
+          constraint into account. This is particularly useful when
+          only the in-band area is used by the upper layers, and you
+          want to make your NAND as reliable as possible.
+
+      nand-is-boot-medium:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Whether or not the NAND chip is a boot medium. Drivers might
+          use this information to select ECC algorithms supported by
+          the boot ROM or similar restrictions.
+
+      nand-rb:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Contains the native Ready/Busy IDs.
+
+    required:
+      - reg
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    nand-controller {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      /* controller specific properties */
+
+      nand@0 {
+        reg = <0>;
+        nand-ecc-mode = "soft";
+        nand-ecc-algo = "bch";
+
+        /* controller specific properties */
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
deleted file mode 100644
index e949c778e983..000000000000
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-* NAND chip and NAND controller generic binding
-
-NAND controller/NAND chip representation:
-
-The NAND controller should be represented with its own DT node, and all
-NAND chips attached to this controller should be defined as children nodes
-of the NAND controller. This representation should be enforced even for
-simple controllers supporting only one chip.
-
-Mandatory NAND controller properties:
-- #address-cells: depends on your controller. Should at least be 1 to
-		  encode the CS line id.
-- #size-cells: depends on your controller. Put zero unless you need a
-	       mapping between CS lines and dedicated memory regions
-
-Optional NAND controller properties
-- ranges: only needed if you need to define a mapping between CS lines and
-	  memory regions
-
-Optional NAND chip properties:
-
-- nand-ecc-mode : String, operation mode of the NAND ecc mode.
-		  Supported values are: "none", "soft", "hw", "hw_syndrome",
-		  "hw_oob_first", "on-die".
-		  Deprecated values:
-		  "soft_bch": use "soft" and nand-ecc-algo instead
-- nand-ecc-algo: string, algorithm of NAND ECC.
-		 Valid values are: "hamming", "bch", "rs".
-- nand-bus-width : 8 or 16 bus width if not present 8
-- nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
-
-- nand-ecc-strength: integer representing the number of bits to correct
-		     per ECC step.
-
-- nand-ecc-step-size: integer representing the number of data bytes
-		      that are covered by a single ECC step.
-
-- nand-ecc-maximize: boolean used to specify that you want to maximize ECC
-		     strength. The maximum ECC strength is both controller and
-		     chip dependent. The controller side has to select the ECC
-		     config providing the best strength and taking the OOB area
-		     size constraint into account.
-		     This is particularly useful when only the in-band area is
-		     used by the upper layers, and you want to make your NAND
-		     as reliable as possible.
-- nand-is-boot-medium: Whether the NAND chip is a boot medium. Drivers might use
-		       this information to select ECC algorithms supported by
-		       the boot ROM or similar restrictions.
-
-- nand-rb: shall contain the native Ready/Busy ids.
-
-The ECC strength and ECC step size properties define the correction capability
-of a controller. Together, they say a controller can correct "{strength} bit
-errors per {size} bytes".
-
-The interpretation of these parameters is implementation-defined, so not all
-implementations must support all possible combinations. However, implementations
-are encouraged to further specify the value(s) they support.
-
-Example:
-
-	nand-controller {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		/* controller specific properties */
-
-		nand@0 {
-			reg = <0>;
-			nand-ecc-mode = "soft";
-			nand-ecc-algo = "bch";
-
-			/* controller specific properties */
-		};
-	};

base-commit: 1244df4693747552c8efba995f4ebc3b247536cf
-- 
git-series 0.9.1
