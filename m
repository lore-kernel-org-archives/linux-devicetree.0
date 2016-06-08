From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ehci-platform: Add support for shared reset controllers
Date: Wed,  8 Jun 2016 18:54:40 +0200
Message-ID: <1465404880-28374-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for shared platform controllers by using
devm_reset_control_get_shared_by_index instead of
of_reset_control_get_by_index.

Note we use the devm function because there is no
of_reset_control_get_shared_by_index, this also leads
to a nice cleanup of the cleanup code.

This brings the ehci-platform reset handling code inline
with ohci-platform.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-platform.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index bc33f45..6816b8c 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -236,8 +236,8 @@ static int ehci_platform_probe(struct platform_device *dev)
 	}
 
 	for (rst = 0; rst < EHCI_MAX_RSTS; rst++) {
-		priv->rsts[rst] = of_reset_control_get_by_index(
-					dev->dev.of_node, rst);
+		priv->rsts[rst] = devm_reset_control_get_shared_by_index(
+					&dev->dev, rst);
 		if (IS_ERR(priv->rsts[rst])) {
 			err = PTR_ERR(priv->rsts[rst]);
 			if (err == -EPROBE_DEFER)
@@ -247,10 +247,8 @@ static int ehci_platform_probe(struct platform_device *dev)
 		}
 
 		err = reset_control_deassert(priv->rsts[rst]);
-		if (err) {
-			reset_control_put(priv->rsts[rst]);
+		if (err)
 			goto err_reset;
-		}
 	}
 
 	if (pdata->big_endian_desc)
@@ -307,10 +305,8 @@ err_power:
 	if (pdata->power_off)
 		pdata->power_off(dev);
 err_reset:
-	while (--rst >= 0) {
+	while (--rst >= 0)
 		reset_control_assert(priv->rsts[rst]);
-		reset_control_put(priv->rsts[rst]);
-	}
 err_put_clks:
 	while (--clk >= 0)
 		clk_put(priv->clks[clk]);
@@ -335,10 +331,8 @@ static int ehci_platform_remove(struct platform_device *dev)
 	if (pdata->power_off)
 		pdata->power_off(dev);
 
-	for (rst = 0; rst < EHCI_MAX_RSTS && priv->rsts[rst]; rst++) {
+	for (rst = 0; rst < EHCI_MAX_RSTS && priv->rsts[rst]; rst++)
 		reset_control_assert(priv->rsts[rst]);
-		reset_control_put(priv->rsts[rst]);
-	}
 
 	for (clk = 0; clk < EHCI_MAX_CLKS && priv->clks[clk]; clk++)
 		clk_put(priv->clks[clk]);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
