Return-Path: <SRS0=5rLq=SE=googlemail.com=chrysh.ng@kernel.org>
From: Christina Quast <cquast@hanoverdisplays.com>
Subject: [PATCH v2 4/6] ARM: dts: am335x: boneblack-common: Replaced register offsets with defines
Date: Tue,  2 Apr 2019 18:09:49 +0200
Message-Id: <20190402160949.14190-5-cquast@hanoverdisplays.com>
In-Reply-To: <20190402160949.14190-1-cquast@hanoverdisplays.com>
References: <20190314150524.GB19425@atomide.com>
 <20190402160949.14190-1-cquast@hanoverdisplays.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christina Quast <cquast@hanoverdisplays.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

The defines are taken from dt-bindings/pinctrl/am33xx.h

Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
---
 .../arm/boot/dts/am335x-boneblack-common.dtsi | 54 +++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-boneblack-common.dtsi b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
index e543c2bee8c2..283e288b6e42 100644
--- a/arch/arm/boot/dts/am335x-boneblack-common.dtsi
+++ b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
@@ -30,43 +30,43 @@
 &am33xx_pinmux {
 	nxp_hdmi_bonelt_pins: nxp_hdmi_bonelt_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x9b0, PIN_OUTPUT_PULLDOWN | MUX_MODE3)	/* xdma_event_intr0 */
-			AM33XX_IOPAD(0x8a0, PIN_OUTPUT | MUX_MODE0)		/* lcd_data0.lcd_data0 */
-			AM33XX_IOPAD(0x8a4, PIN_OUTPUT | MUX_MODE0)		/* lcd_data1.lcd_data1 */
-			AM33XX_IOPAD(0x8a8, PIN_OUTPUT | MUX_MODE0)		/* lcd_data2.lcd_data2 */
-			AM33XX_IOPAD(0x8ac, PIN_OUTPUT | MUX_MODE0)		/* lcd_data3.lcd_data3 */
-			AM33XX_IOPAD(0x8b0, PIN_OUTPUT | MUX_MODE0)		/* lcd_data4.lcd_data4 */
-			AM33XX_IOPAD(0x8b4, PIN_OUTPUT | MUX_MODE0)		/* lcd_data5.lcd_data5 */
-			AM33XX_IOPAD(0x8b8, PIN_OUTPUT | MUX_MODE0)		/* lcd_data6.lcd_data6 */
-			AM33XX_IOPAD(0x8bc, PIN_OUTPUT | MUX_MODE0)		/* lcd_data7.lcd_data7 */
-			AM33XX_IOPAD(0x8c0, PIN_OUTPUT | MUX_MODE0)		/* lcd_data8.lcd_data8 */
-			AM33XX_IOPAD(0x8c4, PIN_OUTPUT | MUX_MODE0)		/* lcd_data9.lcd_data9 */
-			AM33XX_IOPAD(0x8c8, PIN_OUTPUT | MUX_MODE0)		/* lcd_data10.lcd_data10 */
-			AM33XX_IOPAD(0x8cc, PIN_OUTPUT | MUX_MODE0)		/* lcd_data11.lcd_data11 */
-			AM33XX_IOPAD(0x8d0, PIN_OUTPUT | MUX_MODE0)		/* lcd_data12.lcd_data12 */
-			AM33XX_IOPAD(0x8d4, PIN_OUTPUT | MUX_MODE0)		/* lcd_data13.lcd_data13 */
-			AM33XX_IOPAD(0x8d8, PIN_OUTPUT | MUX_MODE0)		/* lcd_data14.lcd_data14 */
-			AM33XX_IOPAD(0x8dc, PIN_OUTPUT | MUX_MODE0)		/* lcd_data15.lcd_data15 */
-			AM33XX_IOPAD(0x8e0, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* lcd_vsync.lcd_vsync */
-			AM33XX_IOPAD(0x8e4, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* lcd_hsync.lcd_hsync */
-			AM33XX_IOPAD(0x8e8, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* lcd_pclk.lcd_pclk */
-			AM33XX_IOPAD(0x8ec, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* lcd_ac_bias_en.lcd_ac_bias_en */
+			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT_PULLDOWN, MUX_MODE3)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA0, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA1, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA2, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA3, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA4, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA5, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA6, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA7, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA8, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA9, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA14, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA15, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
 		>;
 	};
 
 	nxp_hdmi_bonelt_off_pins: nxp_hdmi_bonelt_off_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x9b0, PIN_OUTPUT_PULLDOWN | MUX_MODE3)	/* xdma_event_intr0 */
+			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT_PULLDOWN, MUX_MODE3)
 		>;
 	};
 
 	mcasp0_pins: mcasp0_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x9ac, PIN_INPUT_PULLUP | MUX_MODE0) /* mcasp0_ahcklx.mcasp0_ahclkx */
-			AM33XX_IOPAD(0x99c, PIN_OUTPUT_PULLDOWN | MUX_MODE2) /* mcasp0_ahclkr.mcasp0_axr2*/
-			AM33XX_IOPAD(0x994, PIN_OUTPUT_PULLUP | MUX_MODE0) /* mcasp0_fsx.mcasp0_fsx */
-			AM33XX_IOPAD(0x990, PIN_OUTPUT_PULLDOWN | MUX_MODE0) /* mcasp0_aclkx.mcasp0_aclkx */
-			AM33XX_IOPAD(0x86c, PIN_OUTPUT_PULLDOWN | MUX_MODE7) /* gpmc_a11.GPIO1_27 */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKX, PIN_INPUT_PULLUP, MUX_MODE0) /* mcasp0_ahcklx.mcasp0_ahclkx */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKR, PIN_OUTPUT_PULLDOWN, MUX_MODE2) /* mcasp0_ahclkr.mcasp0_axr2*/
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_OUTPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_OUTPUT_PULLDOWN, MUX_MODE7) /* gpmc_a11.GPIO1_27 */
 		>;
 	};
 };
-- 
2.20.1
