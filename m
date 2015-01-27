From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/10] NFC: pn544: Change event_received gate parameter to pipe
Date: Tue, 27 Jan 2015 01:18:16 +0100
Message-ID: <1422317900-3810-7-git-send-email-christophe-h.ricard@st.com>
References: <1422317900-3810-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422317900-3810-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The below event_received hci handler has change the gate parameter to pipe.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/pn544/pn544.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/pn544/pn544.c b/drivers/nfc/pn544/pn544.c
index 9c8051d..12e819d 100644
--- a/drivers/nfc/pn544/pn544.c
+++ b/drivers/nfc/pn544/pn544.c
@@ -724,10 +724,11 @@ static int pn544_hci_check_presence(struct nfc_hci_dev *hdev,
  * <= 0: driver handled the event, skb consumed
  *    1: driver does not handle the event, please do standard processing
  */
-static int pn544_hci_event_received(struct nfc_hci_dev *hdev, u8 gate, u8 event,
+static int pn544_hci_event_received(struct nfc_hci_dev *hdev, u8 pipe, u8 event,
 				    struct sk_buff *skb)
 {
 	struct sk_buff *rgb_skb = NULL;
+	u8 gate = hdev->pipes[pipe].gate;
 	int r;
 
 	pr_debug("hci event %d\n", event);
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
