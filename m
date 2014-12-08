From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 16/34] NFC: st21nfca: Remove useless ST21NFCA_SE_HOST_EVT_HOT_PLUG macro
Date: Mon,  8 Dec 2014 22:08:21 +0100
Message-ID: <1418072919-10535-17-git-send-email-christophe-h.ricard@st.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418072919-10535-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

ST21NFCA_SE_HOST_EVT_HOT_PLUG is never used in the driver.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index d57e342..e92af42 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -80,7 +80,6 @@
 
 #define ST21NFCA_EVT_HOT_PLUG			0x03
 #define ST21NFCA_EVT_HOT_PLUG_IS_INHIBITED(x) (x->data[0] & 0x80)
-#define ST21NFCA_SE_HOST_EVT_HOT_PLUG	0x01
 
 #define ST21NFCA_SE_TO_PIPES			2000
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
