From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] usb: dwc3: Added a property to set GFLADJ register
Date: Thu, 01 Sep 2016 14:32:33 -0700
Message-ID: <649b249e86e901b5bd2cf4cbe9db96d04a45f30d.1472764828.git.johnyoun@synopsys.com>
References: <ae2c9b5683820c6456f91a2ef631efa2de0bec28.1472764828.git.johnyoun@synopsys.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ae2c9b5683820c6456f91a2ef631efa2de0bec28.1472764828.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

Added gfladj variable to control the core behavior with respect to
SOF, ITP, and frame timer functionality.

Currently there is dwc->fladj that holds a single field in GFLADJ
register (GFLADJ.GFLADJ_30MHZ). A new variable gfladj is added to
dwc structure to allow setting of the entire GFLADJ register. If
dwc->gfladj is set, then it has a higher priority than dwc->fladj
when writing to the GFLADJ register.

Synopsys HW setup (HAPS DX and phy board) requires a preset to this
register to improve interoperablitity. For example, the value for
GFLADJ_REFCLK_LPM_SEL should be set to 0 with ref_clk period of 50.

Signed-off-by: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 drivers/usb/dwc3/core.c                        | 5 +++++
 drivers/usb/dwc3/core.h                        | 1 +
 drivers/usb/dwc3/dwc3-pci.c                    | 1 +
 4 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index aa54ba7..cad4bf6 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -52,6 +52,8 @@ Optional properties:
    UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has value 3.
  - snps,ref_clk_per: value for GUTCL.RefClkPer field that sets the period of
 			ref_clk in nano seconds.
+ - snps,gfladj: if set, overides the value in the GFLADJ register. Takes
+ 			precedence over snps,quirk-frame-length-adjustment.
  - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
 	register for post-silicon frame length adjustment when the
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index b96bf69..dfe1b1f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -693,6 +693,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	/* Adjust Frame Length */
 	dwc3_frame_length_adjustment(dwc);
 
+	if (dwc->gfladj != 0xffffffff)
+		dwc3_writel(dwc->regs, DWC3_GFLADJ, dwc->gfladj);
+
 	usb_phy_set_suspend(dwc->usb2_phy, 0);
 	usb_phy_set_suspend(dwc->usb3_phy, 0);
 	ret = phy_power_on(dwc->usb2_generic_phy);
@@ -955,6 +958,7 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc->maximum_speed = usb_get_maximum_speed(dev);
 	dwc->dr_mode = usb_get_dr_mode(dev);
 	dwc->hsphy_mode = of_usb_get_phy_mode(dev->of_node);
+	dwc->gfladj = 0xffffffff;
 
 	dwc->has_lpm_erratum = device_property_read_bool(dev,
 				"snps,has-lpm-erratum");
@@ -1004,6 +1008,7 @@ static int dwc3_probe(struct platform_device *pdev)
 				    &dwc->hsphy_interface);
 	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
 				 &dwc->fladj);
+	device_property_read_u32(dev, "snps,gfladj", &dwc->gfladj);
 	device_property_read_u32(dev, "snps,ref_clk_per", &dwc->ref_clk_per);
 
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ab58334..61336a9 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -878,6 +878,7 @@ struct dwc3 {
 
 	u32			ref_clk_per;
 	u32			fladj;
+	u32			gfladj;
 	u32			irq_gadget;
 	u32			nr_scratch;
 	u32			u1u2;
diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 254788b..71a52db 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -128,6 +128,7 @@ static int dwc3_pci_quirks(struct pci_dev *pdev, struct platform_device *dwc3)
 			PROPERTY_ENTRY_BOOL("snps,has-lpm-erratum"),
 			PROPERTY_ENTRY_BOOL("snps,dis_enblslpm_quirk"),
 			PROPERTY_ENTRY_U32("snps,ref_clk_per", 0x32),
+			PROPERTY_ENTRY_U32("snps,gfladj", 0xc800000),
 			{ },
 		};
 
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
