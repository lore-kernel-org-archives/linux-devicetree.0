Return-Path: <SRS0=Mkof=PZ=opensource.cirrus.com=ckeepax@kernel.org>
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v6 2/6] clk: lochnagar: Add initial binding documentation
Date: Thu, 17 Jan 2019 14:58:54 +0000
Message-ID: <20190117145858.26659-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190117145858.26659-1-ckeepax@opensource.cirrus.com>
References: <20190117145858.26659-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
To: lee.jones@linaro.org, sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linus.walleij@linaro.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Lochnagar is an evaluation and development board for Cirrus
Logic Smart CODEC and Amp devices. It allows the connection of
most Cirrus Logic devices on mini-cards, as well as allowing
connection of various application processor systems to provide a
full evaluation platform. This driver supports the board
controller chip on the Lochnagar board.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v5:
 - Add missing 8m fixed clock

Thanks,
Charles

 .../devicetree/bindings/clock/cirrus,lochnagar.txt | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt

diff --git a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
new file mode 100644
index 000000000000..b8d8ef3bdc5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
@@ -0,0 +1,93 @@
+Cirrus Logic Lochnagar Audio Development Board
+
+Lochnagar is an evaluation and development board for Cirrus Logic
+Smart CODEC and Amp devices. It allows the connection of most Cirrus
+Logic devices on mini-cards, as well as allowing connection of
+various application processor systems to provide a full evaluation
+platform.  Audio system topology, clocking and power can all be
+controlled through the Lochnagar, allowing the device under test
+to be used in a variety of possible use cases.
+
+This binding document describes the binding for the clock portion of
+the driver.
+
+Also see these documents for generic binding information:
+  [1] Clock : ../clock/clock-bindings.txt
+
+And these for relevant defines:
+  [2] include/dt-bindings/clock/lochnagar.h
+
+This binding must be part of the Lochnagar MFD binding:
+  [3] ../mfd/cirrus,lochnagar.txt
+
+Required properties:
+
+  - compatible : One of the following strings:
+                 "cirrus,lochnagar1-clk"
+                 "cirrus,lochnagar2-clk"
+
+  - #clock-cells : Must be 1. The first cell indicates the clock
+    number, see [2] for available clocks and [1].
+
+Optional properties:
+
+  - clocks : Must contain an entry for each clock in clock-names.
+  - clock-names : May contain entries for each of the following
+    clocks:
+     - ln-cdc-clkout : Output clock from CODEC card.
+     - ln-dsp-clkout : Output clock from DSP card.
+     - ln-gf-mclk1,ln-gf-mclk2,ln-gf-mclk3,ln-gf-mclk4 : Optional
+       input audio clocks from host system.
+     - ln-psia1-mclk, ln-psia2-mclk : Optional input audio clocks from
+       external connector.
+     - ln-spdif-clkout : Optional input audio clock from SPDIF.
+     - ln-adat-mclk : Optional input audio clock from ADAT.
+     - ln-pmic-32k : On board fixed clock.
+     - ln-clk-12m : On board fixed clock.
+     - ln-clk-11m : On board fixed clock.
+     - ln-clk-24m : On board fixed clock.
+     - ln-clk-22m : On board fixed clock.
+     - ln-clk-8m : On board fixed clock.
+     - ln-usb-clk-24m : On board fixed clock.
+     - ln-usb-clk-12m : On board fixed clock.
+
+  - assigned-clocks : A list of Lochnagar clocks to be reparented, see
+    [2] for available clocks.
+  - assigned-clock-parents : Parents to be assigned to the clocks
+    listed in "assigned-clocks".
+
+Optional nodes:
+
+  - fixed-clock nodes may be registered for the following on board clocks:
+     - ln-pmic-32k : 32768 Hz
+     - ln-clk-12m : 12288000 Hz
+     - ln-clk-11m : 11298600 Hz
+     - ln-clk-24m : 24576000 Hz
+     - ln-clk-22m : 22579200 Hz
+     - ln-clk-8m : 8192000 Hz
+     - ln-usb-clk-24m : 24576000 Hz
+     - ln-usb-clk-12m : 12288000 Hz
+
+Example:
+
+lochnagar {
+	lochnagar-clk {
+		compatible = "cirrus,lochnagar2-clk";
+
+		#clock-cells = <1>;
+
+		clocks = <&clk-audio>, <&clk_pmic>;
+		clock-names = "ln-gf-mclk2", "ln-pmic-32k";
+
+		assigned-clocks = <&lochnagar-clk LOCHNAGAR_CDC_MCLK1>,
+				  <&lochnagar-clk LOCHNAGAR_CDC_MCLK2>;
+		assigned-clock-parents = <&clk-audio>,
+					 <&clk-pmic>;
+	};
+
+	clk-pmic: clk-pmic {
+		compatible = "fixed-clock";
+		clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+};
-- 
2.11.0
