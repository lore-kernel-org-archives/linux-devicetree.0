From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 29/35] nfc: st-nci: Add few code style fixes
Date: Mon, 26 Oct 2015 07:50:09 +0100
Message-ID: <1445842215-28403-30-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add some few code style fixes.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/i2c.c | 2 +-
 drivers/nfc/st-nci/se.c  | 2 +-
 net/nfc/nci/hci.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 172cbc3..2a96f1a 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -32,7 +32,7 @@
 #define DRIVER_DESC "NCI NFC driver for ST_NCI"
 
 /* ndlc header */
-#define ST_NCI_FRAME_HEADROOM	1
+#define ST_NCI_FRAME_HEADROOM 1
 #define ST_NCI_FRAME_TAILROOM 0
 
 #define ST_NCI_I2C_MIN_SIZE 4   /* PCB(1) + NCI Packet header(3) */
diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 1cc24b6..dbab722 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -62,7 +62,7 @@ struct st_nci_pipe_info {
 
 #define ST_NCI_EVT_SE_HARD_RESET		0x20
 #define ST_NCI_EVT_TRANSMIT_DATA		0x10
-#define ST_NCI_EVT_WTX_REQUEST		0x11
+#define ST_NCI_EVT_WTX_REQUEST			0x11
 #define ST_NCI_EVT_SE_SOFT_RESET		0x11
 #define ST_NCI_EVT_SE_END_OF_APDU_TRANSFER	0x21
 #define ST_NCI_EVT_HOT_PLUG			0x03
diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index 1d6aa5d..984d451 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -405,7 +405,7 @@ static void nci_hci_hcp_message_rx(struct nci_dev *ndev, u8 pipe,
 		break;
 	}
 
-	nci_req_complete(ndev, 0);
+	nci_req_complete(ndev, NCI_STATUS_OK);
 }
 
 static void nci_hci_msg_rx_work(struct work_struct *work)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
