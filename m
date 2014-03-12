From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 1/8] watchdog: orion: Introduce a SoC-specific RSTOUT mapping
Date: Wed, 12 Mar 2014 18:11:48 -0300
Message-ID: <1394658715-2017-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1394658715-2017-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394658715-2017-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Separate the RSTOUT register mapping for the different compatible
strings supported by the driver. This allows to use devm_ioremap
on SoC variants that share the RSTOUT register, and devm_ioremap_resource
(which requests the MMIO region) on SoCs that have a dedicated RSTOUT
register.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/watchdog/orion_wdt.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 6f9b4c6..76ebcdd 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -263,10 +263,6 @@ static void __iomem *orion_wdt_ioremap_rstout(struct platform_device *pdev,
 		return devm_ioremap(&pdev->dev, res->start,
 				    resource_size(res));
 
-	/* This workaround works only for "orion-wdt", DT-enabled */
-	if (!of_device_is_compatible(pdev->dev.of_node, "marvell,orion-wdt"))
-		return NULL;
-
 	rstout = internal_regs + ORION_RSTOUT_MASK_OFFSET;
 
 	WARN(1, FW_BUG "falling back to harcoded RSTOUT reg %pa\n", &rstout);
@@ -317,6 +313,7 @@ MODULE_DEVICE_TABLE(of, orion_wdt_of_match_table);
 static int orion_wdt_probe(struct platform_device *pdev)
 {
 	struct orion_watchdog *dev;
+	struct device_node *node = pdev->dev.of_node;
 	const struct of_device_id *match;
 	unsigned int wdt_max_duration;	/* (seconds) */
 	struct resource *res;
@@ -346,10 +343,25 @@ static int orion_wdt_probe(struct platform_device *pdev)
 	if (!dev->reg)
 		return -ENOMEM;
 
-	dev->rstout = orion_wdt_ioremap_rstout(pdev, res->start &
-						     INTERNAL_REGS_MASK);
-	if (!dev->rstout)
+	if (of_device_is_compatible(node, "marvell,orion-wdt")) {
+
+		dev->rstout = orion_wdt_ioremap_rstout(pdev, res->start &
+						       INTERNAL_REGS_MASK);
+		if (!dev->rstout)
+			return -ENODEV;
+
+	} else if (of_device_is_compatible(node, "marvell,armada-370-wdt") ||
+		   of_device_is_compatible(node, "marvell,armada-xp-wdt")) {
+
+		/* Dedicated RSTOUT register, can be requested. */
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		dev->rstout = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(dev->rstout))
+			return PTR_ERR(dev->rstout);
+
+	} else {
 		return -ENODEV;
+	}
 
 	ret = dev->data->clock_init(pdev, dev);
 	if (ret) {
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
