From: Alexander Monakov <amonakov@ispras.ru>
Subject: [PATCH 1/2] regulator: 88pg86x: add DT bindings document
Date: Fri,  9 Mar 2018 01:53:02 +0300
Message-ID: <20180308225303.329-1-amonakov@ispras.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Monakov <amonakov@ispras.ru>
List-Id: devicetree@vger.kernel.org

The only device-specific node names are "buck1" and "buck2" for the two
regulators present on the device. Sleep mode GPIO and per-regulator GPIO
enable pins are not exposed (the driver does not support them either).

Signed-off-by: Alexander Monakov <amonakov@ispras.ru>
---
 .../devicetree/bindings/regulator/88pg86x.txt      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/88pg86x.txt

diff --git a/Documentation/devicetree/bindings/regulator/88pg86x.txt b/Documentation/devicetree/bindings/regulator/88pg86x.txt
new file mode 100644
index 000000000000..13b7f49a2ea8
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/88pg86x.txt
@@ -0,0 +1,22 @@
+Marvell 88PG867/88PG868 voltage regulators
+
+Required properties:
+- compatible: one of "marvell,88pg867", "marvell,88pg868";
+- reg: I2C slave address.
+
+Optional subnodes for regulators: "buck1", "buck2", using common regulator
+bindings given in <Documentation/devicetree/bindings/regulator/regulator.txt>.
+
+Example:
+
+	pg868@19 {
+		compatible = "marvell,88pg868";
+		reg = <0x19>;
+
+		vcpu: buck1 {
+			regulator-boot-on;
+			regulator-always-on;
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1350000>;
+		};
+	};
-- 
2.11.0
