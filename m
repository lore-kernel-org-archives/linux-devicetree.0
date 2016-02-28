From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 04/13] ARM: dts: sun8i-a83t: Add basic clocks
 and resets
Date: Sun, 28 Feb 2016 23:18:49 +0800
Message-ID: <1456672738-4993-5-git-send-email-vishnupatekar0510@gmail.com>
References: <1456672738-4993-1-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBBBVAZS3AKGQEADNHLXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1456672738-4993-1-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org
Cc: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds A83T system bus clocks, bus gates, and clock resets.

Three ahb reset registers are combined into one node.

Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 114 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index d3473f8..fa7ded5 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -146,6 +146,97 @@
 			clocks = <&osc16M>;
 			clock-output-names = "osc16M-d512";
 		};
+
+		pll6: clk@01c20028 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun9i-a80-pll4-clk";
+			reg = <0x01c20028 0x4>;
+			clocks = <&osc24M>;
+			clock-output-names = "pll6";
+		};
+
+		pll6d2: pll6d2_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clock-div = <2>;
+			clock-mult = <1>;
+			clocks = <&pll6>;
+			clock-output-names = "pll6d2";
+		};
+
+		ahb1: clk@01c20054 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun8i-a83t-ahb1-clk";
+			reg = <0x01c20054 0x4>;
+			clocks = <&osc16Md512>, <&osc24M>, <&pll6>, <&pll6>;
+			clock-output-names = "ahb1";
+		};
+
+		apb1: apb1_clk@01c20054 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun8i-a83t-apb1-clk";
+			reg = <0x01c20054 0x4>;
+			clocks = <&ahb1>;
+			clock-output-names = "apb1";
+		};
+
+		apb2: clk@01c20058 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-apb1-clk";
+			reg = <0x01c20058 0x4>;
+			clocks = <&osc16Md512>, <&osc24M>, <&pll6>, <&pll6>;
+			clock-output-names = "apb2";
+		};
+
+		ahb2: clk@01c2005c {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun8i-h3-ahb2-clk";
+			reg = <0x01c2005c 0x4>;
+			clocks = <&ahb1>, <&pll6d2>;
+			clock-output-names = "ahb2";
+		};
+
+		bus_gates: clk@01c20060 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun8i-a83t-bus-gates-clk";
+			reg = <0x01c20060 0x10>;
+			clocks = <&ahb1>, <&ahb2>, <&apb1>, <&apb2>;
+			clock-names = "ahb1", "ahb2", "apb1", "apb2";
+			clock-indices = <1>, <5>, <6>,
+					<8>, <9>, <10>,
+					<13>, <14>, <17>,
+					<19>, <20>,
+					<21>, <24>,
+					<26>, <27>,
+					<29>, <32>,
+					<36>, <37>,
+					<40>, <43>,
+					<44>, <52>, <53>,
+					<54>, <65>,
+					<69>, <76>, <77>,
+					<78>, <79>, <96>,
+					<97>, <98>,
+					<112>, <113>,
+					<114>, <115>,
+					<116>;
+			clock-output-names = "bus_mipidsi", "bus_ss", "bus_dma",
+					     "bus_mmc0", "bus_mmc1", "bus_mmc2",
+					     "bus_nand", "bus_sdram", "bus_emac",
+					     "bus_hstimer", "bus_spi0",
+					     "bus_spi1", "bus_usb_otg",
+					     "bus_ehci0", "bus_ehci1",
+					     "bus_ohci0", "bus_ve",
+					     "bus_lcd0", "bus_lcd1",
+					     "bus_csi", "bus_hdmi",
+					     "bus_de", "bus_gpu", "bus_msgbox",
+					     "bus_spinlock", "bus_spidf",
+					     "bus_pio", "bus_i2s0", "bus_i2s1",
+					     "bus_i2s2", "bus_tdm", "bus_i2c0",
+					     "bus_i2c1", "bus_i2c2",
+					     "bus_uart0", "bus_uart1",
+					     "bus_uart2", "bus_uart3",
+					     "bus_uart4";
+		};
 	};
 
 	soc {
@@ -160,7 +251,7 @@
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0x01c20800 0x400>;
-			clocks = <&osc24M>;
+			clocks = <&bus_gates 69>;
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
@@ -189,12 +280,31 @@
 			};
 		};
 
+		ahb_reset: reset@01c202c0 {
+			reg = <0x01c202c0 0xc>;
+			compatible = "allwinner,sun6i-a31-clock-reset";
+			#reset-cells = <1>;
+		};
+
+		apb1_reset: reset@01c202d0 {
+			reg = <0x01c202d0 0x4>;
+			compatible = "allwinner,sun6i-a31-clock-reset";
+			#reset-cells = <1>;
+		};
+
+		apb2_reset: reset@01c202d8 {
+			reg = <0x01c202d8 0x4>;
+			compatible = "allwinner,sun6i-a31-clock-reset";
+			#reset-cells = <1>;
+		};
+
 		timer@01c20c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x01c20c00 0xa0>;
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc24M>;
+			clocks = <&bus_gates 112>;
+			resets = <&apb2_reset 16>;
 		};
 
 		watchdog@01c20ca0 {
-- 
1.9.1
