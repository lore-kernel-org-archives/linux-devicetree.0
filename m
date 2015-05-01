From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v1 13/14] nfc: st21nfcb: Use hibernate nci command in ndlc_open and ndlc_close
Date: Fri,  1 May 2015 22:19:36 +0200
Message-ID: <1430511577-19678-14-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to prevent any NFC feature when NFC is disable and to save power,
put the CLF in hibernate mode with RF deactivated.
Add the equivalent to enable the NFC feature when opening st21nfcb driver

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/ndlc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st21nfcb/ndlc.c b/drivers/nfc/st21nfcb/ndlc.c
index 3ee22b4..aa1a5fc 100644
--- a/drivers/nfc/st21nfcb/ndlc.c
+++ b/drivers/nfc/st21nfcb/ndlc.c
@@ -60,15 +60,19 @@ int ndlc_open(struct llt_ndlc *ndlc)
 	/* toggle reset pin */
 	ndlc->ops->enable(ndlc->phy_id);
 	ndlc->powered = 1;
-	return 0;
+	return st21nfcb_nci_set_mode(ndlc->ndev, 1);
 }
 EXPORT_SYMBOL(ndlc_open);
 
 void ndlc_close(struct llt_ndlc *ndlc)
 {
 	/* toggle reset pin */
-	ndlc->ops->disable(ndlc->phy_id);
+	ndlc->ops->enable(ndlc->phy_id);
+
+	st21nfcb_nci_set_mode(ndlc->ndev, 0);
+
 	ndlc->powered = 0;
+	ndlc->ops->disable(ndlc->phy_id);
 }
 EXPORT_SYMBOL(ndlc_close);
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
