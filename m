From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v8 3/4] ohci-platform: Add support for controllers with big-endian regs / descriptors
Date: Wed, 22 Jan 2014 20:32:56 +0100
Message-ID: <1390419177-6481-4-git-send-email-hdegoede@redhat.com>
References: <1390419177-6481-1-git-send-email-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390419177-6481-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
index b2d0e1e..71e9d8e 100644
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
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
