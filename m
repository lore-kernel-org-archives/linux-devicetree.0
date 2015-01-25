From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/13] NFC: st21nfca: Remove skb_pipe_list and skb_pipe_info useless allocation
Date: Sun, 25 Jan 2015 23:33:26 +0100
Message-ID: <1422225211-27510-9-git-send-email-christophe-h.ricard@st.com>
References: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422225211-27510-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

skb_pipe_list and skb_pipe_info are allocated in nfc_hci_send_cmd.
alloc_skb on those buffer are then useless.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index 880193b..0667272 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -118,18 +118,6 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 		NFC_HCI_TERMINAL_HOST_ID, 0
 	};
 
-	skb_pipe_list = alloc_skb(ST21NFCA_HCI_LLC_MAX_SIZE, GFP_KERNEL);
-	if (!skb_pipe_list) {
-		r = -ENOMEM;
-		goto free_list;
-	}
-
-	skb_pipe_info = alloc_skb(ST21NFCA_HCI_LLC_MAX_SIZE, GFP_KERNEL);
-	if (!skb_pipe_info) {
-		r = -ENOMEM;
-		goto free_info;
-	}
-
 	/* On ST21NFCA device pipes number are dynamics
 	 * A maximum of 16 pipes can be created at the same time
 	 * If pipes are already created, hci_dev_up will fail.
@@ -212,7 +200,6 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 	memcpy(hdev->init_data.gates, st21nfca_gates, sizeof(st21nfca_gates));
 free_info:
 	kfree_skb(skb_pipe_info);
-free_list:
 	kfree_skb(skb_pipe_list);
 	return r;
 }
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
