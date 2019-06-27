From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v4 07/13] dt-bindings: net: sun4i-mdio: Convert the binding to a schemas
Date: Thu, 27 Jun 2019 17:31:49 +0200
Message-ID: <ad9a748f0876a63142803c80287148589ab37677.1561649505.git-series.maxime.ripard@bootlin.com>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Switch our Allwinner A10 MDIO controller binding to a YAML schema to enable
the DT validation.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt      | 27 ---------------------------
 2 files changed, 70 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
new file mode 100644
index 000000000000..df24d9d969f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 MDIO Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+allOf:
+  - $ref: "mdio.yaml#"
+
+# Select every compatible, including the deprecated ones. This way, we
+# will be able to report a warning when we have that compatible, since
+# we will validate the node thanks to the select, but won't report it
+# as a valid value in the compatible property description
+select:
+  properties:
+    compatible:
+      enum:
+        - allwinner,sun4i-a10-mdio
+
+        # Deprecated
+        - allwinner,sun4i-mdio
+
+  required:
+    - compatible
+
+properties:
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  compatible:
+    const: allwinner,sun4i-a10-mdio
+
+  reg:
+    maxItems: 1
+
+  phy-supply:
+    description: PHY regulator
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    mdio@1c0b080 {
+        compatible = "allwinner,sun4i-a10-mdio";
+        reg = <0x01c0b080 0x14>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        phy-supply = <&reg_emac_3v3>;
+
+        phy0: ethernet-phy@0 {
+            reg = <0>;
+        };
+    };
+
+# FIXME: We should set it, but it would report all the generic
+# properties as additional properties.
+# additionalProperties: false
+
+...
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt b/Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt
deleted file mode 100644
index ab5b8613b0ef..000000000000
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Allwinner A10 MDIO Ethernet Controller interface
-
-Required properties:
-- compatible: should be "allwinner,sun4i-a10-mdio"
-              (Deprecated: "allwinner,sun4i-mdio").
-- reg: address and length of the register set for the device.
-
-Optional properties:
-- phy-supply: phandle to a regulator if the PHY needs one
-
-Example at the SoC level:
-mdio@1c0b080 {
-	compatible = "allwinner,sun4i-a10-mdio";
-	reg = <0x01c0b080 0x14>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-};
-
-And at the board level:
-
-mdio@1c0b080 {
-	phy-supply = <&reg_emac_3v3>;
-
-	phy0: ethernet-phy@0 {
-		reg = <0>;
-	};
-};
-- 
git-series 0.9.1
