From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v7 3/5] usb: dwc3: make usb2 phy utmi interface configurable in DT
Date: Thu, 14 Jul 2016 16:59:20 +0800
Message-ID: <1468486762-21960-4-git-send-email-william.wu@rock-chips.com>
References: <1468486762-21960-1-git-send-email-william.wu@rock-chips.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468486762-21960-1-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add snps,phyif-utmi-width devicetree property to configure
the UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
interface is a hardware property, and it's platform dependent.
Normally,the PHYIF can be configured during coreconsultant.
But for some specific USB cores(e.g. rk3399 SoC DWC3), the
default PHYIF configuration value is fault, so we need to
reconfigure it by software.

And refer to the DWC3 databook, the GUSB2PHYCFG.USBTRDTIM
must be set to the corresponding value according to the
UTMI+ PHY interface.

Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
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

 Documentation/devicetree/bindings/usb/dwc3.txt |  3 +++
 drivers/usb/dwc3/core.c                        | 25 +++++++++++++++++++++++++
 drivers/usb/dwc3/core.h                        | 10 ++++++++++
 3 files changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 020b0e9..00cc541 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -47,6 +47,9 @@ Optional properties:
  - snps,hird-threshold: HIRD threshold
  - snps,hsphy_interface: High-Speed PHY interface selection between "utmi" for
    UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has value 3.
+ - snps,phyif-utmi-width: the value to configure the core to support a UTMI+ PHY
+			with an 8- or 16-bit interface. Value 8 select 8-bit
+			interface, value 16 select 16-bit interface.
  - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
 	register for post-silicon frame length adjustment when the
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 0b7bfd2..40c54db 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -408,6 +408,8 @@ static void dwc3_cache_hwparams(struct dwc3 *dwc)
 static int dwc3_phy_setup(struct dwc3 *dwc)
 {
 	u32 reg;
+	u32 usbtrdtim;
+	u8 phyif;
 	int ret;
 
 	reg = dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
@@ -503,6 +505,16 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
 	if (dwc->dis_u2_freeclk_exists_quirk)
 		reg &= ~DWC3_GUSB2PHYCFG_U2_FREECLK_EXISTS;
 
+	if (dwc->phyif_utmi_width > 0) {
+		reg &= ~(DWC3_GUSB2PHYCFG_PHYIF_MASK |
+		       DWC3_GUSB2PHYCFG_USBTRDTIM_MASK);
+		usbtrdtim = (dwc->phyif_utmi_width == 16) ?
+			    USBTRDTIM_UTMI_16_BIT : USBTRDTIM_UTMI_8_BIT;
+		phyif = (dwc->phyif_utmi_width == 16) ? 1 : 0;
+		reg |= DWC3_GUSB2PHYCFG_PHYIF(phyif) |
+		       DWC3_GUSB2PHYCFG_USBTRDTIM(usbtrdtim);
+	}
+
 	dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
 
 	return 0;
@@ -900,6 +912,19 @@ static int dwc3_probe(struct platform_device *pdev)
 				"snps,is-utmi-l1-suspend");
 	device_property_read_u8(dev, "snps,hird-threshold",
 				&hird_threshold);
+
+	ret = device_property_read_u8(dev, "snps,phyif-utmi-width",
+				      &dwc->phyif_utmi_width);
+	if (ret < 0) {
+		dwc->phyif_utmi_width = 0;
+	} else if (dwc->phyif_utmi_width != 16 &&
+		dwc->phyif_utmi_width != 8) {
+		dev_err(dev, "unsupported utmi interface width %d\n",
+			dwc->phyif_utmi_width);
+		ret = -EINVAL;
+		goto err0;
+	}
+
 	dwc->usb3_lpm_capable = device_property_read_bool(dev,
 				"snps,usb3_lpm_capable");
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f321a5c..99a72c7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -203,6 +203,12 @@
 #define DWC3_GUSB2PHYCFG_SUSPHY		(1 << 6)
 #define DWC3_GUSB2PHYCFG_ULPI_UTMI	(1 << 4)
 #define DWC3_GUSB2PHYCFG_ENBLSLPM	(1 << 8)
+#define DWC3_GUSB2PHYCFG_PHYIF(n)	(n << 3)
+#define DWC3_GUSB2PHYCFG_PHYIF_MASK	DWC3_GUSB2PHYCFG_PHYIF(1)
+#define DWC3_GUSB2PHYCFG_USBTRDTIM(n)	(n << 10)
+#define DWC3_GUSB2PHYCFG_USBTRDTIM_MASK	DWC3_GUSB2PHYCFG_USBTRDTIM(0xf)
+#define USBTRDTIM_UTMI_8_BIT		9
+#define USBTRDTIM_UTMI_16_BIT		5
 
 /* Global USB2 PHY Vendor Control Register */
 #define DWC3_GUSB2PHYACC_NEWREGREQ	(1 << 25)
@@ -770,6 +776,9 @@ struct dwc3_scratchpad_array {
  * @test_mode_nr: test feature selector
  * @lpm_nyet_threshold: LPM NYET response threshold
  * @hird_threshold: HIRD threshold
+ * @phyif_utmi_width: UTMI+ PHY interface width value
+ *	8	- 8 bits
+ *	16	- 16 bits
  * @hsphy_interface: "utmi" or "ulpi"
  * @connected: true when we're connected to a host, false otherwise
  * @delayed_status: true when gadget driver asks for delayed status
@@ -917,6 +926,7 @@ struct dwc3 {
 	u8			test_mode_nr;
 	u8			lpm_nyet_threshold;
 	u8			hird_threshold;
+	u8			phyif_utmi_width;
 
 	const char		*hsphy_interface;
 
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
