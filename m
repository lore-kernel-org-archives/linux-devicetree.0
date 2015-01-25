From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 13/13] NFC: st21nfcb: Fix copy/paste error in comment
Date: Sun, 25 Jan 2015 23:33:31 +0100
Message-ID: <1422225211-27510-14-git-send-email-christophe-h.ricard@st.com>
References: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422225211-27510-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

include/linux/platform_data/st21nfcb.h is based on
include/linux/platform_data/st21nfca.h.

The endif comment is inacurrate for st21nfcb.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/linux/platform_data/st21nfcb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/st21nfcb.h b/include/linux/platform_data/st21nfcb.h
index 05c54c9..b023373 100644
--- a/include/linux/platform_data/st21nfcb.h
+++ b/include/linux/platform_data/st21nfcb.h
@@ -26,4 +26,4 @@ struct st21nfcb_nfc_platform_data {
 	unsigned int irq_polarity;
 };
 
-#endif /* _ST21NFCA_HCI_H_ */
+#endif /* _ST21NFCB_NCI_H_ */
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
