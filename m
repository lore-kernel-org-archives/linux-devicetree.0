From: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>
Subject: [PATCH 1/3] pinctrl: Add bindings for ARTPEC-6 pinmux
Date: Thu, 30 Mar 2017 13:27:44 +0200
Message-ID: <20170330112744.GE29118@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jesper Nilsson <jespern-VrBV9hrLPhE@public.gmane.org>, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>, Niklas Cassel <niklass-VrBV9hrLPhE@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the bindings for the pinmux functions in the
ARTPEC-6 SoC, including bias and drive strength.

Signed-off-by: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>
---
 .../bindings/pinctrl/axis,artpec6-pinctrl.txt      | 85 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
new file mode 100644
index 0000000..47284f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
@@ -0,0 +1,85 @@
+Axis ARTPEC-6 Pin Controller
+
+Required properties:
+- compatible: "axis,artpec6-pinctrl".
+- reg: Should contain the register physical address and length for the pin
+       controller.
+
+A pinctrl node should contain at least one subnode representing the pinctrl
+groups available on the machine. Each subnode will list the mux function
+required and what pin group it will use. Each subnode will also configure the
+drive strength and bias pullup of the pin group. If either of these options is
+not set, its actual value will be unspecified.
+
+
+Required subnode-properties:
+- function: Function to mux.
+- groups: Name of the pin group to use for the function above.
+
+	Available functions and groups (function: group0, group1...):
+		gpio: cpuclkoutgrp0, udlclkoutgrp0, i2c1grp0, i2c2grp0,
+		      i2c3grp0, i2s0grp0, i2s1grp0, i2srefclkgrp0, spi0grp0,
+		      spi1grp0, pciedebuggrp0, uart0grp0, uart0grp1, uart1grp0,
+		      uart2grp0, uart2grp1, uart3grp0, uart4grp0, uart5grp0
+		cpuclkout: cpuclkoutgrp0
+		udlclkout: udlclkoutgrp0
+		i2c1: i2c1grp0
+		i2c2: i2c2grp0
+		i2c3: i2c3grp0
+		i2s0: i2s0grp0
+		i2s1: i2s1grp0
+		i2srefclk: i2srefclkgrp0
+		spi0: spi0grp0
+		spi1: spi1grp0
+		pciedebug: pciedebuggrp0
+		uart0: uart0grp0, uart0grp1
+		uart1: uart1grp0
+		uart2: uart2grp0, uart2grp1
+		uart3: uart3grp0
+		uart4: uart4grp0
+		uart5: uart5grp0
+		nand: nandgrp0
+		sdio0: sdio0grp0
+		sdio1: sdio1grp0
+		ethernet: ethernetgrp0
+
+
+Optional subnode-properties (see pinctrl-bindings.txt):
+- drive-strength: 4, 6, 8, 9 mA.  For SD and NAND pins, this is for 3.3V VCCQ3.
+- bias-pull-up
+- bias-disable
+
+Examples:
+pinctrl@f801d000 {
+	compatible = "axis,artpec6-pinctrl";
+	reg = <0xf801d000 0x400>;
+
+	pinctrl_uart0: uart0grp {
+		function = "uart0";
+		groups = "uart0grp0";
+		drive-strength = <4>;
+		bias-pull-up;
+	};
+	pinctrl_uart3: uart3grp {
+		function = "uart3";
+		groups = "uart3grp0";
+	};
+};
+uart0: uart@f8036000 {
+	compatible = "arm,pl011", "arm,primecell";
+	reg = <0xf8036000 0x1000>;
+	interrupts = <0 104 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&pll2div24>, <&apb_pclk>;
+	clock-names = "uart_clk", "apb_pclk";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart0>;
+};
+uart3: uart@f8039000 {
+	compatible = "arm,pl011", "arm,primecell";
+	reg = <0xf8039000 0x1000>;
+	interrupts = <0 128 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&pll2div24>, <&apb_pclk>;
+	clock-names = "uart_clk", "apb_pclk";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index 1b0a87f..7563bd6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1088,6 +1088,7 @@ L:	linux-arm-kernel-VrBV9hrLPhE@public.gmane.org
 F:	arch/arm/mach-artpec
 F:	arch/arm/boot/dts/artpec6*
 F:	drivers/clk/axis
+F:	Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
 
 ARM/ASPEED MACHINE SUPPORT
 M:	Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
-- 
2.1.4


/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson-VrBV9hrLPhE@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
