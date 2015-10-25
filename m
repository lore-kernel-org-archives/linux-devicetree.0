From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 17/35] nfc: st-nci: initialize gate_count in st_nci_hci_network_init
Date: Sun, 25 Oct 2015 22:54:32 +0100
Message-ID: <1445810090-18403-18-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When initializing ndev->hci_dev->init_data, only gates field was set.
gate_count needs to be initialized as well.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
