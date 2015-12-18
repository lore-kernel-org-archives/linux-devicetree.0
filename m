From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/3] ARM: dts: sun8i: Add Allwinner A83T dtsi
Date: Fri, 18 Dec 2015 21:30:50 +0800
Message-ID: <1450445451-311-3-git-send-email-vishnupatekar0510@gmail.com>
References: <1450445451-311-1-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBBLEV2CZQKGQEAPDMLAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1450445451-311-1-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner A83T is new octa-core cortex-a7 SOC.
This adds the basic dtsi, the clocks differs from
earlier sun8i SOCs.

Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 206 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-a83t.dtsi

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
new file mode 100644
index 0000000..e577c64
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -0,0 +1,206 @@
+/*
+ * Copyright 2015 Vishnu Patekar
+ *
+ * Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+
+ */
+
+#include "skeleton.dtsi"
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#include <dt-bindings/pinctrl/sun4i-a10.h>
+
+/ {
+	interrupt-parent = <&gic>;
+
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0>;
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <1>;
+		};
+
+		cpu@2 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <2>;
+		};
+
+		cpu@3 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <3>;
+		};
+		cpu@100 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0x100>;
+		};
+
+		cpu@101 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0x101>;
+		};
+		cpu@102 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0x102>;
+		};
+
+		cpu@103 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0x103>;
+		};
+	};
+
+	memory {
+		reg = <0x40000000 0x80000000>;
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		osc24M: osc24M_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "osc24M";
+		};
+
+		osc32k: osc32k_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+			clock-output-names = "osc32k";
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gic: interrupt-controller@01c81000 {
+			compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
+			reg = <0x01c81000 0x1000>,
+			      <0x01c82000 0x1000>,
+			      <0x01c84000 0x2000>,
+			      <0x01c86000 0x2000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		pio: pinctrl@01c20800 {
+			compatible = "allwinner,sun8i-a83t-pinctrl";
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x01c20800 0x400>;
+			clocks = <&osc24M>;
+			gpio-controller;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#gpio-cells = <3>;
+
+			mmc0_pins_a: mmc0@0 {
+				allwinner,pins = "PF0", "PF1", "PF2",
+						 "PF3", "PF4", "PF5";
+				allwinner,function = "mmc0";
+				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
+
+			uart0_pins_a: uart0@0 {
+				allwinner,pins = "PF2", "PF4";
+				allwinner,function = "uart0";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
+
+			uart0_pins_b: uart0@1 {
+				allwinner,pins = "PB9", "PB10";
+				allwinner,function = "uart0";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
+		};
+
+		uart0: serial@01c28000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28000 0x400>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&osc24M>;
+			status = "disabled";
+		};
+	};
+};
-- 
1.9.1
