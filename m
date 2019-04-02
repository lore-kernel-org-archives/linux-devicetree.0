Return-Path: <SRS0=5rLq=SE=googlemail.com=chrysh.ng@kernel.org>
From: Christina Quast <cquast@hanoverdisplays.com>
Subject: [PATCH v2 6/6] ARM: dts: am335x: pocketbeagle: Replaced register offsets with defines
Date: Tue,  2 Apr 2019 18:09:51 +0200
Message-Id: <20190402160949.14190-7-cquast@hanoverdisplays.com>
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
 arch/arm/boot/dts/am335x-pocketbeagle.dts | 56 +++++++++++------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
index 62fe5cab9fae..ff4f919d22f6 100644
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -62,74 +62,74 @@
 &am33xx_pinmux {
 	i2c2_pins: pinmux-i2c2-pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x97c, PIN_INPUT_PULLUP | MUX_MODE3)	/* (D17) uart1_rtsn.I2C2_SCL */
-			AM33XX_IOPAD(0x978, PIN_INPUT_PULLUP | MUX_MODE3)	/* (D18) uart1_ctsn.I2C2_SDA */
+			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_INPUT_PULLUP, MUX_MODE3)	/* (D17) uart1_rtsn.I2C2_SCL */
+			AM33XX_PADCONF(AM335X_PIN_UART1_CTSN, PIN_INPUT_PULLUP, MUX_MODE3)	/* (D18) uart1_ctsn.I2C2_SDA */
 		>;
 	};
 
 	ehrpwm0_pins: pinmux-ehrpwm0-pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x990, PIN_OUTPUT_PULLDOWN | MUX_MODE1)	/* (A13) mcasp0_aclkx.ehrpwm0A */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_OUTPUT_PULLDOWN, MUX_MODE1)	/* (A13) mcasp0_aclkx.ehrpwm0A */
 		>;
 	};
 
 	ehrpwm1_pins: pinmux-ehrpwm1-pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x848, PIN_OUTPUT_PULLDOWN | MUX_MODE6)	/* (U14) gpmc_a2.ehrpwm1A */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_OUTPUT_PULLDOWN, MUX_MODE6)	/* (U14) gpmc_a2.ehrpwm1A */
 		>;
 	};
 
 	mmc0_pins: pinmux-mmc0-pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x960, PIN_INPUT | MUX_MODE7)		/* (C15) spi0_cs1.gpio0[6] */
-			AM33XX_IOPAD(0x8fc, PIN_INPUT_PULLUP | MUX_MODE0)	/* (G16) mmc0_dat0.mmc0_dat0 */
-			AM33XX_IOPAD(0x8f8, PIN_INPUT_PULLUP | MUX_MODE0)	/* (G15) mmc0_dat1.mmc0_dat1 */
-			AM33XX_IOPAD(0x8f4, PIN_INPUT_PULLUP | MUX_MODE0)	/* (F18) mmc0_dat2.mmc0_dat2 */
-			AM33XX_IOPAD(0x8f0, PIN_INPUT_PULLUP | MUX_MODE0)	/* (F17) mmc0_dat3.mmc0_dat3 */
-			AM33XX_IOPAD(0x904, PIN_INPUT_PULLUP | MUX_MODE0)	/* (G18) mmc0_cmd.mmc0_cmd */
-			AM33XX_IOPAD(0x900, PIN_INPUT_PULLUP | MUX_MODE0)	/* (G17) mmc0_clk.mmc0_clk */
-			AM33XX_IOPAD(0x9a0, PIN_INPUT | MUX_MODE4)		/* (B12) mcasp0_aclkr.mmc0_sdwp */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_CS1, PIN_INPUT, MUX_MODE7)		/* (C15) spi0_cs1.gpio0[6] */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT0, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT1, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT2, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT3, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_CMD, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_CLK, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKR, PIN_INPUT, MUX_MODE4)		/* (B12) mcasp0_aclkr.mmc0_sdwp */
 		>;
 	};
 
 	spi0_pins: pinmux-spi0-pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x950, PIN_INPUT_PULLUP | MUX_MODE0)	/* (A17) spi0_sclk.spi0_sclk */
-			AM33XX_IOPAD(0x954, PIN_INPUT_PULLUP | MUX_MODE0)	/* (B17) spi0_d0.spi0_d0 */
-			AM33XX_IOPAD(0x958, PIN_INPUT_PULLUP | MUX_MODE0)	/* (B16) spi0_d1.spi0_d1 */
-			AM33XX_IOPAD(0x95c, PIN_INPUT_PULLUP | MUX_MODE0)	/* (A16) spi0_cs0.spi0_cs0 */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D0, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D1, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_SPI0_CS0, PIN_INPUT_PULLUP, MUX_MODE0)
 		>;
 	};
 
 	spi1_pins: pinmux-spi1-pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x964, PIN_INPUT_PULLUP | MUX_MODE4)	/* (C18) eCAP0_in_PWM0_out.spi1_sclk */
-			AM33XX_IOPAD(0x968, PIN_INPUT_PULLUP | MUX_MODE4)	/* (E18) uart0_ctsn.spi1_d0 */
-			AM33XX_IOPAD(0x96c, PIN_INPUT_PULLUP | MUX_MODE4)	/* (E17) uart0_rtsn.spi1_d1 */
-			AM33XX_IOPAD(0x9b0, PIN_INPUT_PULLUP | MUX_MODE4)	/* (A15) xdma_event_intr0.spi1_cs1 */
+			AM33XX_PADCONF(AM335X_PIN_ECAP0_IN_PWM0_OUT, PIN_INPUT_PULLUP, MUX_MODE4)	/* (C18) eCAP0_in_PWM0_out.spi1_sclk */
+			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_INPUT_PULLUP, MUX_MODE4)	/* (E18) uart0_ctsn.spi1_d0 */
+			AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_INPUT_PULLUP, MUX_MODE4)	/* (E17) uart0_rtsn.spi1_d1 */
+			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_INPUT_PULLUP, MUX_MODE4)	/* (A15) xdma_event_intr0.spi1_cs1 */
 		>;
 	};
 
 	usr_leds_pins: pinmux-usr-leds-pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x854, PIN_OUTPUT | MUX_MODE7)		/* (V15) gpmc_a5.gpio1[21] - USR_LED_0 */
-			AM33XX_IOPAD(0x858, PIN_OUTPUT | MUX_MODE7)		/* (U15) gpmc_a6.gpio1[22] - USR_LED_1 */
-			AM33XX_IOPAD(0x85c, PIN_OUTPUT | MUX_MODE7)		/* (T15) gpmc_a7.gpio1[23] - USR_LED_2 */
-			AM33XX_IOPAD(0x860, PIN_OUTPUT | MUX_MODE7)		/* (V16) gpmc_a8.gpio1[24] - USR_LED_3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A5, PIN_OUTPUT, MUX_MODE7)		/* (V15) gpmc_a5.gpio1[21] - USR_LED_0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A6, PIN_OUTPUT, MUX_MODE7)		/* (U15) gpmc_a6.gpio1[22] - USR_LED_1 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A7, PIN_OUTPUT, MUX_MODE7)		/* (T15) gpmc_a7.gpio1[23] - USR_LED_2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A8, PIN_OUTPUT, MUX_MODE7)		/* (V16) gpmc_a8.gpio1[24] - USR_LED_3 */
 		>;
 	};
 
 	uart0_pins: pinmux-uart0-pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x970, PIN_INPUT_PULLUP | MUX_MODE0)	/* (E15) uart0_rxd.uart0_rxd */
-			AM33XX_IOPAD(0x974, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* (E16) uart0_txd.uart0_txd */
+			AM33XX_PADCONF(AM335X_PIN_UART0_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_UART0_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
 		>;
 	};
 
 	uart4_pins: pinmux-uart4-pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x870, PIN_INPUT_PULLUP | MUX_MODE6)	/* (T17) gpmc_wait0.uart4_rxd */
-			AM33XX_IOPAD(0x874, PIN_OUTPUT_PULLDOWN | MUX_MODE6)	/* (U17) gpmc_wpn.uart4_txd */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WAIT0, PIN_INPUT_PULLUP, MUX_MODE6)	/* (T17) gpmc_wait0.uart4_rxd */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WPN, PIN_OUTPUT_PULLDOWN, MUX_MODE6)	/* (U17) gpmc_wpn.uart4_txd */
 		>;
 	};
 };
-- 
2.20.1
