From: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 1/1] ARM: dts: AM33XX: Add LCDC info into am335x-evm
Date: Thu, 27 Jun 2013 15:22:09 -0500
Message-ID: <1372364529-7279-1-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add LCDC device node in DT for am33xx
Add LCDC and Panel info in DT for am335x-evm

Changes in v2:
- remove redundant/unnecessary SoC specific setting in the board dts

Signed-off-by: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/am335x-evm.dts |   72 ++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/am33xx.dtsi    |    9 +++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index 0423298..e0ee76e 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -44,6 +44,40 @@
 				0x154 0x27	/* spi0_d0.gpio0_3, INPUT | MODE7 */
 			>;
 		};
+
+		lcd_pins_s0: lcd_pins_s0 {
+			pinctrl-single,pins = <
+				0x20 0x01	/* gpmc_ad8.lcd_data16, OUTPUT | MODE1 */
+				0x24 0x01	/* gpmc_ad9.lcd_data17, OUTPUT | MODE1 */
+				0x28 0x01	/* gpmc_ad10.lcd_data18, OUTPUT | MODE1 */
+				0x2c 0x01	/* gpmc_ad11.lcd_data19, OUTPUT | MODE1 */
+				0x30 0x01	/* gpmc_ad12.lcd_data20, OUTPUT | MODE1 */
+				0x34 0x01	/* gpmc_ad13.lcd_data21, OUTPUT | MODE1 */
+				0x38 0x01	/* gpmc_ad14.lcd_data22, OUTPUT | MODE1 */
+				0x3c 0x01	/* gpmc_ad15.lcd_data23, OUTPUT | MODE1 */
+				0xa0 0x00	/* lcd_data0.lcd_data0, OUTPUT | MODE0 */
+				0xa4 0x00	/* lcd_data1.lcd_data1, OUTPUT | MODE0 */
+				0xa8 0x00	/* lcd_data2.lcd_data2, OUTPUT | MODE0 */
+				0xac 0x00	/* lcd_data3.lcd_data3, OUTPUT | MODE0 */
+				0xb0 0x00	/* lcd_data4.lcd_data4, OUTPUT | MODE0 */
+				0xb4 0x00	/* lcd_data5.lcd_data5, OUTPUT | MODE0 */
+				0xb8 0x00	/* lcd_data6.lcd_data6, OUTPUT | MODE0 */
+				0xbc 0x00	/* lcd_data7.lcd_data7, OUTPUT | MODE0 */
+				0xc0 0x00	/* lcd_data8.lcd_data8, OUTPUT | MODE0 */
+				0xc4 0x00	/* lcd_data9.lcd_data9, OUTPUT | MODE0 */
+				0xc8 0x00	/* lcd_data10.lcd_data10, OUTPUT | MODE0 */
+				0xcc 0x00	/* lcd_data11.lcd_data11, OUTPUT | MODE0 */
+				0xd0 0x00	/* lcd_data12.lcd_data12, OUTPUT | MODE0 */
+				0xd4 0x00	/* lcd_data13.lcd_data13, OUTPUT | MODE0 */
+				0xd8 0x00	/* lcd_data14.lcd_data14, OUTPUT | MODE0 */
+				0xdc 0x00	/* lcd_data15.lcd_data15, OUTPUT | MODE0 */
+				0xe0 0x00	/* lcd_vsync.lcd_vsync, OUTPUT | MODE0 */
+				0xe4 0x00	/* lcd_hsync.lcd_hsync, OUTPUT | MODE0 */
+				0xe8 0x00	/* lcd_pclk.lcd_pclk, OUTPUT | MODE0 */
+				0xec 0x00	/* lcd_ac_bias_en.lcd_ac_bias_en, OUTPUT | MODE0 */
+			>;
+		};
+
 	};
 
 	ocp {
@@ -102,6 +136,10 @@
 				reg = <0x48>;
 			};
 		};
+
+		lcdc: lcdc@4830e000 {
+			status = "okay";
+		};
 	};
 
 	vbat: fixedregulator@0 {
@@ -158,6 +196,40 @@
 			gpio-key,wakeup;
 		};
 	};
+
+	panel {
+		compatible = "ti,tilcdc,panel";
+		status = "okay";
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_pins_s0>;
+		panel-info {
+			ac-bias           = <255>;
+			ac-bias-intrpt    = <0>;
+			dma-burst-sz      = <16>;
+			bpp               = <32>;
+			fdd               = <0x80>;
+			sync-edge         = <0>;
+			sync-ctrl         = <1>;
+			raster-order      = <0>;
+			fifo-th           = <0>;
+		};
+
+		display-timings {
+			800x480p62 {
+				clock-frequency = <30000000>;
+				hactive = <800>;
+				vactive = <480>;
+				hfront-porch = <39>;
+				hback-porch = <39>;
+				hsync-len = <47>;
+				vback-porch = <29>;
+				vfront-porch = <13>;
+				vsync-len = <2>;
+				hsync-active = <1>;
+				vsync-active = <1>;
+			};
+		};
+	};
 };
 
 /include/ "tps65910.dtsi"
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 8e1248f..05b2c4a 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -415,5 +415,14 @@
 			#size-cells = <1>;
 			status = "disabled";
 		};
+
+		lcdc: lcdc@4830e000 {
+			compatible = "ti,am33xx-tilcdc";
+			reg = <0x4830e000 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <36>;
+			ti,hwmods = "lcdc";
+			status = "disabled";
+		};
 	};
 };
-- 
1.7.9.5
