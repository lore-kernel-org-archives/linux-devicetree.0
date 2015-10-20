From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 08/30] nfc: st-nci: Remove ndev->hci_dev->init_data.gates initialization in load_session
Date: Tue, 20 Oct 2015 23:47:59 +0200
Message-ID: <1445377701-8353-9-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

ndev->hci_dev->init_data.gates is already initialized in st_nci_hci_network.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st-nci/st-nci_se.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/nfc/st-nci/st-nci_se.c b/drivers/nfc/st-nci/st-nci_se.c
index c742ef6..15fb0bb 100644
--- a/drivers/nfc/st-nci/st-nci_se.c
+++ b/drivers/nfc/st-nci/st-nci_se.c
@@ -245,9 +245,6 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 		kfree_skb(skb_pipe_info);
 	}
 
-	memcpy(ndev->hci_dev->init_data.gates, st_nci_gates,
-	       sizeof(st_nci_gates));
-
 	kfree_skb(skb_pipe_list);
 	return r;
 }
-- 
2.1.4
