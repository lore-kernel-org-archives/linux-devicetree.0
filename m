From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH v3 12/35] nfc: st21nfca: Remove hdev->init_data.gates initialization in load_session
Date: Mon, 26 Oct 2015 07:49:52 +0100
Message-ID: <1445842215-28403-13-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

hdev->init_data.gates is already initialized in st21nfca_hci_probe.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st21nfca/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index 42f1974..67d1c27 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -218,7 +218,6 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 		}
 	}
 
-	memcpy(hdev->init_data.gates, st21nfca_gates, sizeof(st21nfca_gates));
 free_list:
 	kfree_skb(skb_pipe_list);
 	return r;
-- 
2.1.4
