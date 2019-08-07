From: fugang.duan@nxp.com
Subject: [PATCH nvmem v2 1/2] nvmem: imx: add i.MX8QM platform support
Date: Wed,  7 Aug 2019 12:03:19 +0800
Message-ID: <20190807040320.1760-2-fugang.duan@nxp.com>
References: <20190807040320.1760-1-fugang.duan@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807040320.1760-1-fugang.duan@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, shawnguo@kernel.org, fugang.duan@nxp.com, kernel@pengutronix.de, gregkh@linuxfoundation.org, festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

i.MX8QM efuse table has some difference with i.MX8QXP platform,
so add i.MX8QM platform support.

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
---
 drivers/nvmem/imx-ocotp-scu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
index be2f5f0..0d78ab4 100644
--- a/drivers/nvmem/imx-ocotp-scu.c
+++ b/drivers/nvmem/imx-ocotp-scu.c
@@ -16,6 +16,7 @@
 
 enum ocotp_devtype {
 	IMX8QXP,
+	IMX8QM,
 };
 
 struct ocotp_devtype_data {
@@ -39,6 +40,11 @@ static struct ocotp_devtype_data imx8qxp_data = {
 	.nregs = 800,
 };
 
+static struct ocotp_devtype_data imx8qm_data = {
+	.devtype = IMX8QM,
+	.nregs = 800,
+};
+
 static int imx_sc_misc_otp_fuse_read(struct imx_sc_ipc *ipc, u32 word,
 				     u32 *val)
 {
@@ -118,6 +124,7 @@ static struct nvmem_config imx_scu_ocotp_nvmem_config = {
 
 static const struct of_device_id imx_scu_ocotp_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-scu-ocotp", (void *)&imx8qxp_data },
+	{ .compatible = "fsl,imx8qm-scu-ocotp", (void *)&imx8qm_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imx_scu_ocotp_dt_ids);
-- 
2.7.4
