From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH RESEND V2 6/7] clk: imx8mn: Add necessary frequency support for ARM PLL table
Date: Sun, 18 Aug 2019 02:32:24 -0400
Message-ID: <1566109945-11149-6-git-send-email-Anson.Huang@nxp.com>
References: <1566109945-11149-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566109945-11149-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, leonard.crestez@nxp.com, abel.vesa@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

i.MX8MN supports CPU running at 1.5GHz/1.4GHz/1.2GHz, add missing
frequency for ARM PLL table.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
         - split the patch into 2 patches, #1 fixed those missing .rate_count assignment,
           #2 add missing frequency points.
---
 drivers/clk/imx/clk-imx8mn.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index b5a027c..48884f9 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -42,6 +42,8 @@ enum {
 static const struct imx_pll14xx_rate_table imx8mn_pll1416x_tbl[] = {
 	PLL_1416X_RATE(1800000000U, 225, 3, 0),
 	PLL_1416X_RATE(1600000000U, 200, 3, 0),
+	PLL_1416X_RATE(1500000000U, 375, 3, 1),
+	PLL_1416X_RATE(1400000000U, 350, 3, 1),
 	PLL_1416X_RATE(1200000000U, 300, 3, 1),
 	PLL_1416X_RATE(1000000000U, 250, 3, 1),
 	PLL_1416X_RATE(800000000U,  200, 3, 1),
-- 
2.7.4
