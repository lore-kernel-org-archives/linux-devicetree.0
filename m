From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 2/3] nvmem: imx-ocotp: add support for imx8mq
Date: Mon, 11 Feb 2019 17:50:10 +0100
Message-ID: <20190211165011.5114-2-l.stach@pengutronix.de>
References: <20190211165011.5114-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211165011.5114-1-l.stach@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>, linux-imx@nxp.com, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

The i.MX8MQ uses the same OCOTP block as the i.MX7D, but with
fourfold increase in fuse banks.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/nvmem/imx-ocotp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index afb429a417fe..bcae2aed75ad 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -433,6 +433,12 @@ static const struct ocotp_params imx7d_params = {
 	.set_timing = imx_ocotp_set_imx7_timing,
 };
 
+static const struct ocotp_params imx8mq_params = {
+	.nregs = 256,
+	.bank_address_words = 4,
+	.set_timing = imx_ocotp_set_imx7_timing,
+};
+
 static const struct of_device_id imx_ocotp_dt_ids[] = {
 	{ .compatible = "fsl,imx6q-ocotp",  .data = &imx6q_params },
 	{ .compatible = "fsl,imx6sl-ocotp", .data = &imx6sl_params },
@@ -440,6 +446,7 @@ static const struct of_device_id imx_ocotp_dt_ids[] = {
 	{ .compatible = "fsl,imx6ul-ocotp", .data = &imx6ul_params },
 	{ .compatible = "fsl,imx7d-ocotp",  .data = &imx7d_params },
 	{ .compatible = "fsl,imx6sll-ocotp", .data = &imx6sll_params },
+	{ .compatible = "fsl,imx8mq-ocotp", .data = &imx8mq_params },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imx_ocotp_dt_ids);
-- 
2.20.1
