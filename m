From: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v0 13/15] ARM: STi: DT: STiH416: 416 DT Entry for clockgen A9/DDR/GPU
Date: Thu, 27 Feb 2014 16:24:26 +0100
Message-ID: <1393514668-17440-14-git-send-email-gabriel.fernandez@st.com>
References: <1393514668-17440-1-git-send-email-gabriel.fernandez@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393514668-17440-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Patch adds DT entries for clockgen A9/DDR/GPU

Signed-off-by: Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stih416-clock.dtsi | 79 ++++++++++++++++++++++++++++++++----
 1 file changed, 70 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/stih416-clock.dtsi b/arch/arm/boot/dts/stih416-clock.dtsi
index 6b2e387..5ff0e6f 100644
--- a/arch/arm/boot/dts/stih416-clock.dtsi
+++ b/arch/arm/boot/dts/stih416-clock.dtsi
@@ -26,15 +26,6 @@
 		};
 
 		/*
-		 * ARM Peripheral clock for timers
-		 */
-		arm_periph_clk: arm_periph_clk {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <600000000>;
-		};
-
-		/*
 		 * ClockGenAs on SASG2
 		 */
 		clockgenA@fee62000 {
@@ -503,6 +494,44 @@
 						/* Remaining outputs unused */
 			};
 		};
+
+		/*
+		 * A9 PLL.
+		 *
+		 */
+		clockgenA9 {
+			reg = <0xfdde08b0 0x70>;
+
+			CLOCKGEN_A9_PLL: CLOCKGEN_A9_PLL {
+				#clock-cells = <1>;
+				compatible = "st,stih416-plls-c32-a9", "st,clkgen-plls-c32";
+
+				clocks = <&CLK_SYSIN>;
+				clock-output-names = "CLOCKGEN_A9_PLL_ODF";
+			};
+		};
+
+		/*
+		 * ARM CPU related clocks.
+		 */
+		CLK_M_A9: CLK_M_A9 {
+			#clock-cells = <0>;
+			compatible = "st,stih416-clkgen-a9-mux", "st,clkgen-mux";
+			reg = <0xfdde08ac 0x4>;
+			clocks = <&CLOCKGEN_A9_PLL 0>, <&CLOCKGEN_A9_PLL 0>, <&CLK_M_A0_DIV1 2>, <&CLK_M_A9_EXT2F_DIV2>;
+		};
+
+		/*
+		 * ARM Peripheral clock for timers
+		 */
+		arm_periph_clk: CLK_M_A9_PERIPHS {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&CLK_M_A9>;
+			clock-div = <2>;
+			clock-mult = <1>;
+		};
+
                 /*
                  * Frequency synthesizers on the SASG2.
                  *
@@ -673,5 +702,37 @@
                                 "CLK_M_XFER_AUX_COMPO", "CLK_M_VSENS",
                                 "CLK_M_PIX_HDMIRX_0",   "CLK_M_PIX_HDMIRX_1";
                 };
+
+		/*
+		 * DDR PLL.
+		 *
+		 */
+		clockgenDDR {
+			reg = <0xfdde07d8 0x110>;
+
+			CLOCKGEN_DDR_PLL: CLOCKGEN_DDR_PLL {
+				#clock-cells = <1>;
+				compatible = "st,stih416-plls-c32-ddr", "st,clkgen-plls-c32";
+
+				clocks = <&CLK_SYSIN>;
+				clock-output-names = "CLOCKGEN_DDR0", "CLOCKGEN_DDR1";
+			};
+		};
+
+		/*
+		 * GPU PLL.
+		 *
+		 */
+		clockgenGPU {
+			reg = <0xfd68ff00 0x910>;
+
+			CLOCKGEN_GPU_PLL: CLOCKGEN_GPU_PLL {
+				#clock-cells = <1>;
+				compatible = "st,stih416-gpu-pll-c32", "st,clkgengpu-pll-c32";
+
+				clocks = <&CLK_SYSIN>;
+				clock-output-names = "CLOCKGEN_GPU_PLL";
+			};
+		};
 	};
 };
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
