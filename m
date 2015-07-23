From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 08/23] usb: chipidea: set usb otg capabilities
Date: Thu, 23 Jul 2015 11:37:32 +0800
Message-ID: <1437622667-6735-9-git-send-email-jun.li@freescale.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437622667-6735-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Init and update otg capabilities by DT, set gadget's otg capabilities
accordingly.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Acked-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/chipidea/core.c  | 15 +++++++++++++++
 drivers/usb/chipidea/udc.c   |  7 ++++++-
 include/linux/usb/chipidea.h |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 40cdd5e..d1f462b 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -562,6 +562,8 @@ static irqreturn_t ci_irq(int irq, void *data)
 static int ci_get_platdata(struct device *dev,
 		struct ci_hdrc_platform_data *platdata)
 {
+	int ret;
+
 	if (!platdata->phy_mode)
 		platdata->phy_mode = of_usb_get_phy_mode(dev->of_node);
 
@@ -590,6 +592,19 @@ static int ci_get_platdata(struct device *dev,
 				of_usb_host_tpl_support(dev->of_node);
 	}
 
+	if (platdata->dr_mode == USB_DR_MODE_OTG) {
+		/* We can support HNP and SRP of OTG 2.0 */
+		platdata->ci_otg_caps.otg_rev = 0x0200;
+		platdata->ci_otg_caps.hnp_support = true;
+		platdata->ci_otg_caps.srp_support = true;
+
+		/* Update otg capabilities by DT properties */
+		ret = of_usb_update_otg_caps(dev->of_node,
+					&platdata->ci_otg_caps);
+		if (ret)
+			return ret;
+	}
+
 	if (of_usb_get_maximum_speed(dev->of_node) == USB_SPEED_FULL)
 		platdata->flags |= CI_HDRC_FORCE_FULLSPEED;
 
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 764f668..f5fbe78 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1827,6 +1827,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
 static int udc_start(struct ci_hdrc *ci)
 {
 	struct device *dev = ci->dev;
+	struct usb_otg_caps *otg_caps = &ci->platdata->ci_otg_caps;
 	int retval = 0;
 
 	spin_lock_init(&ci->lock);
@@ -1834,8 +1835,12 @@ static int udc_start(struct ci_hdrc *ci)
 	ci->gadget.ops          = &usb_gadget_ops;
 	ci->gadget.speed        = USB_SPEED_UNKNOWN;
 	ci->gadget.max_speed    = USB_SPEED_HIGH;
-	ci->gadget.is_otg       = ci->is_otg ? 1 : 0;
 	ci->gadget.name         = ci->platdata->name;
+	ci->gadget.otg_caps	= otg_caps;
+
+	if (ci->is_otg && (otg_caps->hnp_support || otg_caps->srp_support ||
+						otg_caps->adp_support))
+		ci->gadget.is_otg = 1;
 
 	INIT_LIST_HEAD(&ci->gadget.ep_list);
 
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index d1e1285..7d4d33c 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -35,6 +35,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
 	void	(*notify_event) (struct ci_hdrc *ci, unsigned event);
 	struct regulator	*reg_vbus;
+	struct usb_otg_caps	ci_otg_caps;
 	bool			tpl_support;
 };
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
