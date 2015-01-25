From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 12/13] NFC: st21nfcb: Remove useless include
Date: Sun, 25 Jan 2015 23:33:30 +0100
Message-ID: <1422225211-27510-13-git-send-email-christophe-h.ricard@st.com>
References: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422225211-27510-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

include/linux/platform_data/st21nfcb.h is phy generic.
There is no need to include linux/i2c.h

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/linux/platform_data/st21nfcb.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/platform_data/st21nfcb.h b/include/linux/platform_data/st21nfcb.h
index c3b432f..05c54c9 100644
--- a/include/linux/platform_data/st21nfcb.h
+++ b/include/linux/platform_data/st21nfcb.h
@@ -19,8 +19,6 @@
 #ifndef _ST21NFCB_NCI_H_
 #define _ST21NFCB_NCI_H_
 
-#include <linux/i2c.h>
-
 #define ST21NFCB_NCI_DRIVER_NAME "st21nfcb_nci"
 
 struct st21nfcb_nfc_platform_data {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
