From: Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>
Subject: [PATCH v5 5/8] PCI: Prevent xHCI driver from claiming AMD Nolan USB3 DRD device
Date: Fri, 31 Oct 2014 11:11:16 +0800
Message-ID: <1414725079-11490-6-git-send-email-ray.huang@amd.com>
References: <1414725079-11490-1-git-send-email-ray.huang@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414725079-11490-1-git-send-email-ray.huang-5C7GfCeVMHo@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Jason Chang <jason.chang-5C7GfCeVMHo@public.gmane.org>, Vincent Wan <vincent.wan-5C7GfCeVMHo@public.gmane.org>, Tony Li <tony.li-5C7GfCeVMHo@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The AMD Nolan (NL) SoC contains a DesignWare USB3 Dual-Role Device that can
be operated either as a USB Host or a USB Device.  In the AMD NL platform,
this device ([1022:7912]) has a class code of PCI_CLASS_SERIAL_USB_XHCI
(0x0c0330), which means the xhci driver will claim it.

But the dwc3 driver is a more specific driver for this device, and we'd
prefer to use it instead of xhci.  To prevent xhci from claiming the
device, change the class code to 0x0c03fe, which the PCI r3.0 spec defines
as "USB device (not host controller)".  The dwc3 driver can then claim it
based on its Vendor and Device ID.

Suggested-by: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Jason Chang <jason.chang-5C7GfCeVMHo@public.gmane.org>
Signed-off-by: Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>
---
 drivers/pci/quirks.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 90acb32..ed6f89b 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -379,6 +379,26 @@ static void quirk_ati_exploding_mce(struct pci_dev *dev)
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI,	PCI_DEVICE_ID_ATI_RS100,   quirk_ati_exploding_mce);
 
 /*
+ * In the AMD NL platform, this device ([1022:7912]) has a class code of
+ * PCI_CLASS_SERIAL_USB_XHCI (0x0c0330), which means the xhci driver will
+ * claim it.
+ * But the dwc3 driver is a more specific driver for this device, and we'd
+ * prefer to use it instead of xhci. To prevent xhci from claiming the
+ * device, change the class code to 0x0c03fe, which the PCI r3.0 spec
+ * defines as "USB device (not host controller)". The dwc3 driver can then
+ * claim it based on its Vendor and Device ID.
+ */
+static void quirk_amd_nl_class(struct pci_dev *pdev)
+{
+	/*
+	 * Use 'USB Device' (0x0c03fe) instead of PCI header provided
+	 */
+	pdev->class = 0x0c03fe;
+}
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_NL_USB,
+		quirk_amd_nl_class);
+
+/*
  * Let's make the southbridge information explicit instead
  * of having to worry about people probing the ACPI areas,
  * for example.. (Yes, it happens, and if you read the wrong
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
