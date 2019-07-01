From: Anson.Huang@nxp.com
Subject: [PATCH 1/2] reset: imx7: Add support for i.MX8MM SoC
Date: Mon,  1 Jul 2019 17:39:43 +0800
Message-ID: <20190701093944.5540-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de, leonard.crestez@nxp.com, viresh.kumar@linaro.org, daniel.baluta@nxp.com, ping.bai@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

i.MX8MM SoC has a subset of i.MX8MQ IP block variant, it can reuse
the i.MX8MQ reset controller driver and just skip those non-existing
IP blocks, add support for i.MX8MM SoC reset control.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/reset/reset-imx7.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index 3ecd770..941131f 100644
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@ -207,6 +207,26 @@ static int imx8mq_reset_set(struct reset_controller_dev *rcdev,
 	const unsigned int bit = imx7src->signals[id].bit;
 	unsigned int value = assert ? bit : 0;
 
+	if (of_machine_is_compatible("fsl,imx8mm")) {
+		switch (id) {
+		case IMX8MQ_RESET_HDMI_PHY_APB_RESET:
+		case IMX8MQ_RESET_PCIEPHY2: /* fallthrough */
+		case IMX8MQ_RESET_PCIEPHY2_PERST: /* fallthrough */
+		case IMX8MQ_RESET_PCIE2_CTRL_APPS_EN: /* fallthrough */
+		case IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF: /* fallthrough */
+		case IMX8MQ_RESET_MIPI_CSI1_CORE_RESET: /* fallthrough */
+		case IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET: /* fallthrough */
+		case IMX8MQ_RESET_MIPI_CSI1_ESC_RESET: /* fallthrough */
+		case IMX8MQ_RESET_MIPI_CSI2_CORE_RESET: /* fallthrough */
+		case IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET: /* fallthrough */
+		case IMX8MQ_RESET_MIPI_CSI2_ESC_RESET: /* fallthrough */
+		case IMX8MQ_RESET_DDRC2_PHY_RESET: /* fallthrough */
+		case IMX8MQ_RESET_DDRC2_CORE_RESET: /* fallthrough */
+		case IMX8MQ_RESET_DDRC2_PRST: /* fallthrough */
+			return 0;
+		}
+	}
+
 	switch (id) {
 	case IMX8MQ_RESET_PCIEPHY:
 	case IMX8MQ_RESET_PCIEPHY2: /* fallthrough */
-- 
2.7.4
