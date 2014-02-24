From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v11 05/15] usb: phy-mxs: Add anatop regmap
Date: Mon, 24 Feb 2014 10:20:57 +0800
Message-ID: <1393208467-6355-6-git-send-email-peter.chen@freescale.com>
References: <1393208467-6355-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1393208467-6355-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: balbi@ti.com, shawn.guo@linaro.org, robh+dt@kernel.org, grant.likely@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, peter.chen@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

It is needed by imx6 SoC series, but not for imx23 and imx28.

Signed-off-by: Peter Chen <peter.chen@freescale.com>
---
 drivers/usb/phy/phy-mxs-usb.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index d7adca3..2411e05 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -21,6 +21,8 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 
 #define DRIVER_NAME "mxs_phy"
 
@@ -87,6 +89,7 @@ struct mxs_phy {
 	struct usb_phy phy;
 	struct clk *clk;
 	const struct mxs_phy_data *data;
+	struct regmap *regmap_anatop;
 };
 
 static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
@@ -197,6 +200,7 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	int ret;
 	const struct of_device_id *of_id =
 			of_match_device(mxs_phy_dt_ids, &pdev->dev);
+	struct device_node *np = pdev->dev.of_node;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
@@ -216,6 +220,17 @@ static int mxs_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	/* Some SoCs don't have anatop registers */
+	if (of_get_property(np, "fsl,anatop", NULL)) {
+		mxs_phy->regmap_anatop = syscon_regmap_lookup_by_phandle
+			(np, "fsl,anatop");
+		if (IS_ERR(mxs_phy->regmap_anatop)) {
+			dev_dbg(&pdev->dev,
+				"failed to find regmap for anatop\n");
+			return PTR_ERR(mxs_phy->regmap_anatop);
+		}
+	}
+
 	mxs_phy->phy.io_priv		= base;
 	mxs_phy->phy.dev		= &pdev->dev;
 	mxs_phy->phy.label		= DRIVER_NAME;
-- 
1.7.8


