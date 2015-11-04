From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v3 2/6] Documentation: tps65086: Add DT bindings for the TPS65086 regulators
Date: Wed, 4 Nov 2015 11:12:11 -0600
Message-ID: <1446657135-7820-3-git-send-email-afd@ti.com>
References: <1446657135-7820-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446657135-7820-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

The TPS65086 PMIC contains several regulators and a GPO controller.
Add bindings for the TPS65086 regulators.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../bindings/regulator/tps65086-regulator.txt      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65086-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/tps65086-regulator.txt b/Documentation/devicetree/bindings/regulator/tps65086-regulator.txt
new file mode 100644
index 0000000..de7d2d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps65086-regulator.txt
@@ -0,0 +1,35 @@
+* TPS65086 regulator bindings
+
+Required properties:
+ - compatible		: Should be "ti,tps65086-regulator".
+ - list of regulators provided by this controller, must be named after their
+     hardware counterparts: buck[1-6], ldoa[1-3], swa1, swb[1-2], and vtt.
+
+Optional properties:
+ - Per-regulator optional properties are defined in regulator.txt.
+ - ti,regulator-step-size-25mv	: This is applicable for buck[1,2,6], set this
+				  if the regulator is factory set with a 25mv
+				  step voltage mapping.
+ - ti,regulator-decay		: This is applicable for buck[1-6], set this if
+				  the output needs to decay, default is for the
+				  output to slew down.
+
+Example:
+
+	regulators {
+		compatible = "ti,tps65086-regulator";
+
+		buck1 {
+			regulator-name = "vcc1";
+			regulator-min-microvolt = <1600000>;
+			regulator-max-microvolt = <1600000>;
+			regulator-boot-on;
+			ti,regulator-step-size-25mv;
+			ti,regulator-decay;
+		};
+
+		swa1 {
+			regulator-name = "ls1";
+			regulator-boot-on;
+		};
+	};
-- 
1.9.1
