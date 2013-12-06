From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v7 3/3] mfd: max14577: Add device tree bindings document
Date: Fri, 06 Dec 2013 12:32:14 +0100
Message-ID: <1386329534-14186-4-git-send-email-k.kozlowski@samsung.com>
References: <1386329534-14186-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1386329534-14186-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Add document describing device tree bindings for MAX14577 MFD driver.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 Documentation/devicetree/bindings/mfd/max14577.txt |   65 ++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/max14577.txt

diff --git a/Documentation/devicetree/bindings/mfd/max14577.txt b/Documentation/devicetree/bindings/mfd/max14577.txt
new file mode 100644
index 000000000000..0b2449aaf8bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/max14577.txt
@@ -0,0 +1,65 @@
+Maxim MAX14577 Multi-Function Device
+
+MAX14577 is a Multi-Function Device with Micro-USB Interface Circuit, Li+
+Battery Charger and SFOUT LDO output for powering USB devices. It is
+interfaced to host controller using I2C.
+
+
+Required properties:
+- compatible : Must be "maxim,max14577".
+- reg : I2C slave address for the max14577 chip.
+- interrupts : IRQ line for the max14577 chip.
+- interrupt-parent :  The parent interrupt controller.
+
+
+Optional nodes:
+- max14577-muic :
+	Node used only by extcon consumers.
+	Required properties:
+		- compatible : "maxim,max14577-muic"
+
+- regulators :
+	Required properties:
+		- compatible : "maxim,max14577-regulator"
+
+	May contain a sub-node per regulator from the list below. Each
+	sub-node should contain the constraints and initialization information
+	for that regulator. See regulator.txt for a description of standard
+	properties for these sub-nodes.
+
+	List of valid regulator names: CHARGER, SAFEOUT.
+
+	The SAFEOUT is a fixed voltage regulator so there is no need to specify
+	voltages for it.
+
+
+Example:
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+max14577@25 {
+	compatible = "maxim,max14577";
+	reg = <0x25>;
+	interrupt-parent = <&gpx1>;
+	interrupts = <5 IRQ_TYPE_NONE>;
+
+	muic: max14577-muic {
+		compatible = "maxim,max14577-muic";
+	};
+
+	regulators {
+		compatible = "maxim,max14577-regulator";
+
+		safeout_reg: regulator@1 {
+			regulator-compatible = "SAFEOUT";
+			regulator-name = "SAFEOUT";
+		};
+		charger_reg: regulator@0 {
+			regulator-compatible = "CHARGER";
+			regulator-name = "CHARGER";
+			regulator-min-microamp = <90000>;
+			regulator-max-microamp = <950000>;
+			regulator-boot-on;
+		};
+	};
+};
-- 
1.7.9.5

