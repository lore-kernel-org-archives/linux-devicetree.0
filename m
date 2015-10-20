From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 12/30] nfc: st-nci: Keep st_nci_gates unchanged in load_session
Date: Tue, 20 Oct 2015 23:48:03 +0200
Message-ID: <1445377701-8353-13-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We need to keep initial st_nci_gates values in order for
nci_hci_dev_connect_gates to create and open pipe when necessary.

For example after a firmware update CLF pipes are cleared. Changing pipe
values in st_nci_gates was causing nci_hci_dev_connect_gates not using
accurate pipes value.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st-nci/st-nci_se.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/st-nci/st-nci_se.c b/drivers/nfc/st-nci/st-nci_se.c
index 3ea5384..2a475ce 100644
--- a/drivers/nfc/st-nci/st-nci_se.c
+++ b/drivers/nfc/st-nci/st-nci_se.c
@@ -233,13 +233,13 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
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
