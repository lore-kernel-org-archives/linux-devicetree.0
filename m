From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] ARM: at91/dt: sama5d2 Xplained: add several devices
Date: Wed, 14 Oct 2015 14:11:23 +0200
Message-ID: <1444824684-24526-2-git-send-email-ludovic.desroches@atmel.com>
References: <1444824684-24526-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444824684-24526-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add sdmmc and flexcom devices

Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/at91-sama5d2_xplained.dts | 106 ++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
index dc23979..bce9597 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -45,6 +45,7 @@
 /dts-v1/;
 #include "sama5d2.dtsi"
 #include "sama5d2-pinfunc.h"
+#include <dt-bindings/mfd/atmel-flexcom.h>
 
 / {
 	model = "Atmel SAMA5D2 Xplained";
@@ -91,6 +92,22 @@
 			status = "okay";
 		};
 
+		sdmmc0: sdio-host@a0000000 {
+			bus-width = <8>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_sdmmc0_default>;
+			non-removable;
+			mmc-ddr-1_8v;
+			status = "okay";
+		};
+
+		sdmmc1: sdio-host@b0000000 {
+			bus-width = <4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_sdmmc1_default>;
+			status = "okay"; /* conflict with qspi0 */
+		};
+
 		apb {
 			spi0: spi@f8000000 {
 				pinctrl-names = "default";
@@ -124,12 +141,49 @@
 				status = "okay";
 			};
 
+			flx0: flexcom@f8034000 {
+				atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
+				status = "disabled"; /* conflict with ISC_D2 & ISC_D3 data pins */
+
+				uart5: serial@200 {
+					compatible = "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <19 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&flx0_clk>;
+					clock-names = "usart";
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_flx0_default>;
+					atmel,fifo-size = <32>;
+					status = "okay";
+				};
+			};
+
 			uart3: serial@fc008000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_uart3_default>;
 				status = "okay";
 			};
 
+			flx4: flexcom@fc018000 {
+				atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+				status = "okay";
+
+				i2c2: i2c@600 {
+					compatible = "atmel,sama5d2-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <23 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <0>, <0>;
+					dma-names = "tx", "rx";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					clocks = <&flx4_clk>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_flx4_default>;
+					atmel,fifo-size = <16>;
+					status = "okay";
+				};
+			};
+
 			i2c1: i2c@fc028000 {
 				dmas = <0>, <0>;
 				pinctrl-names = "default";
@@ -144,6 +198,18 @@
 			};
 
 			pinctrl@fc038000 {
+				pinctrl_flx0_default: flx0_default {
+					pinmux = <PIN_PB28__FLEXCOM0_IO0>,
+						 <PIN_PB29__FLEXCOM0_IO1>;
+					bias-disable;
+				};
+
+				pinctrl_flx4_default: flx4_default {
+					pinmux = <PIN_PD12__FLEXCOM4_IO0>,
+						 <PIN_PD13__FLEXCOM4_IO1>;
+					bias-disable;
+				};
+
 				pinctrl_i2c0_default: i2c0_default {
 					pinmux = <PIN_PD21__TWD0>,
 						 <PIN_PD22__TWCK0>;
@@ -170,6 +236,46 @@
 					bias-disable;
 				};
 
+				pinctrl_sdmmc0_default: sdmmc0_default {
+					cmd_data {
+						pinmux = <PIN_PA1__SDMMC0_CMD>,
+							 <PIN_PA2__SDMMC0_DAT0>,
+							 <PIN_PA3__SDMMC0_DAT1>,
+							 <PIN_PA4__SDMMC0_DAT2>,
+							 <PIN_PA5__SDMMC0_DAT3>,
+							 <PIN_PA6__SDMMC0_DAT4>,
+							 <PIN_PA7__SDMMC0_DAT5>,
+							 <PIN_PA8__SDMMC0_DAT6>,
+							 <PIN_PA9__SDMMC0_DAT7>;
+						bias-pull-up;
+					};
+
+					ck_cd_rstn_vddsel {
+						pinmux = <PIN_PA0__SDMMC0_CK>,
+							 <PIN_PA10__SDMMC0_RSTN>,
+							 <PIN_PA11__SDMMC0_VDDSEL>,
+							 <PIN_PA13__SDMMC0_CD>;
+						bias-disable;
+					};
+				};
+
+				pinctrl_sdmmc1_default: sdmmc1_default {
+					cmd_data {
+						pinmux = <PIN_PA28__SDMMC1_CMD>,
+							 <PIN_PA18__SDMMC1_DAT0>,
+							 <PIN_PA19__SDMMC1_DAT1>,
+							 <PIN_PA20__SDMMC1_DAT2>,
+							 <PIN_PA21__SDMMC1_DAT3>;
+						bias-pull-up;
+					};
+
+					conf-ck_cd {
+						pinmux = <PIN_PA22__SDMMC1_CK>,
+							 <PIN_PA30__SDMMC1_CD>;
+						bias-disable;
+					};
+				};
+
 				pinctrl_spi0_default: spi0_default {
 					pinmux = <PIN_PA14__SPI0_SPCK>,
 						 <PIN_PA15__SPI0_MOSI>,
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
