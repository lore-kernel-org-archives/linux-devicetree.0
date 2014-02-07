From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v9 3/4] ohci-platform: Add support for
 controllers with big-endian regs / descriptors
Date: Fri,  7 Feb 2014 16:36:42 +0100
Message-ID: <1391787403-20961-4-git-send-email-hdegoede@redhat.com>
References: <1391787403-20961-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBG732OLQKGQEM7V5AGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Note this commit uses the same devicetree booleans for this as the ones
already existing in the usb-ehci bindings, see:
Documentation/devicetree/bindings/usb/usb-ehci.txt

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-ohci.txt |  3 +++
 drivers/usb/host/ohci-platform.c                   | 27 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Documentation/devicetree/bindings/usb/usb-ohci.txt
index 6ba38d9..6933b0c 100644
--- a/Documentation/devicetree/bindings/usb/usb-ohci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ohci.txt
@@ -6,6 +6,9 @@ Required properties:
 - interrupts : ohci controller interrupt
 
 Optional properties:
+- big-endian-regs : boolean, set this for hcds with big-endian registers
+- big-endian-desc : boolean, set this for hcds with big-endian descriptors
+- big-endian : boolean, for hcds with big-endian-regs + big-endian-desc
 - clocks : a list of phandle + clock specifier pairs
 - phys : phandle + phy specifier pair
 - phy-names : "usb"
diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 49304dd..e2c28fd 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -128,6 +128,7 @@ static int ohci_platform_probe(struct platform_device *dev)
 	struct resource *res_mem;
 	struct usb_ohci_pdata *pdata = dev_get_platdata(&dev->dev);
 	struct ohci_platform_priv *priv;
+	struct ohci_hcd *ohci;
 	int err, irq, clk = 0;
 
 	if (usb_disabled())
@@ -164,8 +165,34 @@ static int ohci_platform_probe(struct platform_device *dev)
 	platform_set_drvdata(dev, hcd);
 	dev->dev.platform_data = pdata;
 	priv = hcd_to_ohci_priv(hcd);
+	ohci = hcd_to_ohci(hcd);
 
 	if (pdata == &ohci_platform_defaults && dev->dev.of_node) {
+		if (of_property_read_bool(dev->dev.of_node, "big-endian-regs"))
+			ohci->flags |= OHCI_QUIRK_BE_MMIO;
+
+		if (of_property_read_bool(dev->dev.of_node, "big-endian-desc"))
+			ohci->flags |= OHCI_QUIRK_BE_DESC;
+
+		if (of_property_read_bool(dev->dev.of_node, "big-endian"))
+			ohci->flags |= OHCI_QUIRK_BE_MMIO | OHCI_QUIRK_BE_DESC;
+
+#ifndef CONFIG_USB_OHCI_BIG_ENDIAN_MMIO
+		if (ohci->flags & OHCI_QUIRK_BE_MMIO) {
+			dev_err(&dev->dev,
+				"Error big-endian-regs not compiled in\n");
+			err = -EINVAL;
+			goto err_put_hcd;
+		}
+#endif
+#ifndef CONFIG_USB_OHCI_BIG_ENDIAN_DESC
+		if (ohci->flags & OHCI_QUIRK_BE_DESC) {
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
