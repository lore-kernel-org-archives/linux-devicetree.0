From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 09/35] nfc: nci: Add a call to nci_hci_clear_all_pipes at HCI initial activation.
Date: Mon, 26 Oct 2015 07:49:49 +0100
Message-ID: <1445842215-28403-10-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When session_id is filled to ff, the pipe configuration is probably
incorrect.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/hci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index 43d7931..a937bc6 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -701,6 +701,10 @@ int nci_hci_dev_session_init(struct nci_dev *ndev)
 		/* Restore gate<->pipe table from some proprietary location. */
 		r = ndev->ops->hci_load_session(ndev);
 	} else {
+		r = nci_hci_clear_all_pipes(ndev);
+		if (r < 0)
+			goto exit;
+
 		r = nci_hci_dev_connect_gates(ndev,
 					      ndev->hci_dev->init_data.gate_count,
 					      ndev->hci_dev->init_data.gates);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
