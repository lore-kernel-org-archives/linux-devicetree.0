From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 16/30] nfc: st-nci: Change st_nci_gates offset when looking for a pipe in the table
Date: Tue, 20 Oct 2015 23:48:07 +0200
Message-ID: <1445377701-8353-17-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

It is useless to start from index 0 when looking for a gate because only
dynamic pipes are retrieved with ST_NCI_DM_GETINFO(ST_NCI_DM_GETINFO_PIPE_LIST).

The first dynamic pipe is present at index 3.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st-nci/st-nci_se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st-nci/st-nci_se.c b/drivers/nfc/st-nci/st-nci_se.c
index 7b94387..a8ae04e 100644
--- a/drivers/nfc/st-nci/st-nci_se.c
+++ b/drivers/nfc/st-nci/st-nci_se.c
@@ -229,7 +229,7 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 			continue;
 		}
 
-		for (j = 0; (j < ARRAY_SIZE(st_nci_gates)) &&
+		for (j = 3; (j < ARRAY_SIZE(st_nci_gates)) &&
 		     (st_nci_gates[j].gate != dm_pipe_info->dst_gate_id); j++)
 			;
 
-- 
2.1.4
