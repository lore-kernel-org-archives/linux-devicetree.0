From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH v5 2/2] doc: dt: add documentation for lpc1850-creg-clk driver
Date: Thu,  3 Mar 2016 22:47:05 +0100
Message-ID: <1457041625-21163-3-git-send-email-manabian@gmail.com>
References: <1457041625-21163-1-git-send-email-manabian@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1457041625-21163-1-git-send-email-manabian@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for lpc1850-creg-clk driver.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/lpc1850-creg-clk.txt | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt b/Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
new file mode 100644
index 000000000000..6f1c7b4e4d2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
@@ -0,0 +1,52 @@
+* NXP LPC1850 CREG clocks
+
+The NXP LPC18xx/43xx CREG (Configuration Registers) block contains
+control registers for two low speed clocks. One of the clocks is a
+32 kHz oscillator driver with power up/down and clock gating. Next
+is a fixed divider that creates a 1 kHz clock from the 32 kHz osc.
+
+These clocks are used by the RTC and the Event Router peripherials.
+The 32 kHz can also be routed to other peripherials to enable low
+power modes.
+
+This binding uses the common clock binding:
+    Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible:
+	Should be "nxp,lpc1850-creg-clk"
+- #clock-cells:
+	Shall have value <1>.
+- clocks:
+	Shall contain a phandle to the fixed 32 kHz crystal.
+
+The creg-clk node must be a child of the creg syscon node.
+
+The following clocks are available from the clock node.
+
+Clock ID	Name
+   0		 1 kHz clock
+   1		32 kHz Oscillator
+
+Example:
+soc {
+	creg: syscon@40043000 {
+		compatible = "nxp,lpc1850-creg", "syscon", "simple-mfd";
+		reg = <0x40043000 0x1000>;
+
+		creg_clk: clock-controller {
+			compatible = "nxp,lpc1850-creg-clk";
+			clocks = <&xtal32>;
+			#clock-cells = <1>;
+		};
+
+		...
+	};
+
+	rtc: rtc@40046000 {
+		...
+		clocks = <&creg_clk 0>, <&ccu1 CLK_CPU_BUS>;
+		clock-names = "rtc", "reg";
+		...
+	};
+};
-- 
1.8.0

