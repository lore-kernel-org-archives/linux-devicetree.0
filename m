From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: [PATCH 1/2] usb: chipidea: add xilinx zynq platform data
Date: Wed, 26 Aug 2015 10:27:44 -0500
Message-ID: <1440602865-30468-1-git-send-email-nathan.sullivan@ni.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter.Chen@freescale.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Nathan Sullivan <nathan.sullivan@ni.com>
List-Id: devicetree@vger.kernel.org

The Xilinx Zynq udc does not need the CI_HDRC_DISABLE_STREAMING flag,
unlike the default platform data.  Add platform data specific to the
Zynq udc.

Based on a patch by the same name from the Xilinx vendor tree.

Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c |   25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 9eae1a1..4456d2c 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -12,6 +12,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/chipidea.h>
@@ -30,18 +31,36 @@ static const struct ci_hdrc_platform_data ci_default_pdata = {
 	.flags		= CI_HDRC_DISABLE_STREAMING,
 };
 
+static struct ci_hdrc_platform_data ci_zynq_pdata = {
+	.capoffset	= DEF_CAPOFFSET,
+};
+
+static const struct of_device_id ci_hdrc_usb2_of_match[] = {
+	{ .compatible = "chipidea,usb2"},
+	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
+
 static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct ci_hdrc_usb2_priv *priv;
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	int ret;
+	const struct of_device_id *match;
 
 	if (!ci_pdata) {
 		ci_pdata = devm_kmalloc(dev, sizeof(*ci_pdata), GFP_KERNEL);
 		*ci_pdata = ci_default_pdata;	/* struct copy */
 	}
 
+	match = of_match_device(ci_hdrc_usb2_of_match, &pdev->dev);
+	if (match && match->data) {
+		/* struct copy */
+		*ci_pdata = *(struct ci_hdrc_platform_data *)match->data;
+	}
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -96,12 +115,6 @@ static int ci_hdrc_usb2_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id ci_hdrc_usb2_of_match[] = {
-	{ .compatible = "chipidea,usb2" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
-
 static struct platform_driver ci_hdrc_usb2_driver = {
 	.probe	= ci_hdrc_usb2_probe,
 	.remove	= ci_hdrc_usb2_remove,
-- 
1.7.10.4
