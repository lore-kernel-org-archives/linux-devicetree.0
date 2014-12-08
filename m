From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 05/34] NFC: hci: Change event_received handler gate parameter to pipe
Date: Mon,  8 Dec 2014 22:08:10 +0100
Message-ID: <1418072919-10535-6-git-send-email-christophe-h.ricard@st.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418072919-10535-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

We are usually receiving an event from a known pipe.

Keep this information as is as we can easily determine gate and host
triggering this event.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/hci.h | 2 +-
 net/nfc/hci/core.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/nfc/hci.h b/include/net/nfc/hci.h
index 14bd0e1..031c0be 100644
--- a/include/net/nfc/hci.h
+++ b/include/net/nfc/hci.h
@@ -51,7 +51,7 @@ struct nfc_hci_ops {
 	int (*tm_send)(struct nfc_hci_dev *hdev, struct sk_buff *skb);
 	int (*check_presence)(struct nfc_hci_dev *hdev,
 			      struct nfc_target *target);
-	int (*event_received)(struct nfc_hci_dev *hdev, u8 gate, u8 event,
+	int (*event_received)(struct nfc_hci_dev *hdev, u8 pipe, u8 event,
 			      struct sk_buff *skb);
 	int (*fw_download)(struct nfc_hci_dev *hdev, const char *firmware_name);
 	int (*discover_se)(struct nfc_hci_dev *dev);
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index ef50e77..12a9a4b 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -338,7 +338,7 @@ void nfc_hci_event_received(struct nfc_hci_dev *hdev, u8 pipe, u8 event,
 	}
 
 	if (hdev->ops->event_received) {
-		r = hdev->ops->event_received(hdev, gate, event, skb);
+		r = hdev->ops->event_received(hdev, pipe, event, skb);
 		if (r <= 0)
 			goto exit_noskb;
 	}
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
