From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] dt-bindings: net: meson-dwmac: convert to yaml
Date: Mon,  5 Aug 2019 14:25:58 +0200
Message-ID: <20190805122558.5130-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Synopsys DWMAC Glue for Amlogic SoCs over to a YAML schemas.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Rob, 

I keep getting :
.../devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: reg: [[3376480256, 65536], [3364046144, 8]] is too long

for the example DT

and for the board DT :
../amlogic/meson-gxl-s905x-libretech-cc.dt.yaml: ethernet@c9410000: reg: [[0, 3376480256, 0, 65536, 0, 3364046144, 0, 4]] is too short
../amlogic/meson-gxl-s905x-nexbox-a95x.dt.yaml: soc: ethernet@c9410000:reg:0: [0, 3376480256, 0, 65536, 0, 3364046144, 0, 4] is too long

and I don't know how to get rid of it.

What should I do for reg ?

Neil

 .../bindings/net/amlogic,meson-dwmac.yaml     | 113 ++++++++++++++++++
 .../devicetree/bindings/net/meson-dwmac.txt   |  71 -----------
 .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +
 3 files changed, 118 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/meson-dwmac.txt

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
new file mode 100644
index 000000000000..ae91aa9d8616
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson DWMAC Ethernet controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+# We need a select here so we don't match all nodes with 'snps,dwmac'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,meson6-dwmac
+          - amlogic,meson8b-dwmac
+          - amlogic,meson8m2-dwmac
+          - amlogic,meson-gxbb-dwmac
+          - amlogic,meson-axg-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: "snps,dwmac.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+
+        clock-names:
+          minItems: 3
+          maxItems: 3
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+
+        amlogic,tx-delay-ns:
+          $ref: /schemas/types.yaml#definitions/uint32
+          description:
+            The internal RGMII TX clock delay (provided by this driver) in
+            nanoseconds. Allowed values are 0ns, 2ns, 4ns, 6ns.
+            When phy-mode is set to "rgmii" then the TX delay should be
+            explicitly configured. When not configured a fallback of 2ns is
+            used. When the phy-mode is set to either "rgmii-id" or "rgmii-txid"
+            the TX clock delay is already provided by the PHY. In that case
+            this property should be set to 0ns (which disables the TX clock
+            delay in the MAC to prevent the clock from going off because both
+            PHY and MAC are adding a delay).
+            Any configuration is ignored when the phy-mode is set to "rmii".
+
+properties:
+  compatible:
+    additionalItems: true
+    maxItems: 3
+    items:
+      - enum:
+          - amlogic,meson6-dwmac
+          - amlogic,meson8b-dwmac
+          - amlogic,meson8m2-dwmac
+          - amlogic,meson-gxbb-dwmac
+          - amlogic,meson-axg-dwmac
+    contains:
+      enum:
+        - snps,dwmac-3.70a
+        - snps,dwmac
+
+  reg:
+    items:
+      - description:
+          The first register range should be the one of the DWMAC controller
+      - description:
+          The second range is is for the Amlogic specific configuration
+          (for example the PRG_ETHERNET register range on Meson8b and newer)
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - phy-mode
+
+examples:
+  - |
+    ethmac: ethernet@c9410000 {
+         compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
+         interrupts = <8>;
+         interrupt-names = "macirq";
+         clocks = <&clk_eth>, <&clkc_fclk_div2>, <&clk_mpll2>;
+         clock-names = "stmmaceth", "clkin0", "clkin1";
+         phy-mode = "rgmii";
+    };
diff --git a/Documentation/devicetree/bindings/net/meson-dwmac.txt b/Documentation/devicetree/bindings/net/meson-dwmac.txt
deleted file mode 100644
index 1321bb194ed9..000000000000
--- a/Documentation/devicetree/bindings/net/meson-dwmac.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-* Amlogic Meson DWMAC Ethernet controller
-
-The device inherits all the properties of the dwmac/stmmac devices
-described in the file stmmac.txt in the current directory with the
-following changes.
-
-Required properties on all platforms:
-
-- compatible:	Depending on the platform this should be one of:
-			- "amlogic,meson6-dwmac"
-			- "amlogic,meson8b-dwmac"
-			- "amlogic,meson8m2-dwmac"
-			- "amlogic,meson-gxbb-dwmac"
-			- "amlogic,meson-axg-dwmac"
-		Additionally "snps,dwmac" and any applicable more
-		detailed version number described in net/stmmac.txt
-		should be used.
-
-- reg:	The first register range should be the one of the DWMAC
-	controller. The second range is is for the Amlogic specific
-	configuration (for example the PRG_ETHERNET register range
-	on Meson8b and newer)
-
-Required properties on Meson8b, Meson8m2, GXBB and newer:
-- clock-names:	Should contain the following:
-		- "stmmaceth" - see stmmac.txt
-		- "clkin0" - first parent clock of the internal mux
-		- "clkin1" - second parent clock of the internal mux
-
-Optional properties on Meson8b, Meson8m2, GXBB and newer:
-- amlogic,tx-delay-ns:	The internal RGMII TX clock delay (provided
-			by this driver) in nanoseconds. Allowed values
-			are: 0ns, 2ns, 4ns, 6ns.
-			When phy-mode is set to "rgmii" then the TX
-			delay should be explicitly configured. When
-			not configured a fallback of 2ns is used.
-			When the phy-mode is set to either "rgmii-id"
-			or "rgmii-txid" the TX clock delay is already
-			provided by the PHY. In that case this
-			property should be set to 0ns (which disables
-			the TX clock delay in the MAC to prevent the
-			clock from going off because both PHY and MAC
-			are adding a delay).
-			Any configuration is ignored when the phy-mode
-			is set to "rmii".
-
-Example for Meson6:
-
-	ethmac: ethernet@c9410000 {
-		compatible = "amlogic,meson6-dwmac", "snps,dwmac";
-		reg = <0xc9410000 0x10000
-		       0xc1108108 0x4>;
-		interrupts = <0 8 1>;
-		interrupt-names = "macirq";
-		clocks = <&clk81>;
-		clock-names = "stmmaceth";
-	}
-
-Example for GXBB:
-	ethmac: ethernet@c9410000 {
-		compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
-		reg = <0x0 0xc9410000 0x0 0x10000>,
-			<0x0 0xc8834540 0x0 0x8>;
-		interrupts = <0 8 1>;
-		interrupt-names = "macirq";
-		clocks = <&clkc CLKID_ETH>,
-				<&clkc CLKID_FCLK_DIV2>,
-				<&clkc CLKID_MPLL2>;
-		clock-names = "stmmaceth", "clkin0", "clkin1";
-		phy-mode = "rgmii";
-	};
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 76fea2be66ac..ff1dc662a4e3 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -50,6 +50,11 @@ properties:
         - allwinner,sun8i-r40-emac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - amlogic,meson6-dwmac
+        - amlogic,meson8b-dwmac
+        - amlogic,meson8m2-dwmac
+        - amlogic,meson-gxbb-dwmac
+        - amlogic,meson-axg-dwmac
         - snps,dwmac
         - snps,dwmac-3.50a
         - snps,dwmac-3.610
-- 
2.22.0
