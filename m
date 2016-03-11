From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5 v10] usb: musb: core: added helper function for parsing DT
Date: Fri, 11 Mar 2016 09:29:46 +0100
Message-ID: <1457684989-13318-2-git-send-email-petr@barix.com>
References: <1457684989-13318-1-git-send-email-petr@barix.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457684989-13318-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds the function musb_get_mode() to get the DT property "dr_mode"

Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Acked-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
---
v4: <initial>
 - created musb_get_dr_mode()

v5:
 - musb_get_dr_mode() renamed to musb_get_mode()
 - added musb_get_power()

v6:
 - musb_get_power() : added missing boundary check for the maximum value 510mA
 - formatting
 - added empty implementation of musb_get_power()

v7:
 - removed empty implementation of musb_get_power()
 - musb_get_mode() returns MUSB_OTG if the property is not found

v8:
 - musb_get_power() removed

v9: <no change>
v10: <no change>

 drivers/usb/musb/musb_core.c | 19 +++++++++++++++++++
 drivers/usb/musb/musb_core.h |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index c3791a0..6a2d6d3 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -100,6 +100,7 @@
 #include <linux/io.h>
 #include <linux/dma-mapping.h>
 #include <linux/usb.h>
+#include <linux/usb/of.h>
 
 #include "musb_core.h"
 
@@ -129,6 +130,24 @@ static inline struct musb *dev_to_musb(struct device *dev)
 	return dev_get_drvdata(dev);
 }
 
+enum musb_mode musb_get_mode(struct device *dev)
+{
+	enum usb_dr_mode mode;
+
+	mode = usb_get_dr_mode(dev);
+	switch (mode) {
+	case USB_DR_MODE_HOST:
+		return MUSB_HOST;
+	case USB_DR_MODE_PERIPHERAL:
+		return MUSB_PERIPHERAL;
+	case USB_DR_MODE_OTG:
+	case USB_DR_MODE_UNKNOWN:
+	default:
+		return MUSB_OTG;
+	}
+}
+EXPORT_SYMBOL_GPL(musb_get_mode);
+
 /*-------------------------------------------------------------------------*/
 
 #ifndef CONFIG_BLACKFIN
diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index fd215fb..3f7a325 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -614,4 +614,9 @@ static inline void musb_platform_post_root_reset_end(struct musb *musb)
 		musb->ops->post_root_reset_end(musb);
 }
 
+/* gets the "dr_mode" property from DT and converts it into musb_mode
+ * if the property is not found or not recognized returns MUSB_OTG
+ */
+extern enum musb_mode musb_get_mode(struct device *dev);
+
 #endif	/* __MUSB_CORE_H__ */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
