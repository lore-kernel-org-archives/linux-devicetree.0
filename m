From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3 v2] clk: ux500: Add device tree bindings for ABx500 clocks
Date: Fri, 20 Jan 2017 14:25:39 +0100
Message-ID: <20170120132539.3013-1-linus.walleij@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the ABx500 clocks on the
ST-Ericsson platforms.

Cc: devicetree@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Indicate that the abx500 clocks need to be in a device tree
  node under an ABx500 MFD device.
- Rename the example node to clock-controller.
---
 .../devicetree/bindings/clock/stericsson,abx500.txt  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/stericsson,abx500.txt

diff --git a/Documentation/devicetree/bindings/clock/stericsson,abx500.txt b/Documentation/devicetree/bindings/clock/stericsson,abx500.txt
new file mode 100644
index 000000000000..dbaa886b223e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/stericsson,abx500.txt
@@ -0,0 +1,20 @@
+Clock bindings for ST-Ericsson ABx500 clocks
+
+Required properties :
+- compatible : shall contain the following:
+  "stericsson,ab8500-clk"
+- #clock-cells should be <1>
+
+The ABx500 clocks need to be placed as a subnode of an AB8500
+device node, see mfd/ab8500.txt
+
+All available clocks are defined as preprocessor macros in
+dt-bindings/clock/ste-ab8500.h header and can be used in device
+tree sources.
+
+Example:
+
+clock-controller {
+	compatible = "stericsson,ab8500-clk";
+	#clock-cells = <1>;
+};
-- 
2.9.3

