From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 06/17] nfc: st21nfcb: Remove inappropriate kfree on a devm_kzalloc pointer
Date: Sat,  6 Jun 2015 13:16:42 +0200
Message-ID: <1433589413-19680-7-git-send-email-christophe-h.ricard@st.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Firo Yang <firogm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since ndev->driver_data is allocated by devm_kzalloc(), we do not
need the inappropriate kfree to free it in driver's remove function.
Freeing will trigger when driver unloads.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Acked-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Firo Yang <firogm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/nfc/st21nfcb/st21nfcb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/nfc/st21nfcb/st21nfcb.c b/drivers/nfc/st21nfcb/st21nfcb.c
index ca9871a..c7dc282 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.c
+++ b/drivers/nfc/st21nfcb/st21nfcb.c
@@ -131,11 +131,8 @@ EXPORT_SYMBOL_GPL(st21nfcb_nci_probe);
 
 void st21nfcb_nci_remove(struct nci_dev *ndev)
 {
-	struct st21nfcb_nci_info *info = nci_get_drvdata(ndev);
-
 	nci_unregister_device(ndev);
 	nci_free_device(ndev);
-	kfree(info);
 }
 EXPORT_SYMBOL_GPL(st21nfcb_nci_remove);
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
