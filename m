From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 15/35] nfc: st-nci: Keep st_nci_gates unchanged in load_session
Date: Sun, 25 Oct 2015 22:54:30 +0100
Message-ID: <1445810090-18403-16-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

We need to keep initial st_nci_gates values in order for
nci_hci_dev_connect_gates to create and open pipe when necessary.

For example after a firmware update CLF pipes are cleared. Changing pipe
values in st_nci_gates was causing nci_hci_dev_connect_gates not using
accurate pipes value.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/se.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 3522165..df2dc54 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -232,13 +232,13 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 		if (j < ARRAY_SIZE(st_nci_gates) &&
 		    st_nci_gates[j].gate == dm_pipe_info->dst_gate_id &&
 		    ST_NCI_DM_IS_PIPE_OPEN(dm_pipe_info->pipe_state)) {
-			st_nci_gates[j].pipe = pipe_info[2];
+			ndev->hci_dev->init_data.gates[j].pipe = pipe_info[2];
 
 			ndev->hci_dev->gate2pipe[st_nci_gates[j].gate] =
-						st_nci_gates[j].pipe;
-			ndev->hci_dev->pipes[st_nci_gates[j].pipe].gate =
+						pipe_info[2];
+			ndev->hci_dev->pipes[pipe_info[2]].gate =
 						st_nci_gates[j].gate;
-			ndev->hci_dev->pipes[st_nci_gates[j].pipe].host =
+			ndev->hci_dev->pipes[pipe_info[2]].host =
 						dm_pipe_info->src_host_id;
 		}
 		kfree_skb(skb_pipe_info);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
