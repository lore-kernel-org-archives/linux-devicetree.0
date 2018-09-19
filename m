From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2 2/4] clk: imx6ul: add i.mx6ulz support
Date: Wed, 19 Sep 2018 14:04:46 +0800
Message-ID: <1537337088-28819-3-git-send-email-Anson.Huang@nxp.com>
References: <1537337088-28819-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537337088-28819-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org, ping.bai@nxp.com, Aisheng.dong@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

i.MX6ULZ has same CCM IP as i.MX6ULL, and it reuses
i.MX6UL clock driver, this patch adds support for it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-imx6ul.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 361b43f..42b857e 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -116,7 +116,8 @@ static inline int clk_on_imx6ul(void)
 
 static inline int clk_on_imx6ull(void)
 {
-	return of_machine_is_compatible("fsl,imx6ull");
+	return of_machine_is_compatible("fsl,imx6ull") ||
+		of_machine_is_compatible("fsl,imx6ulz");
 }
 
 static void __init imx6ul_clocks_init(struct device_node *ccm_node)
-- 
2.7.4
