From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] clk: imx8: Add DSP related clocks
Date: Tue,  2 Jul 2019 18:20:07 +0300
Message-ID: <20190702152007.12190-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: mark.rutland@arm.com, aisheng.dong@nxp.com, shengjiu.wang@nxp.com, devicetree@vger.kernel.org, sboyd@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, mturquette@baylibre.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, weiyongjun1@huawei.com, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

i.MX8QXP contains Hifi4 DSP. There are four clocks
associated with DSP:
  * dsp_lpcg_core_clk
  * dsp_lpcg_ipg_clk
  * dsp_lpcg_adb_aclk
  * ocram_lpcg_ipg_clk

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c     | 5 +++++
 include/dt-bindings/clock/imx8-clock.h | 6 +++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index fb6edf1b8aa2..c0aff7ca6374 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -72,6 +72,11 @@ static const struct imx8qxp_lpcg_data imx8qxp_lpcg_adma[] = {
 	{ IMX_ADMA_LPCG_I2C2_CLK, "i2c2_lpcg_clk", "i2c2_clk", 0, ADMA_LPI2C_2_LPCG, 0, 0, },
 	{ IMX_ADMA_LPCG_I2C3_IPG_CLK, "i2c3_lpcg_ipg_clk", "dma_ipg_clk_root", 0, ADMA_LPI2C_3_LPCG, 16, 0, },
 	{ IMX_ADMA_LPCG_I2C3_CLK, "i2c3_lpcg_clk", "i2c3_clk", 0, ADMA_LPI2C_3_LPCG, 0, 0, },
+
+	{ IMX_ADMA_LPCG_DSP_CORE_CLK, "dsp_lpcg_core_clk", "dma_ipg_clk_root", 0, ADMA_HIFI_LPCG, 28, 0, },
+	{ IMX_ADMA_LPCG_DSP_IPG_CLK, "dsp_lpcg_ipg_clk", "dma_ipg_clk_root", 0, ADMA_HIFI_LPCG, 20, 0, },
+	{ IMX_ADMA_LPCG_DSP_ADB_CLK, "dsp_lpcg_adb_clk", "dma_ipg_clk_root", 0, ADMA_HIFI_LPCG, 16, 0, },
+	{ IMX_ADMA_LPCG_OCRAM_IPG_CLK, "ocram_lpcg_ipg_clk", "dma_ipg_clk_root", 0, ADMA_OCRAM_LPCG, 16, 0, },
 };
 
 static const struct imx8qxp_ss_lpcg imx8qxp_ss_adma = {
diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/clock/imx8-clock.h
index 4236818e3be5..673a8c662340 100644
--- a/include/dt-bindings/clock/imx8-clock.h
+++ b/include/dt-bindings/clock/imx8-clock.h
@@ -283,7 +283,11 @@
 #define IMX_ADMA_LPCG_PWM_IPG_CLK			38
 #define IMX_ADMA_LPCG_LCD_PIX_CLK			39
 #define IMX_ADMA_LPCG_LCD_APB_CLK			40
+#define IMX_ADMA_LPCG_DSP_ADB_CLK			41
+#define IMX_ADMA_LPCG_DSP_IPG_CLK			42
+#define IMX_ADMA_LPCG_DSP_CORE_CLK			43
+#define IMX_ADMA_LPCG_OCRAM_IPG_CLK			44
 
-#define IMX_ADMA_LPCG_CLK_END				41
+#define IMX_ADMA_LPCG_CLK_END				45
 
 #endif /* __DT_BINDINGS_CLOCK_IMX_H */
-- 
2.17.1
