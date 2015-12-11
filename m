From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/3] ohci-platform: Add support for
 controllers with multiple reset lines
Date: Fri, 11 Dec 2015 16:42:00 +0100
Message-ID: <1449848520-27379-3-git-send-email-hdegoede@redhat.com>
References: <1449848520-27379-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBV65VOZQKGQEQ4OP2KA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1449848520-27379-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

At least the EHCI/OHCI found on the Allwinnner H3 SoC needs multiple
reset lines, the controller will not initialize while the reset for
its companion is still asserted, which means we need to de-assert
2 resets for the controller to work.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-New patch in v2 of this patch-set, to complement the identical patch for
 the ehci-platform code
---
 Documentation/devicetree/bindings/usb/usb-ohci.txt |  2 +-
 drivers/usb/host/ohci-platform.c                   | 49 +++++++++++++---------
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Documentation/devicetree/bindings/usb/usb-ohci.txt
index 19233b7..9df4569 100644
--- a/Documentation/devicetree/bindings/usb/usb-ohci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ohci.txt
@@ -14,7 +14,7 @@ Optional properties:
 - clocks : a list of phandle + clock specifier pairs
 - phys : phandle + phy specifier pair
 - phy-names : "usb"
-- resets : phandle + reset specifier pair
+- resets : a list of phandle + reset specifier pairs
 
 Example:
 
diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index c2669f18..7d8bbc4 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -33,11 +33,12 @@
 
 #define DRIVER_DESC "OHCI generic platform driver"
 #define OHCI_MAX_CLKS 3
+#define OHCI_MAX_RESETS 2
 #define hcd_to_ohci_priv(h) ((struct ohci_platform_priv *)hcd_to_ohci(h)->priv)
 
 struct ohci_platform_priv {
 	struct clk *clks[OHCI_MAX_CLKS];
-	struct reset_control *rst;
+	struct reset_control *resets[OHCI_MAX_RESETS];
 	struct phy **phys;
 	int num_phys;
 };
@@ -117,7 +118,7 @@ static int ohci_platform_probe(struct platform_device *dev)
 	struct usb_ohci_pdata *pdata = dev_get_platdata(&dev->dev);
 	struct ohci_platform_priv *priv;
 	struct ohci_hcd *ohci;
-	int err, irq, phy_num, clk = 0;
+	int err, irq, phy_num, clk = 0, rst = 0;
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -195,19 +196,23 @@ static int ohci_platform_probe(struct platform_device *dev)
 				break;
 			}
 		}
-
-	}
-
-	priv->rst = devm_reset_control_get_optional(&dev->dev, NULL);
-	if (IS_ERR(priv->rst)) {
-		err = PTR_ERR(priv->rst);
-		if (err == -EPROBE_DEFER)
-			goto err_put_clks;
-		priv->rst = NULL;
-	} else {
-		err = reset_control_deassert(priv->rst);
-		if (err)
-			goto err_put_clks;
+		for (rst = 0; rst < OHCI_MAX_RESETS; rst++) {
+			priv->resets[rst] =
+				of_reset_control_get_by_index(dev->dev.of_node,
+							      rst);
+			if (IS_ERR(priv->resets[rst])) {
+				err = PTR_ERR(priv->resets[rst]);
+				if (err == -EPROBE_DEFER)
+					goto err_reset;
+				priv->resets[rst] = NULL;
+				break;
+			}
+			err = reset_control_deassert_shared(priv->resets[rst]);
+			if (err) {
+				reset_control_put(priv->resets[rst]);
+				goto err_reset;
+			}
+		}
 	}
 
 	if (pdata->big_endian_desc)
@@ -265,8 +270,10 @@ err_power:
 	if (pdata->power_off)
 		pdata->power_off(dev);
 err_reset:
-	if (priv->rst)
-		reset_control_assert(priv->rst);
+	while (--rst >= 0) {
+		reset_control_assert_shared(priv->resets[rst]);
+		reset_control_put(priv->resets[rst]);
+	}
 err_put_clks:
 	while (--clk >= 0)
 		clk_put(priv->clks[clk]);
@@ -284,15 +291,17 @@ static int ohci_platform_remove(struct platform_device *dev)
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
 	struct usb_ohci_pdata *pdata = dev_get_platdata(&dev->dev);
 	struct ohci_platform_priv *priv = hcd_to_ohci_priv(hcd);
-	int clk;
+	int clk, rst;
 
 	usb_remove_hcd(hcd);
 
 	if (pdata->power_off)
 		pdata->power_off(dev);
 
-	if (priv->rst)
-		reset_control_assert(priv->rst);
+	for (rst = 0; rst < OHCI_MAX_RESETS && priv->resets[rst]; rst++) {
+		reset_control_assert_shared(priv->resets[rst]);
+		reset_control_put(priv->resets[rst]);
+	}
 
 	for (clk = 0; clk < OHCI_MAX_CLKS && priv->clks[clk]; clk++)
 		clk_put(priv->clks[clk]);
-- 
2.5.0
