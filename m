From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v1 02/14] nfc: nci: Add handle to manage nci response from nci proprietary command
Date: Fri,  1 May 2015 22:19:25 +0200
Message-ID: <1430511577-19678-3-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to manage nci response from proprietary nci command, add a
specific handle.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci_core.h | 2 ++
 net/nfc/nci/rsp.c          | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index d4dcc71..419cda4 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -84,6 +84,8 @@ struct nci_ops {
 				    struct sk_buff *skb);
 	void  (*hci_cmd_received)(struct nci_dev *ndev, u8 pipe, u8 cmd,
 				  struct sk_buff *skb);
+	int   (*prop_rsp_packet)(struct nci_dev *ndev, __u16 rsp_opcode,
+				 struct sk_buff *skb);
 };
 
 #define NCI_MAX_SUPPORTED_RF_INTERFACES		4
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index 02486bc..00478b3 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -283,6 +283,7 @@ static void nci_core_conn_close_rsp_packet(struct nci_dev *ndev,
 void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u16 rsp_opcode = nci_opcode(skb->data);
+	int ret;
 
 	/* we got a rsp, stop the cmd timer */
 	del_timer(&ndev->cmd_timer);
@@ -342,7 +343,13 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		break;
 
 	default:
-		pr_err("unknown rsp opcode 0x%x\n", rsp_opcode);
+		if (ndev->ops->prop_rsp_packet)
+			ret = ndev->ops->prop_rsp_packet(ndev, rsp_opcode, skb);
+		else
+			ret = -EPROTO;
+
+		if (ret < 0)
+			pr_err("unknown rsp opcode 0x%x\n", rsp_opcode);
 		break;
 	}
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
