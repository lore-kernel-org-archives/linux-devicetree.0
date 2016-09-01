From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] usb: dwc3: Add ref clock period setting
Date: Thu, 01 Sep 2016 14:32:30 -0700
Message-ID: <ae2c9b5683820c6456f91a2ef631efa2de0bec28.1472764828.git.johnyoun@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

Added ref_clk_per for writing to GUCTL.RefClkPer which
sets the period of ref_clk in nano second.

Signed-off-by: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt |  2 ++
 drivers/usb/dwc3/core.c                        | 21 +++++++++++++++++++++
 drivers/usb/dwc3/core.h                        |  5 +++++
 drivers/usb/dwc3/dwc3-pci.c                    |  1 +
 4 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index e3e6983..aa54ba7 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -50,6 +50,8 @@ Optional properties:
  - snps,hird-threshold: HIRD threshold
  - snps,hsphy_interface: High-Speed PHY interface selection between "utmi" for
    UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has value 3.
+ - snps,ref_clk_per: value for GUTCL.RefClkPer field that sets the period of
+			ref_clk in nano seconds.
  - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
 	register for post-silicon frame length adjustment when the
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index d6d3fa0..b96bf69 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -145,6 +145,23 @@ static int dwc3_soft_reset(struct dwc3 *dwc)
 	return 0;
 }
 
+/*
+ * dwc3_ref_clock_period - Sets the reference clock period
+ * @dwc3: Pointer to our controller context structure
+ */
+static void dwc3_ref_clock_period(struct dwc3 *dwc)
+{
+	u32 reg;
+
+	if (dwc->ref_clk_per == 0)
+		return;
+
+	reg = dwc3_readl(dwc->regs, DWC3_GUCTL);
+	reg &= ~DWC3_GUCTL_REFCLKPER_MASK;
+	reg |= DWC3_GUCTL_REFCLKPER(dwc->ref_clk_per);
+	dwc3_writel(dwc->regs, DWC3_GUCTL, reg);
+}
+
 /*
  * dwc3_frame_length_adjustment - Adjusts frame length if required
  * @dwc3: Pointer to our controller context structure
@@ -670,6 +687,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	if (ret)
 		goto err1;
 
+	/* Initialize ref clock period */
+	dwc3_ref_clock_period(dwc);
+
 	/* Adjust Frame Length */
 	dwc3_frame_length_adjustment(dwc);
 
@@ -984,6 +1004,7 @@ static int dwc3_probe(struct platform_device *pdev)
 				    &dwc->hsphy_interface);
 	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
 				 &dwc->fladj);
+	device_property_read_u32(dev, "snps,ref_clk_per", &dwc->ref_clk_per);
 
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index b2317e7..ab58334 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -198,6 +198,10 @@
 #define DWC3_GCTL_GBLHIBERNATIONEN	(1 << 1)
 #define DWC3_GCTL_DSBLCLKGTNG		(1 << 0)
 
+/* Global USB3 user Control Register */
+#define DWC3_GUCTL_REFCLKPER(n)		((n) << 22)
+#define DWC3_GUCTL_REFCLKPER_MASK	DWC3_GUCTL_REFCLKPER(0x3ff)
+
 /* Global USB2 PHY Configuration Register */
 #define DWC3_GUSB2PHYCFG_PHYSOFTRST	(1 << 31)
 #define DWC3_GUSB2PHYCFG_U2_FREECLK_EXISTS	(1 << 30)
@@ -872,6 +876,7 @@ struct dwc3 {
 	enum usb_dr_mode	dr_mode;
 	enum usb_phy_interface	hsphy_mode;
 
+	u32			ref_clk_per;
 	u32			fladj;
 	u32			irq_gadget;
 	u32			nr_scratch;
diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 2eb84d6..254788b 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -127,6 +127,7 @@ static int dwc3_pci_quirks(struct pci_dev *pdev, struct platform_device *dwc3)
 			PROPERTY_ENTRY_BOOL("snps,usb3_lpm_capable"),
 			PROPERTY_ENTRY_BOOL("snps,has-lpm-erratum"),
 			PROPERTY_ENTRY_BOOL("snps,dis_enblslpm_quirk"),
+			PROPERTY_ENTRY_U32("snps,ref_clk_per", 0x32),
 			{ },
 		};
 
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
