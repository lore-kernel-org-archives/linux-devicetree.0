From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v2 2/3] dmaengine: imx-sdma: Only check ratio on parts that support 1:1
Date: Fri, 29 Mar 2019 08:21:29 -0700
Message-ID: <20190329152130.18411-3-angus@akkea.ca>
References: <20190328133828.20999-1-angus@akkea.ca>
 <20190329152130.18411-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329152130.18411-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On imx8mq B0 chip, AHB/SDMA clock ratio 2:1 can't be supported,
since SDMA clock ratio has to be increased to 250Mhz, AHB can't reach
to 500Mhz, so use 1:1 instead.

To limit this change to the imx8mq for now this patch also adds an
im8mq-sdma compatible string.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 drivers/dma/imx-sdma.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 5f3c1378b90e..99d9f431ae2c 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -419,6 +419,7 @@ struct sdma_driver_data {
 	int chnenbl0;
 	int num_events;
 	struct sdma_script_start_addrs	*script_addrs;
+	bool check_ratio;
 };
 
 struct sdma_engine {
@@ -557,6 +558,13 @@ static struct sdma_driver_data sdma_imx7d = {
 	.script_addrs = &sdma_script_imx7d,
 };
 
+static struct sdma_driver_data sdma_imx8mq = {
+	.chnenbl0 = SDMA_CHNENBL0_IMX35,
+	.num_events = 48,
+	.script_addrs = &sdma_script_imx7d,
+	.check_ratio = 1,
+};
+
 static const struct platform_device_id sdma_devtypes[] = {
 	{
 		.name = "imx25-sdma",
@@ -579,6 +587,9 @@ static const struct platform_device_id sdma_devtypes[] = {
 	}, {
 		.name = "imx7d-sdma",
 		.driver_data = (unsigned long)&sdma_imx7d,
+	}, {
+		.name = "imx8mq-sdma",
+		.driver_data = (unsigned long)&sdma_imx8mq,
 	}, {
 		/* sentinel */
 	}
@@ -593,6 +604,7 @@ static const struct of_device_id sdma_dt_ids[] = {
 	{ .compatible = "fsl,imx31-sdma", .data = &sdma_imx31, },
 	{ .compatible = "fsl,imx25-sdma", .data = &sdma_imx25, },
 	{ .compatible = "fsl,imx7d-sdma", .data = &sdma_imx7d, },
+	{ .compatible = "fsl,imx8mq-sdma", .data = &sdma_imx8mq, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sdma_dt_ids);
@@ -1852,7 +1864,8 @@ static int sdma_init(struct sdma_engine *sdma)
 	if (ret)
 		goto disable_clk_ipg;
 
-	if (clk_get_rate(sdma->clk_ahb) == clk_get_rate(sdma->clk_ipg))
+	if (sdma->drvdata->check_ratio &&
+	    (clk_get_rate(sdma->clk_ahb) == clk_get_rate(sdma->clk_ipg)))
 		sdma->clk_ratio = 1;
 
 	/* Be sure SDMA has not started yet */
-- 
2.17.1
