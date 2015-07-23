From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 09/23] usb: chipidea: update ci_otg_is_fsm_mode conditions
Date: Thu, 23 Jul 2015 11:37:33 +0800
Message-ID: <1437622667-6735-10-git-send-email-jun.li@freescale.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437622667-6735-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

After introduce usb otg properties, update ci_otg_is_fsm_mode conditions
to be depending on both usb hardware properties and usb driver config,
also resolve a compile issue in debug.c after the API change.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Acked-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/chipidea/ci.h    | 5 ++++-
 drivers/usb/chipidea/debug.c | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index df57e49..63393e1 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -407,8 +407,11 @@ static inline u32 hw_test_and_write(struct ci_hdrc *ci, enum ci_hw_regs reg,
 static inline bool ci_otg_is_fsm_mode(struct ci_hdrc *ci)
 {
 #ifdef CONFIG_USB_OTG_FSM
+	struct usb_otg_caps *otg_caps = &ci->platdata->ci_otg_caps;
+
 	return ci->is_otg && ci->roles[CI_ROLE_HOST] &&
-					ci->roles[CI_ROLE_GADGET];
+		ci->roles[CI_ROLE_GADGET] && (otg_caps->srp_support ||
+		otg_caps->hnp_support || otg_caps->adp_support);
 #else
 	return false;
 #endif
diff --git a/drivers/usb/chipidea/debug.c b/drivers/usb/chipidea/debug.c
index 5b7061a..3869c6d 100644
--- a/drivers/usb/chipidea/debug.c
+++ b/drivers/usb/chipidea/debug.c
@@ -10,6 +10,7 @@
 #include <linux/usb/phy.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/otg-fsm.h>
+#include <linux/usb/chipidea.h>
 
 #include "ci.h"
 #include "udc.h"
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
