From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH 1/2] clk: add device tree binding for artpec-6 pll1 clock
Date: Thu, 11 Feb 2016 17:01:03 +0100
Message-ID: <2686b3bbb9ec1c86828b365645bd7f997a9780b4.1455206007.git.larper@axis.com>
References: <cover.1455206007.git.larper@axis.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <cover.1455206007.git.larper@axis.com>
In-Reply-To: <cover.1455206007.git.larper@axis.com>
References: <cover.1455206007.git.larper@axis.com>
Sender: linux-clk-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

Add device tree documentation for the main PLL in the Artpec-6 SoC.

Signed-off-by: Lars Persson <larper@axis.com>
---
 Documentation/devicetree/bindings/clock/artpec6.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt

diff --git a/Documentation/devicetree/bindings/clock/artpec6.txt b/Documentation/devicetree/bindings/clock/artpec6.txt
new file mode 100644
index 0000000..521fec8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/artpec6.txt
@@ -0,0 +1,16 @@
+* Clock bindings for Axis ARTPEC-6 chip
+
+Required properties:
+- #clock-cells: Should be <0>
+- compatible: Should be "axis,artpec6-pll1-clock"
+- reg: Address and length of the DEVSTAT register.
+- clocks: The PLL's input clock.
+
+Examples:
+
+pll1_clk: pll1_clk {
+	#clock-cells = <0>;
+	compatible = "axis,artpec6-pll1-clock";
+	reg = <0xf8000000 4>;
+	clocks = <&ext_clk>;
+};
-- 
2.1.4

