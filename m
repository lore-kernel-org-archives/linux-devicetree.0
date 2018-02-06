From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 01/10] dt-bindings: add binding for the SY8106A voltage regulator
Date: Tue,  6 Feb 2018 12:48:56 +0800
Message-ID: <20180206044905.30508-2-icenowy@aosc.io>
References: <20180206044905.30508-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180206044905.30508-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, Ondrej Jirman <megous@megous.com>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

SY8106A is an I2C-controlled adjustable voltage regulator made by
Silergy Corp.

Add its device tree binding.

Signed-off-by: Ondrej Jirman <megous@megous.com>
[Icenowy: Change commit message and slight fixes]
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
- Added Chen-Yu's Reviewed tag and Rob's ACK tag.
- Specify regulator.txt's directory.

 .../bindings/regulator/sy8106a-regulator.txt         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt b/Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt
new file mode 100644
index 000000000000..82384579b5ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt
@@ -0,0 +1,20 @@
+SY8106A Voltage regulator
+
+Required properties:
+- compatible: Must be "silergy,sy8106a"
+- reg: I2C slave address - must be <0x65>
+
+Any property defined as part of the core regulator binding, defined in
+./regulator.txt, can also be used.
+
+Example:
+
+	sy8106a {
+		compatible = "silergy,sy8106a";
+		reg = <0x65>;
+		regulator-name = "sy8106a-vdd";
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
-- 
2.15.1
