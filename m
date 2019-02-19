From: Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH v2 2/2] usb: dwc3: Add workaround for host mode VBUS glitch
 when boot
Date: Tue, 19 Feb 2019 07:23:17 +0000
Message-ID: <20190219072358.43493-2-ran.wang_1@nxp.com>
References: <20190219072358.43493-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219072358.43493-1-ran.wang_1@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

When DWC3 is set to host mode by programming register DWC3_GCTL, VBUS
(or its control signal) will be turned on immediately on related Root Hub
ports. Then, the VBUS is turned off for a little while(15us) when do xhci
reset (conducted by xhci driver) and back to normal finally, we can
observe a negative glitch of related signal happen.

This VBUS glitch might cause some USB devices enumeration fail if kernel
boot with them connected. Such as LS1012AFWRY/LS1043ARDB/LX2160AQDS
/LS1088ARDB with Kingston 16GB USB2.0/Kingston USB3.0/JetFlash Transcend
4GB USB2.0 drives. The fail cases include enumerated as full-speed device
or report wrong device descriptor, etc.

One SW workaround which can fix this is by programing all xhci PORTSC[PP]
to 0 to turn off VBUS immediately after setting host mode in DWC3 driver
(per signal measurement result, it will be too late to do it in
xhci-plat.c or xhci.c). Then, after xhci reset complete in xhci driver,
PORTSC[PP]s' value will back to 1 automatically and VBUS on at that time,
no glitch happen and normal enumeration process has no impact.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
Changes in v2:
  - Rename related property to 'snps,host-vbus-glitches'
  - Rename related dwc member to 'host_vbus_glitches'
  - Add member 'host_vbus_glitches' description in 'dwc3'

 drivers/usb/dwc3/core.c |   47 +++++++++++++++++++++++++++++++++++++++++++=
++++
 drivers/usb/dwc3/core.h |   12 +++++++++++-
 2 files changed, 58 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index a1b126f..02d11bc 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -100,6 +100,41 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 	return 0;
 }
=20
+/*
+ * dwc3_power_of_all_roothub_ports - Power off all Root hub ports
+ * @dwc3: Pointer to our controller context structure
+ */
+static void dwc3_power_off_all_roothub_ports(struct dwc3 *dwc)
+{
+	int i, port_num;
+	u32 reg, op_regs_base, offset;
+	void __iomem		*xhci_regs;
+
+	/* xhci regs is not mapped yet, do it temperary here */
+	if (dwc->xhci_resources[0].start) {
+		xhci_regs =3D ioremap(dwc->xhci_resources[0].start,
+				DWC3_XHCI_REGS_END);
+		if (IS_ERR(xhci_regs)) {
+			dev_err(dwc->dev, "Failed to ioremap xhci_regs\n");
+			return;
+		}
+
+		op_regs_base =3D HC_LENGTH(readl(xhci_regs));
+		reg =3D readl(xhci_regs + XHCI_HCSPARAMS1);
+		port_num =3D HCS_MAX_PORTS(reg);
+
+		for (i =3D 1; i <=3D port_num; i++) {
+			offset =3D op_regs_base + XHCI_PORTSC_BASE + 0x10*(i-1);
+			reg =3D readl(xhci_regs + offset);
+			reg &=3D ~PORT_POWER;
+			writel(reg, xhci_regs + offset);
+		}
+
+		iounmap(xhci_regs);
+	} else
+		dev_err(dwc->dev, "xhci base reg invalid\n");
+}
+
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
 {
 	u32 reg;
@@ -109,6 +144,15 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
 	reg |=3D DWC3_GCTL_PRTCAPDIR(mode);
 	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
=20
+	/*
+	 * We have to power off all Root hub ports immediately after DWC3 set
+	 * to host mode to avoid VBUS glitch happen when xhci get reset later.
+	 */
+	if (dwc->host_vbus_glitches) {
+		if (mode =3D=3D DWC3_GCTL_PRTCAP_HOST)
+			dwc3_power_off_all_roothub_ports(dwc);
+	}
+
 	dwc->current_dr_role =3D mode;
 }
=20
@@ -1306,6 +1350,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->dis_metastability_quirk =3D device_property_read_bool(dev,
 				"snps,dis_metastability_quirk");
=20
+	dwc->host_vbus_glitches =3D device_property_read_bool(dev,
+				"snps,host-vbus-glitches");
+
 	dwc->lpm_nyet_threshold =3D lpm_nyet_threshold;
 	dwc->tx_de_emphasis =3D tx_de_emphasis;
=20
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index df87641..9b3a7ed 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -606,6 +606,14 @@
 #define DWC3_OSTS_VBUSVLD		BIT(1)
 #define DWC3_OSTS_CONIDSTS		BIT(0)
=20
+/* Partial XHCI Register and Bit fields for quirk */
+#define XHCI_HCSPARAMS1		0x4
+#define XHCI_PORTSC_BASE	0x400
+#define PORT_POWER			(1 << 9)
+#define HCS_MAX_PORTS(p)	(((p) >> 24) & 0x7f)
+#define XHCI_HC_LENGTH(p)	(((p)>>00)&0x00ff)
+#define HC_LENGTH(p)		XHCI_HC_LENGTH(p)
+
 /* Structures */
=20
 struct dwc3_trb;
@@ -1024,6 +1032,8 @@ struct dwc3_scratchpad_array {
  * 	2	- No de-emphasis
  * 	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
+ * @host-vbus-glitches: set to avoid vbus glitch during
+ *                      xhci reset.
  * @imod_interval: set the interrupt moderation interval in 250ns
  *                 increments or 0 to disable.
  */
@@ -1209,6 +1219,7 @@ struct dwc3 {
 	unsigned		tx_de_emphasis:2;
=20
 	unsigned		dis_metastability_quirk:1;
+	unsigned		host_vbus_glitches:1;
=20
 	u16			imod_interval;
 };
@@ -1217,7 +1228,6 @@ struct dwc3 {
 #define INCRX_UNDEF_LENGTH_BURST_MODE 1
=20
 #define work_to_dwc(w)		(container_of((w), struct dwc3, drd_work))
-
 /* -----------------------------------------------------------------------=
--- */
=20
 struct dwc3_event_type {
--=20
1.7.1
