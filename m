From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v9 2/5] usb: dwc3: make usb2 phy utmi interface configurable
Date: Mon, 15 Aug 2016 14:59:56 +0800
Message-ID: <1471244399-1356-3-git-send-email-william.wu@rock-chips.com>
References: <1471244399-1356-1-git-send-email-william.wu@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471244399-1356-1-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Support to configure the UTMI+ PHY with an 8- or 16-bit
interface via DT. The UTMI+ PHY interface is a hardware
capability, and it's platform dependent. Normally, the
PHYIF can be configured during coreconsultant.

But for some specific USB cores(e.g. rk3399 SoC DWC3),
the default PHYIF configuration value is false, so we
need to reconfigure it by software.

Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes in v9:
- None

Changes in v8:
- configure utmi interface via phy_type property in DT (Heiko, Rob Herring)
- add Acked-by (Rob Herring)
- modify commit message (Rob Herring)

Changes in v7:
- remove quirk and use only one property to configure utmi (Heiko, Rob Herring)

Changes in v6:
- use '-' instead of '_' in dts (Rob Herring)

Changes in v5:
- None

Changes in v4:
- rebase on top of balbi testing/next, remove pdata (balbi)

Changes in v3:
- None

Changes in v2:
- add a quirk for phyif_utmi (balbi)

 Documentation/devicetree/bindings/usb/generic.txt |  6 ++++++
 drivers/usb/dwc3/core.c                           | 18 ++++++++++++++++++
 drivers/usb/dwc3/core.h                           | 12 ++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index bba8257..bfadeb1 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -11,6 +11,11 @@ Optional properties:
 			"peripheral" and "otg". In case this attribute isn't
 			passed via DT, USB DRD controllers should default to
 			OTG.
+ - phy_type: tells USB controllers that we want to configure the core to support
+			a UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is
+			selected. Valid arguments are "utmi" and "utmi_wide".
+			In case this isn't passed via DT, USB controllers should
+			default to HW capability.
  - otg-rev: tells usb driver the release number of the OTG and EH supplement
 			with which the device and its descriptors are compliant,
 			in binary-coded decimal (i.e. 2.0 is 0200H). This
@@ -34,6 +39,7 @@ dwc3@4a030000 {
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	maximum-speed = "super-speed";
 	dr_mode = "otg";
+	phy_type = "utmi_wide";
 	otg-rev = <0x0200>;
 	adp-disable;
 };
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 14316e5..cdac019 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -485,6 +485,23 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
 		break;
 	}
 
+	switch (dwc->hsphy_mode) {
+	case USBPHY_INTERFACE_MODE_UTMI:
+		reg &= ~(DWC3_GUSB2PHYCFG_PHYIF_MASK |
+		       DWC3_GUSB2PHYCFG_USBTRDTIM_MASK);
+		reg |= DWC3_GUSB2PHYCFG_PHYIF(UTMI_PHYIF_8_BIT) |
+		       DWC3_GUSB2PHYCFG_USBTRDTIM(USBTRDTIM_UTMI_8_BIT);
+		break;
+	case USBPHY_INTERFACE_MODE_UTMIW:
+		reg &= ~(DWC3_GUSB2PHYCFG_PHYIF_MASK |
+		       DWC3_GUSB2PHYCFG_USBTRDTIM_MASK);
+		reg |= DWC3_GUSB2PHYCFG_PHYIF(UTMI_PHYIF_16_BIT) |
+		       DWC3_GUSB2PHYCFG_USBTRDTIM(USBTRDTIM_UTMI_16_BIT);
+		break;
+	default:
+		break;
+	}
+
 	/*
 	 * Above 1.94a, it is recommended to set DWC3_GUSB2PHYCFG_SUSPHY to
 	 * '0' during coreConsultant configuration. So default value will
@@ -891,6 +908,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc->maximum_speed = usb_get_maximum_speed(dev);
 	dwc->dr_mode = usb_get_dr_mode(dev);
+	dwc->hsphy_mode = of_usb_get_phy_mode(dev->of_node);
 
 	dwc->has_lpm_erratum = device_property_read_bool(dev,
 				"snps,has-lpm-erratum");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 08ed9e0..cc4f551 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -203,6 +203,14 @@
 #define DWC3_GUSB2PHYCFG_SUSPHY		(1 << 6)
 #define DWC3_GUSB2PHYCFG_ULPI_UTMI	(1 << 4)
 #define DWC3_GUSB2PHYCFG_ENBLSLPM	(1 << 8)
+#define DWC3_GUSB2PHYCFG_PHYIF(n)	(n << 3)
+#define DWC3_GUSB2PHYCFG_PHYIF_MASK	DWC3_GUSB2PHYCFG_PHYIF(1)
+#define DWC3_GUSB2PHYCFG_USBTRDTIM(n)	(n << 10)
+#define DWC3_GUSB2PHYCFG_USBTRDTIM_MASK	DWC3_GUSB2PHYCFG_USBTRDTIM(0xf)
+#define USBTRDTIM_UTMI_8_BIT		9
+#define USBTRDTIM_UTMI_16_BIT		5
+#define UTMI_PHYIF_16_BIT		1
+#define UTMI_PHYIF_8_BIT		0
 
 /* Global USB2 PHY Vendor Control Register */
 #define DWC3_GUSB2PHYACC_NEWREGREQ	(1 << 25)
@@ -748,6 +756,9 @@ struct dwc3_scratchpad_array {
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
  * @revision: revision register contents
  * @dr_mode: requested mode of operation
+ * @hsphy_mode: UTMI phy mode, one of following:
+ *		- USBPHY_INTERFACE_MODE_UTMI
+ *		- USBPHY_INTERFACE_MODE_UTMIW
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to USB2 PHY
@@ -853,6 +864,7 @@ struct dwc3 {
 	size_t			regs_size;
 
 	enum usb_dr_mode	dr_mode;
+	enum usb_phy_interface	hsphy_mode;
 
 	u32			fladj;
 	u32			irq_gadget;
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
