From: Anson.Huang@nxp.com
Subject: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
Date: Tue, 11 Jun 2019 14:33:32 +0800
Message-ID: <20190611063333.48501-2-Anson.Huang@nxp.com>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611063333.48501-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, aisheng.dong@nxp.com, ulf.hansson@linaro.org, peng.fan@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

i.MX system controller RTC driver can support all i.MX SoCs
with system controller inside, this patch makes the compatible
string more generic to support other i.MX SoCs with system
controller inside, such as i.MX8QM etc..

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/rtc/rtc-imx-sc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
index c933045..38ef3ca 100644
--- a/drivers/rtc/rtc-imx-sc.c
+++ b/drivers/rtc/rtc-imx-sc.c
@@ -178,7 +178,7 @@ static int imx_sc_rtc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx_sc_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-sc-rtc", },
+	{ .compatible = "fsl,imx-sc-rtc", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, imx_sc_dt_ids);
-- 
2.7.4
