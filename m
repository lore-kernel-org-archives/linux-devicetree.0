From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 13/30] nfc: st21nfca: Keep st21nfca_gates unchanged in load_session
Date: Tue, 20 Oct 2015 23:48:04 +0200
Message-ID: <1445377701-8353-14-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We need to keep initial st_nci_gates values in order for
nfc_hci_dev_connect_gates to create and open pipe when necessary.

For example after a firmware update CLF pipes are cleared. Changing pipe
values in st21nfca_gates was causing nfc_hci_dev_connect_gates not using
accurate pipes value.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st21nfca/st21nfca.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index 5ff9b33..fb0c0ac 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -192,14 +192,14 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 		if (j < ARRAY_SIZE(st21nfca_gates) &&
 			st21nfca_gates[j].gate == info->dst_gate_id &&
 			ST21NFCA_DM_IS_PIPE_OPEN(info->pipe_state)) {
-			st21nfca_gates[j].pipe = pipe_info[2];
+			hdev->init_data.gates[j].pipe = pipe_info[2];
 
 			hdev->gate2pipe[st21nfca_gates[j].gate] =
-							st21nfca_gates[j].pipe;
-			hdev->pipes[st21nfca_gates[j].pipe].gate =
-							st21nfca_gates[j].gate;
-			hdev->pipes[st21nfca_gates[j].pipe].dest_host =
-							info->src_host_id;
+						pipe_info[2];
+			hdev->pipes[pipe_info[2]].gate =
+						st21nfca_gates[j].gate;
+			hdev->pipes[pipe_info[2]].dest_host =
+						info->src_host_id;
 		}
 		kfree_skb(skb_pipe_info);
 	}
-- 
2.1.4
