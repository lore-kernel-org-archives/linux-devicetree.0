From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Subject: [PATCH v2 3/3] usb: dwc3: gadget: Add support for disabling U1 and U2 entries
Date: Wed, 8 May 2019 13:24:51 +0530
Message-ID: <1557302091-7455-4-git-send-email-anurag.kumar.vulisha@xilinx.com>
References: <1557302091-7455-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557302091-7455-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "Claus H. Stovgaard" <cst@phaseone.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, v.anuragkumar@gmail.com, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
List-Id: devicetree@vger.kernel.org

Gadget applications may have a requirement to disable the U1 and U2
entry based on the usecase. Below are few usecases where the disabling
U1/U2 entries may be possible.

Usecase 1:
When combining dwc3 with an redriver for a USB Type-C device solution, it
sometimes have problems with leaving U1/U2 for certain hosts, resulting in
link training errors and reconnects. For this U1/U2 state entries may be
avoided.

Usecase 2:
When performing performance benchmarking on mass storage gadget the
U1 and U2 entries can be disabled.

Usecase 3:
When periodic transfers like ISOC transfers are used with bInterval
of 1 which doesn't require the link to enter into U1 or U2 state entry
(since ping is issued from host for every uframe interval). In this
case the U1 and U2 entry can be disabled.

Disablement of U1/U2 can be done by setting U1DevExitLat and U2DevExitLat
values to 0 in the BOS descriptor. Host on seeing 0 value for U1DevExitLat
and U2DevExitLat, it doesn't send SET_SEL requests to the gadget. There
may be some hosts which may send SET_SEL requests even after seeing 0 in
the UxDevExitLat of BOS descriptor. To aviod U1/U2 entries for these type
of hosts, dwc3 controller can be programmed to reject those U1/U2 requests
by not enabling ACCEPTUxENA bits in DCTL register.

This patch updates the same.

Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Signed-off-by: Claus H. Stovgaard <cst@phaseone.com>
---
 Changes in v2
	1. As suggested by Thinh Nguyen changed the "snps,dis_u1_entry_quirk"
	   to "snps,dis-u1-entry-quirk"
	2. Merged the changes done by Claus H. Stovgaard in ep0.c for rejecting
	   U1/U2 requests into this patch. Changes done by Claus can be found
	   here https://marc.info/?l=linux-kernel&m=155722068820568&w=2
	3. Changed the commit message.
---
 drivers/usb/dwc3/core.c   |  4 ++++
 drivers/usb/dwc3/core.h   |  4 ++++
 drivers/usb/dwc3/ep0.c    |  9 ++++++++-
 drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
 drivers/usb/dwc3/gadget.h |  6 ++++++
 5 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index a1b126f..180239b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1285,6 +1285,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,dis_u2_susphy_quirk");
 	dwc->dis_enblslpm_quirk = device_property_read_bool(dev,
 				"snps,dis_enblslpm_quirk");
+	dwc->dis_u1_entry_quirk = device_property_read_bool(dev,
+				"snps,dis-u1-entry-quirk");
+	dwc->dis_u2_entry_quirk = device_property_read_bool(dev,
+				"snps,dis-u2-entry-quirk");
 	dwc->dis_rxdet_inp3_quirk = device_property_read_bool(dev,
 				"snps,dis_rxdet_inp3_quirk");
 	dwc->dis_u2_freeclk_exists_quirk = device_property_read_bool(dev,
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1528d39..fa398e2 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1015,6 +1015,8 @@ struct dwc3_scratchpad_array {
  * @dis_u2_susphy_quirk: set if we disable usb2 suspend phy
  * @dis_enblslpm_quirk: set if we clear enblslpm in GUSB2PHYCFG,
  *                      disabling the suspend signal to the PHY.
+ * @dis_u1_entry_quirk: set if link entering into U1 state needs to be disabled.
+ * @dis_u2_entry_quirk: set if link entering into U2 state needs to be disabled.
  * @dis_rxdet_inp3_quirk: set if we disable Rx.Detect in P3
  * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists
  *			in GUSB2PHYCFG, specify that USB2 PHY doesn't
@@ -1206,6 +1208,8 @@ struct dwc3 {
 	unsigned		dis_u3_susphy_quirk:1;
 	unsigned		dis_u2_susphy_quirk:1;
 	unsigned		dis_enblslpm_quirk:1;
+	unsigned		dis_u1_entry_quirk:1;
+	unsigned		dis_u2_entry_quirk:1;
 	unsigned		dis_rxdet_inp3_quirk:1;
 	unsigned		dis_u2_freeclk_exists_quirk:1;
 	unsigned		dis_del_phy_power_chg_quirk:1;
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 8efde17..8e94efc 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -379,6 +379,8 @@ static int dwc3_ep0_handle_u1(struct dwc3 *dwc, enum usb_device_state state,
 	if ((dwc->speed != DWC3_DSTS_SUPERSPEED) &&
 			(dwc->speed != DWC3_DSTS_SUPERSPEED_PLUS))
 		return -EINVAL;
+	if (dwc->dis_u1_entry_quirk)
+		return -EINVAL;
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	if (set)
@@ -401,6 +403,8 @@ static int dwc3_ep0_handle_u2(struct dwc3 *dwc, enum usb_device_state state,
 	if ((dwc->speed != DWC3_DSTS_SUPERSPEED) &&
 			(dwc->speed != DWC3_DSTS_SUPERSPEED_PLUS))
 		return -EINVAL;
+	if (dwc->dis_u2_entry_quirk)
+		return -EINVAL;
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	if (set)
@@ -626,7 +630,10 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 			 * nothing is pending from application.
 			 */
 			reg = dwc3_readl(dwc->regs, DWC3_DCTL);
-			reg |= (DWC3_DCTL_ACCEPTU1ENA | DWC3_DCTL_ACCEPTU2ENA);
+			if (!dwc->dis_u1_entry_quirk)
+				reg |= DWC3_DCTL_ACCEPTU1ENA;
+			if (!dwc->dis_u2_entry_quirk)
+				reg |= DWC3_DCTL_ACCEPTU2ENA;
 			dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 		}
 		break;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e293400..f2d3112 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2073,6 +2073,24 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
 	return 0;
 }
 
+static void dwc3_gadget_config_params(struct usb_gadget *g,
+				      struct usb_dcd_config_params *params)
+{
+	struct dwc3		*dwc = gadget_to_dwc(g);
+
+	/* U1 Device exit Latency */
+	if (dwc->dis_u1_entry_quirk)
+		params->bU1devExitLat = 0;
+	else
+		params->bU1devExitLat = DWC3_DEFAULT_U1_DEV_EXIT_LAT;
+
+	/* U2 Device exit Latency */
+	if (dwc->dis_u2_entry_quirk)
+		params->bU2DevExitLat = 0;
+	else
+		params->bU2DevExitLat = DWC3_DEFAULT_U2_DEV_EXIT_LAT;
+}
+
 static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				  enum usb_device_speed speed)
 {
@@ -2142,6 +2160,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.udc_start		= dwc3_gadget_start,
 	.udc_stop		= dwc3_gadget_stop,
 	.udc_set_speed		= dwc3_gadget_set_speed,
+	.get_config_params	= dwc3_gadget_config_params,
 };
 
 /* -------------------------------------------------------------------------- */
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index 3ed738e..5faf4d1 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -48,6 +48,12 @@ struct dwc3;
 /* DEPXFERCFG parameter 0 */
 #define DWC3_DEPXFERCFG_NUM_XFER_RES(n)	((n) & 0xffff)
 
+/* U1 Device exit Latency */
+#define DWC3_DEFAULT_U1_DEV_EXIT_LAT	0x0A	/* Less then 10 microsec */
+
+/* U2 Device exit Latency */
+#define DWC3_DEFAULT_U2_DEV_EXIT_LAT	0x1FF	/* Less then 511 microsec */
+
 /* -------------------------------------------------------------------------- */
 
 #define to_dwc3_request(r)	(container_of(r, struct dwc3_request, request))
-- 
2.1.1
