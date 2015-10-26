From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 2/9] NFC: NCI: export nci_send_frame and nci_send_cmd function
Date: Mon, 26 Oct 2015 10:27:38 +0100
Message-ID: <1445851665-2497-3-git-send-email-cuissard@marvell.com>
References: <1445851665-2497-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445851665-2497-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Export nci_send_frame and nci_send_cmd symbols to allow drivers
to use it. This is needed for example if NCI is used during
firmware download phase.

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 include/net/nfc/nci_core.h | 1 +
 net/nfc/nci/core.c         | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index d0d0f1e..f0bb5e7 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -282,6 +282,7 @@ int nci_core_reset(struct nci_dev *ndev);
 int nci_core_init(struct nci_dev *ndev);
 
 int nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb);
+int nci_send_frame(struct nci_dev *ndev, struct sk_buff *skb);
 int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, __u8 *val);
 
 int nci_nfcee_discover(struct nci_dev *ndev, u8 action);
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 0909720..f4204f3 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -1178,7 +1178,7 @@ int nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb)
 }
 EXPORT_SYMBOL(nci_recv_frame);
 
-static int nci_send_frame(struct nci_dev *ndev, struct sk_buff *skb)
+int nci_send_frame(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	pr_debug("len %d\n", skb->len);
 
@@ -1196,6 +1196,7 @@ static int nci_send_frame(struct nci_dev *ndev, struct sk_buff *skb)
 
 	return ndev->ops->send(ndev, skb);
 }
+EXPORT_SYMBOL(nci_send_frame);
 
 /* Send NCI command */
 int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, void *payload)
@@ -1227,6 +1228,7 @@ int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, void *payload)
 
 	return 0;
 }
+EXPORT_SYMBOL(nci_send_cmd);
 
 /* Proprietary commands API */
 static struct nci_prop_ops *prop_cmd_lookup(struct nci_dev *ndev,
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
