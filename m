From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v3 3/9] ARM: dts: imx7-colibri: mux pull-ups where appropriate
Date: Tue, 19 Dec 2017 19:10:32 +0100
Message-ID: <20171219181038.1369-3-stefan@agner.ch>
References: <20171219181038.1369-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171219181038.1369-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use pull-ups instead of pull-downs for the pins which are already
pulled-up externally.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx7-colibri.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
index dae6b561145b..e4e32aa786f4 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -307,17 +307,17 @@
 
 	pinctrl_gpio1: gpio1-grp {
 		fsl,pins = <
-			MX7D_PAD_ENET1_RGMII_RD3__GPIO7_IO3	0x14 /* SODIMM 55 */
-			MX7D_PAD_ENET1_RGMII_RD2__GPIO7_IO2	0x14 /* SODIMM 63 */
+			MX7D_PAD_ENET1_RGMII_RD3__GPIO7_IO3	0x74 /* SODIMM 55 */
+			MX7D_PAD_ENET1_RGMII_RD2__GPIO7_IO2	0x74 /* SODIMM 63 */
 			MX7D_PAD_SD1_RESET_B__GPIO5_IO2		0X14 /* SODIMM 73 */
-			MX7D_PAD_SAI1_RX_SYNC__GPIO6_IO16	0X14 /* SODIMM 77 */
+			MX7D_PAD_SAI1_RX_SYNC__GPIO6_IO16	0x14 /* SODIMM 77 */
 			MX7D_PAD_EPDC_DATA09__GPIO2_IO9		0x14 /* SODIMM 89 */
-			MX7D_PAD_EPDC_DATA08__GPIO2_IO8		0x14 /* SODIMM 91 */
+			MX7D_PAD_EPDC_DATA08__GPIO2_IO8		0x74 /* SODIMM 91 */
 			MX7D_PAD_LCD_RESET__GPIO3_IO4		0x14 /* SODIMM 93 */
 			MX7D_PAD_EPDC_DATA13__GPIO2_IO13	0x14 /* SODIMM 95 */
 			MX7D_PAD_ENET1_RGMII_TXC__GPIO7_IO11	0x14 /* SODIMM 99 */
-			MX7D_PAD_EPDC_DATA10__GPIO2_IO10	0x14 /* SODIMM 105 */
-			MX7D_PAD_EPDC_DATA15__GPIO2_IO15	0x14 /* SODIMM 107 */
+			MX7D_PAD_EPDC_DATA10__GPIO2_IO10	0x74 /* SODIMM 105 */
+			MX7D_PAD_EPDC_DATA15__GPIO2_IO15	0x74 /* SODIMM 107 */
 			MX7D_PAD_EPDC_DATA00__GPIO2_IO0		0x14 /* SODIMM 111 */
 			MX7D_PAD_EPDC_DATA01__GPIO2_IO1		0x14 /* SODIMM 113 */
 			MX7D_PAD_EPDC_DATA02__GPIO2_IO2		0x14 /* SODIMM 115 */
@@ -333,7 +333,7 @@
 			MX7D_PAD_SD2_DATA2__GPIO5_IO16		0x14 /* SODIMM 100 */
 			MX7D_PAD_SD2_DATA3__GPIO5_IO17		0x14 /* SODIMM 102 */
 			MX7D_PAD_EPDC_GDSP__GPIO2_IO27		0x14 /* SODIMM 104 */
-			MX7D_PAD_EPDC_BDR0__GPIO2_IO28		0x14 /* SODIMM 106 */
+			MX7D_PAD_EPDC_BDR0__GPIO2_IO28		0x74 /* SODIMM 106 */
 			MX7D_PAD_EPDC_BDR1__GPIO2_IO29		0x14 /* SODIMM 110 */
 			MX7D_PAD_EPDC_PWR_COM__GPIO2_IO30	0x14 /* SODIMM 112 */
 			MX7D_PAD_EPDC_SDCLK__GPIO2_IO16		0x14 /* SODIMM 114 */
@@ -357,7 +357,7 @@
 	pinctrl_gpio2: gpio2-grp { /* On X22 Camera interface */
 		fsl,pins = <
 			MX7D_PAD_ECSPI2_SS0__GPIO4_IO23		0x14 /* SODIMM 65 */
-			MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x14 /* SODIMM 69 */
+			MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x74 /* SODIMM 69 */
 			MX7D_PAD_SD1_WP__GPIO5_IO1		0x14 /* SODIMM 71 */
 			MX7D_PAD_I2C4_SDA__GPIO4_IO15		0x14 /* SODIMM 75 */
 			MX7D_PAD_ECSPI1_MISO__GPIO4_IO18	0x14 /* SODIMM 79 */
@@ -378,8 +378,8 @@
 			MX7D_PAD_LCD_DATA19__GPIO3_IO24		0x14 /* SODIMM 138 */
 			MX7D_PAD_LCD_DATA20__GPIO3_IO25		0x14 /* SODIMM 140 */
 			MX7D_PAD_LCD_DATA21__GPIO3_IO26		0x14 /* SODIMM 142 */
-			MX7D_PAD_LCD_DATA22__GPIO3_IO27		0x14 /* SODIMM 146 */
-			MX7D_PAD_LCD_DATA23__GPIO3_IO28		0x14 /* SODIMM 148 */
+			MX7D_PAD_LCD_DATA22__GPIO3_IO27		0x74 /* SODIMM 144 */
+			MX7D_PAD_LCD_DATA23__GPIO3_IO28		0x74 /* SODIMM 146 */
 		>;
 	};
 
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
