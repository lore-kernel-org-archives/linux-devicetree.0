From: Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
Subject: [PATCH] usb: dwc3: add quirk to handle DWC_USB3_NUM == DWC_USB3_NUM_IN_EPS
Date: Thu, 19 Jan 2017 19:58:02 +0000
Message-ID: <1484855882-4936-1-git-send-email-pure.logic@nexus-software.ie>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
List-Id: devicetree@vger.kernel.org

- DWC_USB3_NUM indicates the number of Device mode single directional
  endpoints, including OUT and IN endpoint 0.

- DWC_USB3_NUM_IN_EPS indicates the maximum number of Device mode IN
  endpoints active at any time, including control endpoint 0.

It's possible to configure RTL such that DWC_USB3_NUM_EPS is equal to
DWC_USB3_NUM_IN_EPS.

dwc3-core calculates the number of OUT endpoints as DWC_USB3_NUM minus
DWC_USB3_NUM_IN_EPS. If RTL has been configured with DWC_USB3_NUM_IN_EPS
equal to DWC_USB3_NUM then dwc3-core will calculate the number of OUT
endpoints as zero.

For example a from dwc3_core_num_eps() shows:
[    1.565000]  /usb0@f01d0000: found 8 IN and 0 OUT endpoints

This patch fixes this case by adding a snps,num_in_eps quirk and an
over-ride value for DWC_USB3_NUM_IN_EPS snps,num_in_eps_override. When the
quirk is declared then snps,num_in_eps_override will be used instead of
DWC_USB3_NUM_IN_EPS as the value of the number active IN endpoints.

The minimum value specified for DWC_USB3_NUM_IN_EPS in the Designware
data-book is two, if snps,num_in_eps_quirk is declared but
snps,num_in_eps_override is omitted, then the minimum value will be used as
the default.

Signed-off-by: Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt |  3 +++
 drivers/usb/dwc3/core.c                        | 11 +++++++++++
 drivers/usb/dwc3/core.h                        |  6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index e3e6983..bb383bf 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -55,6 +55,9 @@ Optional properties:
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
+ - snps,num_in_eps_quirk: when set core will over-ride the num_in_eps value.
+ - snps,num_in_eps_override: the value that will be used for num_in_eps when
+			num_in_eps_quirk is true
 
 This is usually a subnode to DWC3 glue to which it is connected.
 
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 369bab1..d5e472a 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -398,6 +398,8 @@ static void dwc3_core_num_eps(struct dwc3 *dwc)
 	struct dwc3_hwparams	*parms = &dwc->hwparams;
 
 	dwc->num_in_eps = DWC3_NUM_IN_EPS(parms);
+	if (dwc->num_in_eps_quirk)
+		dwc->num_in_eps = dwc->num_in_eps_override;
 	dwc->num_out_eps = DWC3_NUM_EPS(parms) - dwc->num_in_eps;
 }
 
@@ -908,6 +910,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	struct device		*dev = dwc->dev;
 	u8			lpm_nyet_threshold;
 	u8			tx_de_emphasis;
+	u8			num_in_eps_override;
 	u8			hird_threshold;
 
 	/* default to highest possible threshold */
@@ -922,6 +925,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	 */
 	hird_threshold = 12;
 
+	/* default value of 2 is the minimum RTL parameter value */
+	num_in_eps_override = 2;
+
 	dwc->maximum_speed = usb_get_maximum_speed(dev);
 	dwc->dr_mode = usb_get_dr_mode(dev);
 	dwc->hsphy_mode = of_usb_get_phy_mode(dev->of_node);
@@ -981,9 +987,14 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				    &dwc->hsphy_interface);
 	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
 				 &dwc->fladj);
+	dwc->num_in_eps_quirk = device_property_read_bool(dev,
+				"snps,num_in_eps_quirk");
+	device_property_read_u8(dev, "snps,num_in_eps_override",
+				&num_in_eps_override);
 
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
+	dwc->num_in_eps_override = num_in_eps_override;
 
 	dwc->hird_threshold = hird_threshold
 		| (dwc->is_utmi_l1_suspend << 4);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 14b7602..3fe6dfc 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -853,6 +853,9 @@ struct dwc3_scratchpad_array {
  * 	3	- Reserved
  * @imod_interval: set the interrupt moderation interval in 250ns
  *                 increments or 0 to disable.
+ * @num_in_eps_quirk: set if silicon reports number of device-mode IN endpoints
+ *		      as equal to equal to the total number of endpoints.
+ * @num_in_eps_override: The value to set the number of IN endpoints to.
  */
 struct dwc3 {
 	struct usb_ctrlrequest	*ctrl_req;
@@ -1003,6 +1006,9 @@ struct dwc3 {
 	unsigned		tx_de_emphasis:2;
 
 	u16			imod_interval;
+
+	unsigned		num_in_eps_quirk:1;
+	unsigned		num_in_eps_override:6;
 };
 
 /* -------------------------------------------------------------------------- */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
