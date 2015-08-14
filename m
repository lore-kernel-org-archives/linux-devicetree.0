From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/11] NFC: st-nci: fix use of uninitialized variables in error path
Date: Fri, 14 Aug 2015 22:33:34 +0200
Message-ID: <1439584420-5446-6-git-send-email-christophe-h.ricard@st.com>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439584420-5446-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

st_nci_hci_load_session() calls kfree_skb() on unitialized variables
skb_pipe_info and skb_pipe_list if the call to nci_hci_connect_gate()
failed.  Reword the error path to not use these variables when they are
not initialized.  While at it, there seemed to be a memory leak because
skb_pipe_info was only freed once, after the for-loop, even though
several ones were created by nci_hci_send_cmd.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Acked-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
---
 drivers/nfc/st-nci/st-nci_se.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/st-nci/st-nci_se.c b/drivers/nfc/st-nci/st-nci_se.c
index 97addfa..c742ef6 100644
--- a/drivers/nfc/st-nci/st-nci_se.c
+++ b/drivers/nfc/st-nci/st-nci_se.c
@@ -189,14 +189,14 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 				ST_NCI_DEVICE_MGNT_GATE,
 				ST_NCI_DEVICE_MGNT_PIPE);
 	if (r < 0)
-		goto free_info;
+		return r;
 
 	/* Get pipe list */
 	r = nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
 			ST_NCI_DM_GETINFO, pipe_list, sizeof(pipe_list),
 			&skb_pipe_list);
 	if (r < 0)
-		goto free_info;
+		return r;
 
 	/* Complete the existing gate_pipe table */
 	for (i = 0; i < skb_pipe_list->len; i++) {
@@ -222,6 +222,7 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 		    dm_pipe_info->src_host_id != ST_NCI_ESE_HOST_ID) {
 			pr_err("Unexpected apdu_reader pipe on host %x\n",
 			       dm_pipe_info->src_host_id);
+			kfree_skb(skb_pipe_info);
 			continue;
 		}
 
@@ -241,13 +242,12 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 			ndev->hci_dev->pipes[st_nci_gates[j].pipe].host =
 						dm_pipe_info->src_host_id;
 		}
+		kfree_skb(skb_pipe_info);
 	}
 
 	memcpy(ndev->hci_dev->init_data.gates, st_nci_gates,
 	       sizeof(st_nci_gates));
 
-free_info:
-	kfree_skb(skb_pipe_info);
 	kfree_skb(skb_pipe_list);
 	return r;
 }
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
