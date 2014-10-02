From: <atull@opensource.altera.com>
Subject: [PATCH v5 1/4] hwmon: ltc2978: device tree bindings documentation
Date: Thu, 2 Oct 2014 13:37:48 -0500
Message-ID: <1412275071-6417-2-git-send-email-atull@opensource.altera.com>
References: <1412275071-6417-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412275071-6417-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@roeck-us.net, jdelvare@suse.de
Cc: lm-sensors@lm-sensors.org, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add device tree bindings documentation for ltc2978.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v2: clean whitespace
---
 .../devicetree/bindings/hwmon/ltc2978.txt          |   41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ltc2978.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ltc2978.txt b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
new file mode 100644
index 0000000..b2d9c4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
@@ -0,0 +1,41 @@
+ltc2978
+
+Required properties:
+ - compatible: one of: ltc2974, ltc2977, ltc2978, ltc3880, ltc3883, ltm4676
+ - reg: I2C address
+
+Optional properties:
+ Name of the optional regulator subnode must be "regulators".
+  - #address-cells must be 1.
+  - #size-cells must be 0.
+
+ For each regulator:
+  - reg: regulator number
+  - regulator-compatible: must be vout_en<regulator number> such as vout_en3
+    valid range is:
+      ltc2977, ltc2978 : vout_en0 - vout_en7
+      ltc2974          : vout_en0 - vout_en3
+      ltc3880, ltm4676 : vout_en0 - vout_en1
+      ltc3883          : vout_en0 only
+  - regulator-name: arbitrary name for regulator
+
+Example:
+ltc2978@5e {
+	compatible = "ltc2978";
+	reg = <0x5e>;
+	regulators {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdacp0_reg: regulator@0 {
+			reg = <0>;
+			regulator-compatible = "vout_en0";
+			regulator-name = "FPGA-2.5V";
+		};
+		vdacp2_reg: regulator@2 {
+			reg = <2>;
+			regulator-compatible = "vout_en2";
+			regulator-name = "FPGA-1.5V";
+		};
+	};
+};
-- 
1.7.9.5
