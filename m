From: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: ARTPEC-6: Add pinctrl configuration
Date: Thu, 30 Mar 2017 13:33:49 +0200
Message-ID: <20170330113349.GG29118@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jesper Nilsson <jespern-VrBV9hrLPhE@public.gmane.org>, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>, Niklas Cassel <niklass-VrBV9hrLPhE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable the pinctrl driver for ARTPEC-6 in the artpec6.dtsi
with all main pinmux functions.
Add pinctrl information to the relevant (uart) nodes.

Signed-off-by: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>
---
 arch/arm/boot/dts/artpec6.dtsi | 87 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
index 767cbe8..471eaee 100644
--- a/arch/arm/boot/dts/artpec6.dtsi
+++ b/arch/arm/boot/dts/artpec6.dtsi
@@ -181,6 +181,85 @@
 		status = "disabled";
 	};
 
+	pinctrl: pinctrl@f801d000 {
+		compatible = "axis,artpec6-pinctrl";
+		reg = <0xf801d000 0x400>;
+
+		pinctrl_uart0: uart0grp {
+			function = "uart0";
+			groups = "uart0grp1";
+			bias-pull-up;
+		};
+		pinctrl_uart1: uart1grp {
+			function = "uart1";
+			groups = "uart1grp0";
+			bias-pull-up;
+		};
+		pinctrl_uart2: uart2grp {
+			function = "uart2";
+			groups = "uart2grp1";
+			bias-pull-up;
+		};
+		pinctrl_uart3: uart3grp {
+			function = "uart3";
+			groups = "uart3grp0";
+			bias-pull-up;
+		};
+		pinctrl_uart4: uart4grp {
+			function = "uart4";
+			groups = "uart4grp0";
+			bias-pull-up;
+		};
+		pinctrl_uart5: uart5grp {
+			function = "uart5";
+			groups = "uart5grp0";
+			bias-pull-up;
+		};
+		pinctrl_i2c1: i2c1grp {
+			function = "i2c1";
+			groups = "i2c1grp0";
+			bias-pull-up;
+		};
+		pinctrl_i2c2: i2c2grp {
+			function = "i2c2";
+			groups = "i2c2grp0";
+			bias-pull-up;
+		};
+		pinctrl_i2c3: i2c3grp {
+			function = "i2c3";
+			groups = "i2c3grp0";
+			bias-pull-up;
+		};
+		pinctrl_i2s0: i2s0grp {
+			function = "i2s0";
+			groups = "i2s0grp0";
+			bias-pull-up;
+		};
+		pinctrl_i2s1: i2s1grp {
+			function = "i2s1";
+			groups = "i2s1grp0";
+			bias-pull-up;
+		};
+		pinctrl_spi0: spi0grp {
+			function = "spi0";
+			groups = "spi0grp0";
+			bias-pull-up;
+		};
+		pinctrl_spi1: spi1grp {
+			function = "spi1";
+			groups = "spi1grp0";
+			bias-pull-up;
+		};
+		pinctrl_sdio0: sdio0grp {
+			function = "sdio0";
+			groups = "sdio0grp0";
+		};
+		pinctrl_sdio1: sdio1grp {
+			function = "sdio1";
+			groups = "sdio1grp0";
+		};
+	};
+
 	amba@0 {
 		compatible = "simple-bus";
 		#address-cells = <0x1>;
@@ -214,6 +293,8 @@
 			clocks = <&clkctrl ARTPEC6_CLK_UART_REFCLK>,
 				<&clkctrl ARTPEC6_CLK_UART_PCLK>;
 			clock-names = "uart_clk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_uart0>;
 			status = "disabled";
 		};
 		uart1: serial@f8037000 {
@@ -223,6 +304,8 @@
 			clocks = <&clkctrl ARTPEC6_CLK_UART_REFCLK>,
 				<&clkctrl ARTPEC6_CLK_UART_PCLK>;
 			clock-names = "uart_clk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_uart1>;
 			status = "disabled";
 		};
 		uart2: serial@f8038000 {
@@ -232,6 +315,8 @@
 			clocks = <&clkctrl ARTPEC6_CLK_UART_REFCLK>,
 				<&clkctrl ARTPEC6_CLK_UART_PCLK>;
 			clock-names = "uart_clk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_uart2>;
 			status = "disabled";
 		};
 		uart3: serial@f8039000 {
@@ -241,6 +326,8 @@
 			clocks = <&clkctrl ARTPEC6_CLK_UART_REFCLK>,
 				<&clkctrl ARTPEC6_CLK_UART_PCLK>;
 			clock-names = "uart_clk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_uart3>;
 			status = "disabled";
 		};
 	};
-- 
2.1.4

Reply-To: 


/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson-VrBV9hrLPhE@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
