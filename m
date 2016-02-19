From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH v2 1/2] clk: add device tree binding for Artpec-6 clock controller
Date: Fri, 19 Feb 2016 15:30:14 +0100
Message-ID: <fd330ff1346758966260cb2bcddd8d3fbff49704.1455891890.git.larper@axis.com>
References: <cover.1455891890.git.larper@axis.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1455891890.git.larper@axis.com>
In-Reply-To: <cover.1455891890.git.larper@axis.com>
References: <cover.1455891890.git.larper@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

Add device tree documentation for the main clock controller in the
Artpec-6 SoC.

Signed-off-by: Lars Persson <larper@axis.com>
---
 .../devicetree/bindings/clock/artpec6.txt          | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt

diff --git a/Documentation/devicetree/bindings/clock/artpec6.txt b/Documentation/devicetree/bindings/clock/artpec6.txt
new file mode 100644
index 0000000..76e3e7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/artpec6.txt
@@ -0,0 +1,41 @@
+* Clock bindings for Axis ARTPEC-6 chip
+
+The bindings are based on the clock provider binding in
+Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+External clocks:
+----------------
+
+There are two external inputs to the main clock controller which should be
+provided using the common clock bindings.
+- "sys_refclk": External 50 Mhz oscillator (required)
+- "i2s_refclk": Alternate audio reference clock (optional).
+
+Main clock controller
+---------------------
+
+Required properties:
+- #clock-cells: Should be <1>
+  See dt-bindings/clock/axis,artpec6-clkctrl.h for the list of valid identifiers.
+- compatible: Should be "axis,artpec6-clkctrl"
+- reg: Must contain the base address and length of the system controller
+- clocks:  Must contain a phandle entry for each clock in clock-names
+- clock-names: Must include the external oscillator ("sys_refclk"). Optional
+  ones are the audio reference clock ("i2s_refclk") and the audio fractional
+  divider ("frac_clk").
+
+Examples:
+
+ext_clk: ext_clk {
+	#clock-cells = <0>;
+	compatible = "fixed-clock";
+	clock-frequency = <50000000>;
+};
+
+clkctrl: clkctrl {
+	#clock-cells = <1>;
+	compatible = "axis,artpec6-clkctrl";
+	reg = <0xf8000000 0x48>;
+	clocks = <&ext_clk>;
+	clock-names = "sys_refclk";
+};
-- 
2.1.4
