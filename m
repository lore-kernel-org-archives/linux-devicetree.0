From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 04/11] NFC: st21nfca: fix use of uninitialized variables in error path
Date: Fri, 14 Aug 2015 22:33:33 +0200
Message-ID: <1439584420-5446-5-git-send-email-christophe-h.ricard@st.com>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org, Nicolas Iooss <nicolas.iooss_linux@m4x.org>
List-Id: devicetree@vger.kernel.org

st21nfca_hci_load_session() calls kfree_skb() on unitialized variables
skb_pipe_info and skb_pipe_list if the call to nfc_hci_connect_gate()
failed.  Reword the error path to not use these variables when they are
not initialized.  While at it, there seemed to be a memory leak because
skb_pipe_info was only freed once, after the for-loop, even though
several ones were created by nfc_hci_send_cmd.

Fixes: ec03ff1a8f9a ("NFC: st21nfca: Remove skb_pipe_list and skb_pipe_info
useless allocation")

Cc: stable@vger.kernel.org
Acked-by: Christophe Ricard <christophe-h.ricard@st.com>
Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
---
 drivers/nfc/st21nfca/st21nfca.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index d251f72..0512865 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -148,14 +148,14 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 				ST21NFCA_DEVICE_MGNT_GATE,
 				ST21NFCA_DEVICE_MGNT_PIPE);
 	if (r < 0)
-		goto free_info;
+		return r;
 
 	/* Get pipe list */
 	r = nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
 			ST21NFCA_DM_GETINFO, pipe_list, sizeof(pipe_list),
 			&skb_pipe_list);
 	if (r < 0)
-		goto free_info;
+		return r;
 
 	/* Complete the existing gate_pipe table */
 	for (i = 0; i < skb_pipe_list->len; i++) {
@@ -181,6 +181,7 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 			info->src_host_id != ST21NFCA_ESE_HOST_ID) {
 			pr_err("Unexpected apdu_reader pipe on host %x\n",
 				info->src_host_id);
+			kfree_skb(skb_pipe_info);
 			continue;
 		}
 
@@ -200,6 +201,7 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 			hdev->pipes[st21nfca_gates[j].pipe].dest_host =
 							info->src_host_id;
 		}
+		kfree_skb(skb_pipe_info);
 	}
 
 	/*
@@ -214,13 +216,12 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 					st21nfca_gates[i].gate,
 					st21nfca_gates[i].pipe);
 			if (r < 0)
-				goto free_info;
+				goto free_list;
 		}
 	}
 
 	memcpy(hdev->init_data.gates, st21nfca_gates, sizeof(st21nfca_gates));
-free_info:
-	kfree_skb(skb_pipe_info);
+free_list:
 	kfree_skb(skb_pipe_list);
 	return r;
 }
-- 
2.1.4
