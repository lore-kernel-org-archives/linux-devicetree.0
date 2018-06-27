From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH 1/2] nvmem: imx-ocotp: add support for imx6sll
Date: Wed, 27 Jun 2018 11:28:49 +0800
Message-ID: <1530070130-3004-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

i.MX6SLL is a new SoC of i.MX6 family, enable ocotp
driver support for this SoC.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/nvmem/imx-ocotp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 60816c8..afb429a 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -409,6 +409,12 @@ static const struct ocotp_params imx6sl_params = {
 	.set_timing = imx_ocotp_set_imx6_timing,
 };
 
+static const struct ocotp_params imx6sll_params = {
+	.nregs = 128,
+	.bank_address_words = 0,
+	.set_timing = imx_ocotp_set_imx6_timing,
+};
+
 static const struct ocotp_params imx6sx_params = {
 	.nregs = 128,
 	.bank_address_words = 0,
@@ -433,6 +439,7 @@ static const struct of_device_id imx_ocotp_dt_ids[] = {
 	{ .compatible = "fsl,imx6sx-ocotp", .data = &imx6sx_params },
 	{ .compatible = "fsl,imx6ul-ocotp", .data = &imx6ul_params },
 	{ .compatible = "fsl,imx7d-ocotp",  .data = &imx7d_params },
+	{ .compatible = "fsl,imx6sll-ocotp", .data = &imx6sll_params },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imx_ocotp_dt_ids);
-- 
2.7.4
