From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] clk: max77620: Add DT binding doc for MAX77620 clock
Date: Fri, 10 Jun 2016 15:42:15 +0530
Message-ID: <1465553536-23838-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

MAXIM MAX77620 is the power management IC with multiple DCDC/LDO
regulators, RTC, GPIOs, Watchdog, 32KHz clock source etc.

Add DT binding doc for the details of the properties for MAX76620
clocks.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../devicetree/bindings/clock/clk-max77620.txt     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/clk-max77620.txt

diff --git a/Documentation/devicetree/bindings/clock/clk-max77620.txt b/Documentation/devicetree/bindings/clock/clk-max77620.txt
new file mode 100644
index 0000000..cda6ef7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/clk-max77620.txt
@@ -0,0 +1,31 @@
+* Maxim MAX77620 32KHz clocks *
+
+Maxim Power Management IC (PMIC) has clock output pins for 32KHz.
+
+This binding uses the common clock binding ./clock-bindings.txt.
+
+Required Properties:
+--------------------
+
+-#clock-cells : shall be set to 0.
+
+Example:
+
+#include <dt-bindings/mfd/max77620.h>
+...
+
+i2c@7000d000 {
+	spmic: max77620@3c {
+		compatible = "maxim,max77620";
+		:::::
+		#clock-cells = <0>;
+		:::
+       };
+};
+
+bluetooth {
+	compatible = "bcom,bluuetooth-device";
+	clocks = <&smic>;
+	clock-names = "in-32k";
+	:::
+};
-- 
2.1.4
