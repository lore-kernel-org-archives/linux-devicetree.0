From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 13/35] nfc: st-nci: Open NCI_HCI_LINK_MGMT_PIPE
Date: Sun, 25 Oct 2015 22:54:28 +0100
Message-ID: <1445810090-18403-14-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

NCI_HCI_LINK_MGMT_PIPE was never open in st_nci_hci_load_session.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/se.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 3ffac0e..3522165 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -244,6 +244,14 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 		kfree_skb(skb_pipe_info);
 	}
 
+	/*
+	 * 3 gates have a well known pipe ID. Only NCI_HCI_LINK_MGMT_GATE
+	 * is not yet open at this stage.
+	 */
+	r = nci_hci_connect_gate(ndev, ST_NCI_HOST_CONTROLLER_ID,
+				 NCI_HCI_LINK_MGMT_GATE,
+				 NCI_HCI_LINK_MGMT_PIPE);
+
 	kfree_skb(skb_pipe_list);
 	return r;
 }
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
