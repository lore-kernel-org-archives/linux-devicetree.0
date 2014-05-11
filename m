From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCHv5 04/20] usb: ehci-orion: add optional PHY support
Date: Sun, 11 May 2014 20:17:52 +0200
Message-ID: <1399832288-19899-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1399832288-19899-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399832288-19899-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

This commit extends the ehci-orion so that it can optionally be passed
a reference to a PHY through the Device Tree. It will be useful for
the Armada 375 SoCs. If no PHY is provided then the behavior of the
driver is unchanged.

[Thomas: use devm_phy_optional_get() so that we handle -EPROBE_DEFER
properly. Also call phy_power_off() when needed, and rename goto
labels.]

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
---
 drivers/usb/host/ehci-orion.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index 9c98bac..22e15ca 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/platform_data/usb-ehci-orion.h>
 #include <linux/of.h>
+#include <linux/phy/phy.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/usb.h>
@@ -46,6 +47,7 @@
 
 struct orion_ehci_hcd {
 	struct clk *clk;
+	struct phy *phy;
 };
 
 static const char hcd_name[] = "ehci-orion";
@@ -221,6 +223,20 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 	if (!IS_ERR(priv->clk))
 		clk_prepare_enable(priv->clk);
 
+	priv->phy = devm_phy_optional_get(&pdev->dev, "usb");
+	if (IS_ERR(priv->phy)) {
+		err = PTR_ERR(priv->phy);
+		goto err_phy_get;
+	} else {
+		err = phy_init(priv->phy);
+		if (err)
+			goto err_phy_init;
+
+		err = phy_power_on(priv->phy);
+		if (err)
+			goto err_phy_power_on;
+	}
+
 	/*
 	 * (Re-)program MBUS remapping windows if we are asked to.
 	 */
@@ -256,6 +272,13 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 	return 0;
 
 err_add_hcd:
+	if (!IS_ERR(priv->phy))
+		phy_power_off(priv->phy);
+err_phy_power_on:
+	if (!IS_ERR(priv->phy))
+		phy_exit(priv->phy);
+err_phy_init:
+err_phy_get:
 	if (!IS_ERR(priv->clk))
 		clk_disable_unprepare(priv->clk);
 	usb_put_hcd(hcd);
@@ -273,6 +296,11 @@ static int ehci_orion_drv_remove(struct platform_device *pdev)
 
 	usb_remove_hcd(hcd);
 
+	if (!IS_ERR(priv->phy)) {
+		phy_power_off(priv->phy);
+		phy_exit(priv->phy);
+	}
+
 	if (!IS_ERR(priv->clk))
 		clk_disable_unprepare(priv->clk);
 
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
