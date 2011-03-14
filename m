From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/7] arm/dt: add pad configurations for mx51 babbage
Date: Mon, 14 Mar 2011 22:25:54 +0800
Message-ID: <1300112759-3495-3-git-send-email-shawn.guo@linaro.org>
References: <1300112759-3495-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1300112759-3495-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The pad configuration is something common between dt and non-dt
kernel, so it can be copied from non-dt code directly.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-mx5/board-dt.c |   94 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 94 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-mx5/board-dt.c b/arch/arm/mach-mx5/board-dt.c
index 45d1e37..4850251 100644
--- a/arch/arm/mach-mx5/board-dt.c
+++ b/arch/arm/mach-mx5/board-dt.c
@@ -31,6 +31,97 @@
 
 #include "devices.h"
 
+static iomux_v3_cfg_t mx51babbage_pads[] = {
+	/* UART1 */
+	MX51_PAD_UART1_RXD__UART1_RXD,
+	MX51_PAD_UART1_TXD__UART1_TXD,
+	MX51_PAD_UART1_RTS__UART1_RTS,
+	MX51_PAD_UART1_CTS__UART1_CTS,
+
+	/* UART2 */
+	MX51_PAD_UART2_RXD__UART2_RXD,
+	MX51_PAD_UART2_TXD__UART2_TXD,
+
+	/* UART3 */
+	MX51_PAD_EIM_D25__UART3_RXD,
+	MX51_PAD_EIM_D26__UART3_TXD,
+	MX51_PAD_EIM_D27__UART3_RTS,
+	MX51_PAD_EIM_D24__UART3_CTS,
+
+	/* I2C1 */
+	MX51_PAD_EIM_D16__I2C1_SDA,
+	MX51_PAD_EIM_D19__I2C1_SCL,
+
+	/* I2C2 */
+	MX51_PAD_KEY_COL4__I2C2_SCL,
+	MX51_PAD_KEY_COL5__I2C2_SDA,
+
+	/* HSI2C */
+	MX51_PAD_I2C1_CLK__I2C1_CLK,
+	MX51_PAD_I2C1_DAT__I2C1_DAT,
+
+	/* USB HOST1 */
+	MX51_PAD_USBH1_CLK__USBH1_CLK,
+	MX51_PAD_USBH1_DIR__USBH1_DIR,
+	MX51_PAD_USBH1_NXT__USBH1_NXT,
+	MX51_PAD_USBH1_DATA0__USBH1_DATA0,
+	MX51_PAD_USBH1_DATA1__USBH1_DATA1,
+	MX51_PAD_USBH1_DATA2__USBH1_DATA2,
+	MX51_PAD_USBH1_DATA3__USBH1_DATA3,
+	MX51_PAD_USBH1_DATA4__USBH1_DATA4,
+	MX51_PAD_USBH1_DATA5__USBH1_DATA5,
+	MX51_PAD_USBH1_DATA6__USBH1_DATA6,
+	MX51_PAD_USBH1_DATA7__USBH1_DATA7,
+
+	/* USB HUB reset line*/
+	MX51_PAD_GPIO1_7__GPIO1_7,
+
+	/* FEC */
+	MX51_PAD_EIM_EB2__FEC_MDIO,
+	MX51_PAD_EIM_EB3__FEC_RDATA1,
+	MX51_PAD_EIM_CS2__FEC_RDATA2,
+	MX51_PAD_EIM_CS3__FEC_RDATA3,
+	MX51_PAD_EIM_CS4__FEC_RX_ER,
+	MX51_PAD_EIM_CS5__FEC_CRS,
+	MX51_PAD_NANDF_RB2__FEC_COL,
+	MX51_PAD_NANDF_RB3__FEC_RX_CLK,
+	MX51_PAD_NANDF_D9__FEC_RDATA0,
+	MX51_PAD_NANDF_D8__FEC_TDATA0,
+	MX51_PAD_NANDF_CS2__FEC_TX_ER,
+	MX51_PAD_NANDF_CS3__FEC_MDC,
+	MX51_PAD_NANDF_CS4__FEC_TDATA1,
+	MX51_PAD_NANDF_CS5__FEC_TDATA2,
+	MX51_PAD_NANDF_CS6__FEC_TDATA3,
+	MX51_PAD_NANDF_CS7__FEC_TX_EN,
+	MX51_PAD_NANDF_RDY_INT__FEC_TX_CLK,
+
+	/* FEC PHY reset line */
+	MX51_PAD_EIM_A20__GPIO2_14,
+
+	/* SD 1 */
+	MX51_PAD_SD1_CMD__SD1_CMD,
+	MX51_PAD_SD1_CLK__SD1_CLK,
+	MX51_PAD_SD1_DATA0__SD1_DATA0,
+	MX51_PAD_SD1_DATA1__SD1_DATA1,
+	MX51_PAD_SD1_DATA2__SD1_DATA2,
+	MX51_PAD_SD1_DATA3__SD1_DATA3,
+
+	/* SD 2 */
+	MX51_PAD_SD2_CMD__SD2_CMD,
+	MX51_PAD_SD2_CLK__SD2_CLK,
+	MX51_PAD_SD2_DATA0__SD2_DATA0,
+	MX51_PAD_SD2_DATA1__SD2_DATA1,
+	MX51_PAD_SD2_DATA2__SD2_DATA2,
+	MX51_PAD_SD2_DATA3__SD2_DATA3,
+
+	/* eCSPI1 */
+	MX51_PAD_CSPI1_MISO__ECSPI1_MISO,
+	MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI,
+	MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK,
+	MX51_PAD_CSPI1_SS0__GPIO4_24,
+	MX51_PAD_CSPI1_SS1__GPIO4_25,
+};
+
 static struct of_device_id mx51_dt_match_table[] __initdata = {
 	{ .compatible = "simple-bus", },
 	{}
@@ -39,6 +130,9 @@ static struct of_device_id mx51_dt_match_table[] __initdata = {
 static void __init mx51_dt_board_init(void)
 {
 	of_platform_bus_probe(NULL, mx51_dt_match_table, NULL);
+
+	mxc_iomux_v3_setup_multiple_pads(mx51babbage_pads,
+					ARRAY_SIZE(mx51babbage_pads));
 }
 
 static void __init mx51_dt_timer_init(void)
-- 
1.7.1
