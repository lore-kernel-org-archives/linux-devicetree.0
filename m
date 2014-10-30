From: Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>
Subject: [PATCH v4 19/20] usb: dwc3: add support for AMD Nolan platform
Date: Thu, 30 Oct 2014 18:08:44 +0800
Message-ID: <1414663725-2195-20-git-send-email-ray.huang@amd.com>
References: <1414663725-2195-1-git-send-email-ray.huang@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414663725-2195-1-git-send-email-ray.huang-5C7GfCeVMHo@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Jason Chang <jason.chang-5C7GfCeVMHo@public.gmane.org>, Vincent Wan <vincent.wan-5C7GfCeVMHo@public.gmane.org>, Tony Li <tony.li-5C7GfCeVMHo@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for AMD Nolan (NL) FPGA and SoC platform.

Cc: Jason Chang <jason.chang-5C7GfCeVMHo@public.gmane.org>
Signed-off-by: Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>
---
 drivers/usb/dwc3/dwc3-pci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index ada975f..257fb3f9e 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -145,6 +145,28 @@ static int dwc3_pci_probe(struct pci_dev *pci,
 	res[1].name	= "dwc_usb3";
 	res[1].flags	= IORESOURCE_IRQ;
 
+	if (pci->vendor == PCI_VENDOR_ID_AMD &&
+			pci->device == PCI_DEVICE_ID_AMD_NL_USB) {
+		dwc3_pdata.has_lpm_erratum = true;
+		dwc3_pdata.lpm_nyet_threshold = 0xf;
+
+		dwc3_pdata.u2exit_lfps_quirk = true;
+		dwc3_pdata.u2ss_inp3_quirk = true;
+		dwc3_pdata.req_p1p2p3_quirk = true;
+		dwc3_pdata.del_p1p2p3_quirk = true;
+		dwc3_pdata.del_phy_power_chg_quirk = true;
+		dwc3_pdata.lfps_filter_quirk = true;
+		dwc3_pdata.rx_detect_poll_quirk = true;
+
+		dwc3_pdata.tx_de_emphasis_quirk = true;
+		dwc3_pdata.tx_de_emphasis = 1;
+
+		/* FIXME these quirks should move when AMD NL taps out */
+		dwc3_pdata.disable_scramble_quirk = true;
+		dwc3_pdata.dis_u3_susphy_quirk = true;
+		dwc3_pdata.dis_u2_susphy_quirk = true;
+	}
+
 	ret = platform_device_add_resources(dwc3, res, ARRAY_SIZE(res));
 	if (ret) {
 		dev_err(dev, "couldn't add resources to dwc3 device\n");
@@ -194,6 +216,7 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_BSW), },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_BYT), },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_MRFLD), },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_NL_USB), },
 	{  }	/* Terminating Entry */
 };
 MODULE_DEVICE_TABLE(pci, dwc3_pci_id_table);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
