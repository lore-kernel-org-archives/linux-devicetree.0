From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 08/22] usb: chipidea: update ci_otg_is_fsm_mode conditions
Date: Tue, 16 Jun 2015 14:51:58 +0800
Message-ID: <1434437532-23678-9-git-send-email-jun.li@freescale.com>
References: <1434437532-23678-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434437532-23678-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

After introduce usb otg properties, update ci_otg_is_fsm_mode conditions
to be depending on both usb hardware properties and usb driver config,
also resolve a compile issue in debug.c after the API change.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/chipidea/ci.h    | 3 ++-
 drivers/usb/chipidea/debug.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 6d6200e..90e8e53 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -407,7 +407,8 @@ static inline bool ci_otg_is_fsm_mode(struct ci_hdrc *ci)
 {
 #ifdef CONFIG_USB_OTG_FSM
 	return ci->is_otg && ci->roles[CI_ROLE_HOST] &&
-					ci->roles[CI_ROLE_GADGET];
+		ci->roles[CI_ROLE_GADGET] && (ci->platdata->srp_support ||
+		ci->platdata->hnp_support || ci->platdata->adp_support);
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
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
