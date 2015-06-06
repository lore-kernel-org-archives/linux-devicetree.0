From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 10/17] nfc: st21nfcb: Fix st21nfcb_nci_close
Date: Sat,  6 Jun 2015 13:16:46 +0200
Message-ID: <1433589413-19680-11-git-send-email-christophe-h.ricard@st.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

When closing st21nfcb driver, flag ST21NFCB_NCI_RUNNING can be cleared
only once the ndlc and the transport (i2c or spi) layers are released.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/st21nfcb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfcb/st21nfcb.c b/drivers/nfc/st21nfcb/st21nfcb.c
index 7a51bf0..12699fa 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.c
+++ b/drivers/nfc/st21nfcb/st21nfcb.c
@@ -47,11 +47,13 @@ static int st21nfcb_nci_close(struct nci_dev *ndev)
 {
 	struct st21nfcb_nci_info *info = nci_get_drvdata(ndev);
 
-	if (!test_and_clear_bit(ST21NFCB_NCI_RUNNING, &info->flags))
+	if (!test_bit(ST21NFCB_NCI_RUNNING, &info->flags))
 		return 0;
 
 	ndlc_close(info->ndlc);
 
+	clear_bit(ST21NFCB_NCI_RUNNING, &info->flags);
+
 	return 0;
 }
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
