Return-Path: <SRS0=ydIg=QG=denx.de=marex@kernel.org>
From: Marek Vasut <marex@denx.de>
Subject: [PATCH V4 01/10] input: touchscreen: ili210x: Add DT binding document
Date: Wed, 30 Jan 2019 07:48:26 +0100
Message-Id: <20190130064835.8418-2-marex@denx.de>
In-Reply-To: <20190130064835.8418-1-marex@denx.de>
References: <20190130064835.8418-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>, Olivier Sobrie <olivier@sobrie.be>, Philipp Puschmann <pp@emlix.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add DT binding document for the Ilitek ILI210x and ILI251x
touchscreen controllers.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Olivier Sobrie <olivier@sobrie.be>
Cc: Philipp Puschmann <pp@emlix.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-input@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
---
V2: New patch
V3: Replace touch@ with touchscreen@
V4: No change
---
 .../bindings/input/ilitek,ili2xxx.txt         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt

diff --git a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
new file mode 100644
index 000000000000..b2a76301e632
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
@@ -0,0 +1,25 @@
+Ilitek ILI210x/ILI251x touchscreen controller
+
+Required properties:
+- compatible:
+    ilitek,ili210x for ILI210x
+    ilitek,ili251x for ILI251x
+
+- reg: The I2C address of the device
+
+- interrupts: The sink for the touchscreen's IRQ output
+    See ../interrupt-controller/interrupts.txt
+
+Optional properties for main touchpad device:
+
+- reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
+
+Example:
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
+	};
-- 
2.19.2
