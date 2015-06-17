From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 08/23] usb: chipidea: set usb gadeget's otg capabilities
Date: Wed, 17 Jun 2015 13:43:40 +0800
Message-ID: <1434519835-27745-9-git-send-email-jun.li@freescale.com>
References: <1434519835-27745-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434519835-27745-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Set gadget's otg capabilities according to controller's capability and otg
properties in device tree.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/chipidea/core.c  | 3 +++
 drivers/usb/chipidea/udc.c   | 7 ++++++-
 include/linux/usb/chipidea.h | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 74fea4f..ccc57e1 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -588,6 +588,9 @@ static int ci_get_platdata(struct device *dev,
 				of_usb_host_tpl_support(dev->of_node);
 	}
 
+	if (platdata->dr_mode == USB_DR_MODE_OTG)
+		of_usb_get_otg_caps(dev->of_node, &platdata->ci_otg_caps);
+
 	if (of_usb_get_maximum_speed(dev->of_node) == USB_SPEED_FULL)
 		platdata->flags |= CI_HDRC_FORCE_FULLSPEED;
 
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 764f668..c75dc82 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1834,8 +1834,13 @@ static int udc_start(struct ci_hdrc *ci)
 	ci->gadget.ops          = &usb_gadget_ops;
 	ci->gadget.speed        = USB_SPEED_UNKNOWN;
 	ci->gadget.max_speed    = USB_SPEED_HIGH;
-	ci->gadget.is_otg       = ci->is_otg ? 1 : 0;
 	ci->gadget.name         = ci->platdata->name;
+	ci->gadget.otg_caps	= &ci->platdata->ci_otg_caps;
+
+	if (ci->gadget.otg_caps->hnp_support ||
+		ci->gadget.otg_caps->srp_support ||
+			ci->gadget.otg_caps->adp_support)
+		ci->gadget.is_otg = 1;
 
 	INIT_LIST_HEAD(&ci->gadget.ep_list);
 
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index ab94f78..e10cefc 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -34,6 +34,7 @@ struct ci_hdrc_platform_data {
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
