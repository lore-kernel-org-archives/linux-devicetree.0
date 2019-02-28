From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 2/3] nvmem: imx-ocotp: add support for imx8mq
Date: Thu, 28 Feb 2019 08:01:36 +0100
Message-ID: <20190228070137.30867-2-l.stach@pengutronix.de>
References: <20190228070137.30867-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190228070137.30867-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>, Carlo Caione <ccaione@baylibre.com>, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The i.MX8MQ uses the same OCOTP block as the i.MX7D, but with
fourfold increase in fuse banks.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
---
v2:
- rebased on linux-next
- collected reviewed
---
 drivers/nvmem/imx-ocotp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 08a9b1ef8ae4..e0b22b6c045b 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -444,6 +444,12 @@ static const struct ocotp_params imx7ulp_params = {
 	.bank_address_words = 0,
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
@@ -453,6 +459,7 @@ static const struct of_device_id imx_ocotp_dt_ids[] = {
 	{ .compatible = "fsl,imx7d-ocotp",  .data = &imx7d_params },
 	{ .compatible = "fsl,imx6sll-ocotp", .data = &imx6sll_params },
 	{ .compatible = "fsl,imx7ulp-ocotp", .data = &imx7ulp_params },
+	{ .compatible = "fsl,imx8mq-ocotp", .data = &imx8mq_params },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imx_ocotp_dt_ids);
-- 
2.20.1
