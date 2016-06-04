From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sun5i: Move display blocks to sun5i.dtsi
Date: Sat,  4 Jun 2016 20:05:24 +0200
Message-ID: <1465063524-4925-2-git-send-email-hdegoede@redhat.com>
References: <1465063524-4925-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465063524-4925-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All sun5i models share, the same die, so the display-engine is
identical, except for which outputs / encoders all available.

All models support parallel / lvds lcd panels, the R8 and A10s also
support tv-out and the A10s also supports HDMI out.

This commit prepares for enabling display blocks on A10s boards,
but it also is a bug-fix for A10s boards, because before this commit
the simplefb nodes for A10s where not listing the recently added
pll3 as clock, causing the display to go block when the kernel
disables unused clocks at the end of boot.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a10s.dtsi |  24 ++---
 arch/arm/boot/dts/sun5i-a13.dtsi  | 182 --------------------------------------
 arch/arm/boot/dts/sun5i.dtsi      | 182 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+), 199 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index bddd0de..507ec42 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -57,24 +57,13 @@
 	};
 
 	chosen {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		framebuffer@0 {
-			compatible = "allwinner,simple-framebuffer",
-				     "simple-framebuffer";
-			allwinner,pipeline = "de_be0-lcd0-hdmi";
-			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
-				 <&ahb_gates 44>;
-			status = "disabled";
-		};
-
 		framebuffer@1 {
 			compatible = "allwinner,simple-framebuffer",
 				     "simple-framebuffer";
-			allwinner,pipeline = "de_be0-lcd0";
-			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 44>;
+			allwinner,pipeline = "de_be0-lcd0-hdmi";
+			clocks = <&ahb_gates 36>, <&ahb_gates 43>,
+				 <&ahb_gates 44>, <&de_be_clk>,
+				 <&tcon_ch1_clk>, <&dram_gates 26>;
 			status = "disabled";
 		};
 
@@ -82,8 +71,9 @@
 			compatible = "allwinner,simple-framebuffer",
 				     "simple-framebuffer";
 			allwinner,pipeline = "de_be0-lcd0-tve0";
-			clocks = <&pll5 1>, <&ahb_gates 34>, <&ahb_gates 36>,
-				 <&ahb_gates 44>;
+			clocks = <&ahb_gates 34>, <&ahb_gates 36>,
+				 <&ahb_gates 44>, <&de_be_clk>,
+				 <&tcon_ch1_clk>, <&dram_gates 26>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index e012890..5b6d9fc 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -52,21 +52,6 @@
 / {
 	interrupt-parent = <&intc>;
 
-	chosen {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		framebuffer@0 {
-			compatible = "allwinner,simple-framebuffer",
-				     "simple-framebuffer";
-			allwinner,pipeline = "de_be0-lcd0";
-			clocks = <&ahb_gates 36>, <&ahb_gates 44>, <&de_be_clk>,
-				 <&tcon_ch0_clk>, <&dram_gates 26>;
-			status = "disabled";
-		};
-	};
-
 	thermal-zones {
 		cpu_thermal {
 			/* milliseconds */
@@ -150,107 +135,9 @@
 					     "apb1_i2c2", "apb1_uart1",
 					     "apb1_uart3";
 		};
-
-		dram_gates: clk@01c20100 {
-			#clock-cells = <1>;
-			compatible = "allwinner,sun5i-a13-dram-gates-clk",
-				     "allwinner,sun4i-a10-gates-clk";
-			reg = <0x01c20100 0x4>;
-			clocks = <&pll5 0>;
-			clock-indices = <0>,
-					<1>,
-					<25>,
-					<26>,
-					<29>,
-					<31>;
-			clock-output-names = "dram_ve",
-					     "dram_csi",
-					     "dram_de_fe",
-					     "dram_de_be",
-					     "dram_ace",
-					     "dram_iep";
-		};
-
-		de_be_clk: clk@01c20104 {
-			#clock-cells = <0>;
-			#reset-cells = <0>;
-			compatible = "allwinner,sun4i-a10-display-clk";
-			reg = <0x01c20104 0x4>;
-			clocks = <&pll3>, <&pll7>, <&pll5 1>;
-			clock-output-names = "de-be";
-		};
-
-		de_fe_clk: clk@01c2010c {
-			#clock-cells = <0>;
-			#reset-cells = <0>;
-			compatible = "allwinner,sun4i-a10-display-clk";
-			reg = <0x01c2010c 0x4>;
-			clocks = <&pll3>, <&pll7>, <&pll5 1>;
-			clock-output-names = "de-fe";
-		};
-
-		tcon_ch0_clk: clk@01c20118 {
-			#clock-cells = <0>;
-			#reset-cells = <1>;
-			compatible = "allwinner,sun4i-a10-tcon-ch0-clk";
-			reg = <0x01c20118 0x4>;
-			clocks = <&pll3>, <&pll7>, <&pll3x2>, <&pll7x2>;
-			clock-output-names = "tcon-ch0-sclk";
-		};
-
-		tcon_ch1_clk: clk@01c2012c {
-			#clock-cells = <0>;
-			compatible = "allwinner,sun4i-a10-tcon-ch1-clk";
-			reg = <0x01c2012c 0x4>;
-			clocks = <&pll3>, <&pll7>, <&pll3x2>, <&pll7x2>;
-			clock-output-names = "tcon-ch1-sclk";
-		};
-	};
-
-	display-engine {
-		compatible = "allwinner,sun5i-a13-display-engine";
-		allwinner,pipelines = <&fe0>;
 	};
 
 	soc@01c00000 {
-		tcon0: lcd-controller@01c0c000 {
-			compatible = "allwinner,sun5i-a13-tcon";
-			reg = <0x01c0c000 0x1000>;
-			interrupts = <44>;
-			resets = <&tcon_ch0_clk 1>;
-			reset-names = "lcd";
-			clocks = <&ahb_gates 36>,
-				 <&tcon_ch0_clk>,
-				 <&tcon_ch1_clk>;
-			clock-names = "ahb",
-				      "tcon-ch0",
-				      "tcon-ch1";
-			clock-output-names = "tcon-pixel-clock";
-			status = "disabled";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				tcon0_in: port@0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0>;
-
-					tcon0_in_be0: endpoint@0 {
-						reg = <0>;
-						remote-endpoint = <&be0_out_tcon0>;
-					};
-				};
-
-				tcon0_out: port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-				};
-			};
-		};
-
 		pwm: pwm@01c20e00 {
 			compatible = "allwinner,sun5i-a13-pwm";
 			reg = <0x01c20e00 0xc>;
@@ -258,75 +145,6 @@
 			#pwm-cells = <3>;
 			status = "disabled";
 		};
-
-		fe0: display-frontend@01e00000 {
-			compatible = "allwinner,sun5i-a13-display-frontend";
-			reg = <0x01e00000 0x20000>;
-			interrupts = <47>;
-			clocks = <&ahb_gates 46>, <&de_fe_clk>,
-				 <&dram_gates 25>;
-			clock-names = "ahb", "mod",
-				      "ram";
-			resets = <&de_fe_clk>;
-			status = "disabled";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				fe0_out: port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-
-					fe0_out_be0: endpoint@0 {
-						reg = <0>;
-						remote-endpoint = <&be0_in_fe0>;
-					};
-				};
-			};
-		};
-
-		be0: display-backend@01e60000 {
-			compatible = "allwinner,sun5i-a13-display-backend";
-			reg = <0x01e60000 0x10000>;
-			clocks = <&ahb_gates 44>, <&de_be_clk>,
-				 <&dram_gates 26>;
-			clock-names = "ahb", "mod",
-				      "ram";
-			resets = <&de_be_clk>;
-			status = "disabled";
-
-			assigned-clocks = <&de_be_clk>;
-			assigned-clock-rates = <300000000>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				be0_in: port@0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0>;
-
-					be0_in_fe0: endpoint@0 {
-						reg = <0>;
-						remote-endpoint = <&fe0_out_be0>;
-					};
-				};
-
-				be0_out: port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-
-					be0_out_tcon0: endpoint@0 {
-						reg = <0>;
-						remote-endpoint = <&tcon0_in_be0>;
-					};
-				};
-			};
-		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 0840612..3c8bab9 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -51,6 +51,21 @@
 / {
 	interrupt-parent = <&intc>;
 
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer@0 {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0";
+			clocks = <&ahb_gates 36>, <&ahb_gates 44>, <&de_be_clk>,
+				 <&tcon_ch0_clk>, <&dram_gates 26>;
+			status = "disabled";
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -338,6 +353,61 @@
 			clock-output-names = "usb_ohci0", "usb_phy";
 		};
 
+		dram_gates: clk@01c20100 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun5i-a13-dram-gates-clk",
+				     "allwinner,sun4i-a10-gates-clk";
+			reg = <0x01c20100 0x4>;
+			clocks = <&pll5 0>;
+			clock-indices = <0>,
+					<1>,
+					<25>,
+					<26>,
+					<29>,
+					<31>;
+			clock-output-names = "dram_ve",
+					     "dram_csi",
+					     "dram_de_fe",
+					     "dram_de_be",
+					     "dram_ace",
+					     "dram_iep";
+		};
+
+		de_be_clk: clk@01c20104 {
+			#clock-cells = <0>;
+			#reset-cells = <0>;
+			compatible = "allwinner,sun4i-a10-display-clk";
+			reg = <0x01c20104 0x4>;
+			clocks = <&pll3>, <&pll7>, <&pll5 1>;
+			clock-output-names = "de-be";
+		};
+
+		de_fe_clk: clk@01c2010c {
+			#clock-cells = <0>;
+			#reset-cells = <0>;
+			compatible = "allwinner,sun4i-a10-display-clk";
+			reg = <0x01c2010c 0x4>;
+			clocks = <&pll3>, <&pll7>, <&pll5 1>;
+			clock-output-names = "de-fe";
+		};
+
+		tcon_ch0_clk: clk@01c20118 {
+			#clock-cells = <0>;
+			#reset-cells = <1>;
+			compatible = "allwinner,sun4i-a10-tcon-ch0-clk";
+			reg = <0x01c20118 0x4>;
+			clocks = <&pll3>, <&pll7>, <&pll3x2>, <&pll7x2>;
+			clock-output-names = "tcon-ch0-sclk";
+		};
+
+		tcon_ch1_clk: clk@01c2012c {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-tcon-ch1-clk";
+			reg = <0x01c2012c 0x4>;
+			clocks = <&pll3>, <&pll7>, <&pll3x2>, <&pll7x2>;
+			clock-output-names = "tcon-ch1-sclk";
+		};
+
 		codec_clk: clk@01c20140 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-codec-clk";
@@ -355,6 +425,11 @@
 		};
 	};
 
+	display-engine {
+		compatible = "allwinner,sun5i-a13-display-engine";
+		allwinner,pipelines = <&fe0>;
+	};
+
 	soc@01c00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -427,6 +502,44 @@
 			#size-cells = <0>;
 		};
 
+		tcon0: lcd-controller@01c0c000 {
+			compatible = "allwinner,sun5i-a13-tcon";
+			reg = <0x01c0c000 0x1000>;
+			interrupts = <44>;
+			resets = <&tcon_ch0_clk 1>;
+			reset-names = "lcd";
+			clocks = <&ahb_gates 36>,
+				 <&tcon_ch0_clk>,
+				 <&tcon_ch1_clk>;
+			clock-names = "ahb",
+				      "tcon-ch0",
+				      "tcon-ch1";
+			clock-output-names = "tcon-pixel-clock";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon0_in_be0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&be0_out_tcon0>;
+					};
+				};
+
+				tcon0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+			};
+		};
+
 		mmc0: mmc@01c0f000 {
 			compatible = "allwinner,sun5i-a13-mmc";
 			reg = <0x01c0f000 0x1000>;
@@ -713,5 +826,74 @@
 			interrupts = <82>, <83>;
 			clocks = <&ahb_gates 28>;
 		};
+
+		fe0: display-frontend@01e00000 {
+			compatible = "allwinner,sun5i-a13-display-frontend";
+			reg = <0x01e00000 0x20000>;
+			interrupts = <47>;
+			clocks = <&ahb_gates 46>, <&de_fe_clk>,
+				 <&dram_gates 25>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&de_fe_clk>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fe0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					fe0_out_be0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&be0_in_fe0>;
+					};
+				};
+			};
+		};
+
+		be0: display-backend@01e60000 {
+			compatible = "allwinner,sun5i-a13-display-backend";
+			reg = <0x01e60000 0x10000>;
+			clocks = <&ahb_gates 44>, <&de_be_clk>,
+				 <&dram_gates 26>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&de_be_clk>;
+			status = "disabled";
+
+			assigned-clocks = <&de_be_clk>;
+			assigned-clock-rates = <300000000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				be0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					be0_in_fe0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&fe0_out_be0>;
+					};
+				};
+
+				be0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					be0_out_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon0_in_be0>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
