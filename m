From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH v3 17/35] nfc: st-nci: initialize gate_count in st_nci_hci_network_init
Date: Mon, 26 Oct 2015 07:49:57 +0100
Message-ID: <1445842215-28403-18-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When initializing ndev->hci_dev->init_data, only gates field was set.
gate_count needs to be initialized as well.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st-nci/se.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index df2dc54..11e49a5 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -536,6 +536,7 @@ static int st_nci_hci_network_init(struct nci_dev *ndev)
 	if (!conn_info)
 		goto free_dest_params;
 
+	ndev->hci_dev->init_data.gate_count = ARRAY_SIZE(st_nci_gates);
 	memcpy(ndev->hci_dev->init_data.gates, st_nci_gates,
 	       sizeof(st_nci_gates));
 
-- 
2.1.4
