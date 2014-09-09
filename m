From: Frank Li <Frank.Li@freescale.com>
Subject: [Patch v2 net-next 08/12] net:fec: Add fsl,imx6sx-fec  compatible strings
Date: Wed, 10 Sep 2014 04:15:39 +0800
Message-ID: <1410293743-27874-9-git-send-email-Frank.Li@freescale.com>
References: <1410293743-27874-1-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1410293743-27874-1-git-send-email-Frank.Li@freescale.com>
Sender: netdev-owner@vger.kernel.org
To: b38611@freescale.com, davem@davemloft.net, netdev@vger.kernel.org, lznuaa@gmail.com
Cc: shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Fugang Duan <B38611@freescale.com>, Frank Li <Frank.Li@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Fugang Duan <B38611@freescale.com>

Add compatible string "fsl,imx6sx-fec" for i.MX6SX.

Signed-off-by: Fugang Duan <B38611@freescale.com>
Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 658b0b3..0cc7313 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -157,6 +157,7 @@ enum imx_fec_type {
 	IMX28_FEC,
 	IMX6Q_FEC,
 	MVF600_FEC,
+	IMX6SX_FEC,
 };
 
 static const struct of_device_id fec_dt_ids[] = {
@@ -165,6 +166,7 @@ static const struct of_device_id fec_dt_ids[] = {
 	{ .compatible = "fsl,imx28-fec", .data = &fec_devtype[IMX28_FEC], },
 	{ .compatible = "fsl,imx6q-fec", .data = &fec_devtype[IMX6Q_FEC], },
 	{ .compatible = "fsl,mvf600-fec", .data = &fec_devtype[MVF600_FEC], },
+	{ .compatible = "fsl,imx6sx-fec", .data = &fec_devtype[IMX6SX_FEC], },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fec_dt_ids);
-- 
1.9.1
