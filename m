From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH v2 16/35] nfc: st21nfca: Keep st21nfca_gates unchanged in load_session
Date: Sun, 25 Oct 2015 22:54:31 +0100
Message-ID: <1445810090-18403-17-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
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
 drivers/nfc/st21nfca/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index 819a94a..b4451f8 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -190,14 +190,14 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
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
