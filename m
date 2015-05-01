From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v1 03/14] nfc: nci: Add handle to manage nci notification from nci proprietary command
Date: Fri,  1 May 2015 22:19:26 +0200
Message-ID: <1430511577-19678-4-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to manage nci notification from proprietary nci command, add a
specific handle.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci_core.h | 2 ++
 net/nfc/nci/ntf.c          | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 419cda4..c0dc55c 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -86,6 +86,8 @@ struct nci_ops {
 				  struct sk_buff *skb);
 	int   (*prop_rsp_packet)(struct nci_dev *ndev, __u16 rsp_opcode,
 				 struct sk_buff *skb);
+	int   (*prop_ntf_packet)(struct nci_dev *ndev, __u16 ntf_opcode,
+				 struct sk_buff *skb);
 };
 
 #define NCI_MAX_SUPPORTED_RF_INTERFACES		4
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 3218071..a2ac40b 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -748,6 +748,7 @@ static void nci_nfcee_action_ntf_packet(struct nci_dev *ndev,
 void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u16 ntf_opcode = nci_opcode(skb->data);
+	int ret;
 
 	pr_debug("NCI RX: MT=ntf, PBF=%d, GID=0x%x, OID=0x%x, plen=%d\n",
 		 nci_pbf(skb->data),
@@ -792,7 +793,13 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		break;
 
 	default:
-		pr_err("unknown ntf opcode 0x%x\n", ntf_opcode);
+		if (ndev->ops->prop_ntf_packet)
+			ret = ndev->ops->prop_ntf_packet(ndev, ntf_opcode, skb);
+		else
+			ret = -EPROTO;
+
+		if (ret < 0)
+			pr_err("unknown ntf opcode 0x%x\n", ntf_opcode);
 		break;
 	}
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
