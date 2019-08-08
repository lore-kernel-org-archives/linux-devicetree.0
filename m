From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 6/9] dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml
Date: Thu,  8 Aug 2019 10:51:36 +0200
Message-ID: <20190808085139.21438-7-narmstrong@baylibre.com>
References: <20190808085139.21438-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190808085139.21438-1-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, kishon@ti.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic G12A USB2 PHY over to a YAML schemas.

While the original phy bindings specifies phy-supply as required,
the examples and implementations makes it optional, thus phy-supply
is not in the required list of attributes.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../phy/amlogic,meson-g12a-usb2-phy.yaml      | 63 +++++++++++++++++++
 .../bindings/phy/meson-g12a-usb2-phy.txt      | 22 -------
 2 files changed, 63 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
new file mode 100644
index 000000000000..51254b4e65dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,meson-g12a-usb2-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic G12A USB2 PHY
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: xtal
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: phy
+
+  "#phy-cells":
+    const: 0
+
+  phy-supply:
+     maxItems: 1
+     description:
+       Phandle to a regulator that provides power to the PHY. This
+       regulator will be managed during the PHY power on/off sequence.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+examples:
+  - |
+    phy@36000 {
+          compatible = "amlogic,meson-g12a-usb2-phy";
+          reg = <0x36000 0x2000>;
+          clocks = <&xtal>;
+          clock-names = "xtal";
+          resets = <&phy_reset>;
+          reset-names = "phy";
+          #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
deleted file mode 100644
index a6ebc3dea159..000000000000
--- a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic G12A USB2 PHY binding
-
-Required properties:
-- compatible:	Should be "amlogic,meson-g12a-usb2-phy"
-- reg:		The base address and length of the registers
-- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
-- clocks:	a phandle to the clock of this PHY
-- clock-names:	must be "xtal"
-- resets:	a phandle to the reset line of this PHY
-- reset-names:	must be "phy"
-- phy-supply:	see phy-bindings.txt in this directory
-
-Example:
-	usb2_phy0: phy@36000 {
-		compatible = "amlogic,g12a-usb2-phy";
-		reg = <0x0 0x36000 0x0 0x2000>;
-		clocks = <&xtal>;
-		clock-names = "xtal";
-		resets = <&reset RESET_USB_PHY21>;
-		reset-names = "phy";
-		#phy-cells = <0>;
-	};
-- 
2.22.0
