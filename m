From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 3/4] ARM: sunxi: Add Allwinner A23 dtsi
Date: Fri, 20 Jun 2014 22:52:52 +0800
Message-ID: <1403275973-24259-4-git-send-email-wens@csie.org>
References: <1403275973-24259-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBU4VSGOQKGQEVHGOCUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1403275973-24259-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Allwinner A23 is a tablet oriented SoC with 2 Cortex-A7 cores
and a Mali-400MP2 GPU.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a23.dtsi | 160 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-a23.dtsi

diff --git a/arch/arm/boot/dts/sun8i-a23.dtsi b/arch/arm/boot/dts/sun8i-a23.dtsi
new file mode 100644
index 0000000..ac5f69a
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-a23.dtsi
@@ -0,0 +1,160 @@
+/*
+ * Copyright 2014 Chen-Yu Tsai
+ *
+ * Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/include/ "skeleton.dtsi"
+
+/ {
+	interrupt-parent = <&gic>;
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &r_uart;
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
+	};
+
+	memory {
+		reg = <0x40000000 0x40000000>;
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
+	soc@01c00000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		timer@01c20c00 {
+			compatible = "allwinner,sun4i-a10-timer";
+			reg = <0x01c20c00 0xa0>;
+			interrupts = <0 18 4>,
+				     <0 19 4>;
+			clocks = <&osc24M>;
+		};
+
+		wdt0: watchdog@01c20ca0 {
+			compatible = "allwinner,sun6i-a31-wdt";
+			reg = <0x01c20ca0 0x20>;
+			interrupts = <0 25 4>;
+		};
+
+		uart0: serial@01c28000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28000 0x400>;
+			interrupts = <0 0 4>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&osc24M>;
+			status = "disabled";
+		};
+
+		uart1: serial@01c28400 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28400 0x400>;
+			interrupts = <0 1 4>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&osc24M>;
+			status = "disabled";
+		};
+
+		uart2: serial@01c28800 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28800 0x400>;
+			interrupts = <0 2 4>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&osc24M>;
+			status = "disabled";
+		};
+
+		uart3: serial@01c28c00 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28c00 0x400>;
+			interrupts = <0 3 4>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&osc24M>;
+			status = "disabled";
+		};
+
+		uart4: serial@01c29000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c29000 0x400>;
+			interrupts = <0 4 4>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&osc24M>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@01c81000 {
+			compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
+			reg = <0x01c81000 0x1000>,
+			      <0x01c82000 0x1000>,
+			      <0x01c84000 0x2000>,
+			      <0x01c86000 0x2000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupts = <1 9 0xf04>;
+		};
+
+		r_uart: serial@01f02800 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01f02800 0x400>;
+			interrupts = <0 38 4>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&osc24M>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.0.0
