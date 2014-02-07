From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v9 4/4] ehci-platform: Add support for
 controllers with big-endian regs / descriptors
Date: Fri,  7 Feb 2014 16:36:43 +0100
Message-ID: <1391787403-20961-5-git-send-email-hdegoede@redhat.com>
References: <1391787403-20961-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBHP32OLQKGQEO34T77Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1391787403-20961-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This uses the already documented devicetree booleans for this, see:
Documentation/devicetree/bindings/usb/usb-ehci.txt

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-platform.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index 5ebd0b7..8fde649 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -55,8 +55,10 @@ static int ehci_platform_reset(struct usb_hcd *hcd)
 
 	hcd->has_tt = pdata->has_tt;
 	ehci->has_synopsys_hc_bug = pdata->has_synopsys_hc_bug;
-	ehci->big_endian_desc = pdata->big_endian_desc;
-	ehci->big_endian_mmio = pdata->big_endian_mmio;
+	if (pdata->big_endian_desc)
+		ehci->big_endian_desc = 1;
+	if (pdata->big_endian_mmio)
+		ehci->big_endian_mmio = 1;
 
 	if (pdata->pre_setup) {
 		retval = pdata->pre_setup(hcd);
@@ -142,6 +144,7 @@ static int ehci_platform_probe(struct platform_device *dev)
 	struct resource *res_mem;
 	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
 	struct ehci_platform_priv *priv;
+	struct ehci_hcd *ehci;
 	int err, irq, clk = 0;
 
 	if (usb_disabled())
@@ -177,8 +180,34 @@ static int ehci_platform_probe(struct platform_device *dev)
 	platform_set_drvdata(dev, hcd);
 	dev->dev.platform_data = pdata;
 	priv = hcd_to_ehci_priv(hcd);
+	ehci = hcd_to_ehci(hcd);
 
 	if (pdata == &ehci_platform_defaults && dev->dev.of_node) {
+		if (of_property_read_bool(dev->dev.of_node, "big-endian-regs"))
+			ehci->big_endian_mmio = 1;
+
+		if (of_property_read_bool(dev->dev.of_node, "big-endian-desc"))
+			ehci->big_endian_desc = 1;
+
+		if (of_property_read_bool(dev->dev.of_node, "big-endian"))
+			ehci->big_endian_mmio = ehci->big_endian_desc = 1;
+
+#ifndef CONFIG_USB_EHCI_BIG_ENDIAN_MMIO
+		if (ehci->big_endian_mmio) {
+			dev_err(&dev->dev,
+				"Error big-endian-regs not compiled in\n");
+			err = -EINVAL;
+			goto err_put_hcd;
+		}
+#endif
+#ifndef CONFIG_USB_EHCI_BIG_ENDIAN_DESC
+		if (ehci->big_endian_desc) {
+			dev_err(&dev->dev,
+				"Error big-endian-desc not compiled in\n");
+			err = -EINVAL;
+			goto err_put_hcd;
+		}
+#endif
 		priv->phy = devm_phy_get(&dev->dev, "usb");
 		if (IS_ERR(priv->phy)) {
 			err = PTR_ERR(priv->phy);
-- 
1.8.4.2
