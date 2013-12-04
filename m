From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v6 3/3] mfd: max14577: Add device tree bindings document
Date: Wed, 04 Dec 2013 11:40:15 +0100
Message-ID: <1386153615-25456-4-git-send-email-k.kozlowski@samsung.com>
References: <1386153615-25456-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1386153615-25456-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Add document describing device tree bindings for MAX14577 MFD driver.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 Documentation/devicetree/bindings/mfd/max14577.txt |   48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/max14577.txt

diff --git a/Documentation/devicetree/bindings/mfd/max14577.txt b/Documentation/devicetree/bindings/mfd/max14577.txt
new file mode 100644
index 000000000000..f4fd16360b6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/max14577.txt
@@ -0,0 +1,48 @@
+MAXIM MAX14577 multi-function device
+
+MAX14577 is a Multi-function device with Micro-USB Interface Circuit, Li+
+Battery Charger and SFOUT LDO output for powering USB devices. It is
+interfaced to host controller using I2C.
+
+Required properties:
+- compatible : Must be "maxim,max14577".
+- reg : I2C slave address for the max14577 chip.
+- interrupts : IRQ line for the max14577 chip.
+- interrupt-parent :  The parent interrupt controller.
+
+Optional nodes:
+- regulators :
+  Required child node properties:
+  - compatible : "maxim,max14577-regulator"
+
+  Optional child nodes:
+    Each child node representing a regulator, following standard regulator
+    bindings. Valid names for a regulator are: "CHARGER" and "SAFEOUT".
+    The SAFEOUT is a constant voltage regulator so there is no need to specify
+    voltages for it.
+
+	[*] refer Documentation/devicetree/bindings/regulator/regulator.txt
+
+Example:
+	max14577@25 {
+		compatible = "maxim,max14577";
+		reg = <0x25>;
+		interrupt-parent = <&gpx1>;
+		interrupts = <5 0>;
+
+		regulators {
+			compatible = "maxim,max14577-regulator";
+
+			safeout_reg: safeout@1 {
+				regulator-compatible = "SAFEOUT";
+				regulator-name = "SAFEOUT";
+			};
+			charger_reg: charger@0 {
+				regulator-compatible = "CHARGER";
+				regulator-name = "CHARGER";
+				regulator-min-microamp = <90000>;
+				regulator-max-microamp = <950000>;
+				regulator-boot-on;
+			};
+		};
+	};
-- 
1.7.9.5
