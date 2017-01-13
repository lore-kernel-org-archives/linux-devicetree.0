From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] clk: ux500: Add device tree bindings for ABx500 clocks
Date: Fri, 13 Jan 2017 16:08:26 +0100
Message-ID: <20170113150826.30202-1-linus.walleij@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the ABx500 clocks on the
ST-Ericsson platforms.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/clock/stericsson,abx500.txt         | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/stericsson,abx500.txt

diff --git a/Documentation/devicetree/bindings/clock/stericsson,abx500.txt b/Documentation/devicetree/bindings/clock/stericsson,abx500.txt
new file mode 100644
index 000000000000..8764d80e3412
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/stericsson,abx500.txt
@@ -0,0 +1,13 @@
+Clock bindings for ST-Ericsson ABx500 clocks
+
+Required properties :
+- compatible : shall contain the following:
+  "stericsson,ab8500-clk"
+- #clock-cells should be <1>
+
+Example:
+
+ab8500_clock: ab8500-clock {
+	compatible = "stericsson,ab8500-clk";
+	#clock-cells = <1>;
+};
-- 
2.9.3

