From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 15/30] nfc: st-nci: Add support for NCI_HCI_IDENTITY_MGMT_GATE
Date: Tue, 20 Oct 2015 23:48:06 +0200
Message-ID: <1445377701-8353-16-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

NCI_HCI_IDENTITY_MGMT_GATE might be useful to get information for example
about hardware or firmware version.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/st-nci_se.c | 3 +++
 include/net/nfc/nci_core.h     | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/nfc/st-nci/st-nci_se.c b/drivers/nfc/st-nci/st-nci_se.c
index f5409ab..7b94387 100644
--- a/drivers/nfc/st-nci/st-nci_se.c
+++ b/drivers/nfc/st-nci/st-nci_se.c
@@ -113,6 +113,9 @@ static struct nci_hci_gate st_nci_gates[] = {
 	{ST_NCI_DEVICE_MGNT_GATE, ST_NCI_DEVICE_MGNT_PIPE,
 					ST_NCI_HOST_CONTROLLER_ID},
 
+	{NCI_HCI_IDENTITY_MGMT_GATE, NCI_HCI_INVALID_PIPE,
+					ST_NCI_HOST_CONTROLLER_ID},
+
 	/* Secure element pipes are created by secure element host */
 	{ST_NCI_CONNECTIVITY_GATE, NCI_HCI_DO_NOT_OPEN_PIPE,
 					ST_NCI_HOST_CONTROLLER_ID},
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index b2f2e04..377f3de 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -125,6 +125,7 @@ struct nci_conn_info {
 
 /* Gates */
 #define NCI_HCI_ADMIN_GATE         0x00
+#define NCI_HCI_IDENTITY_MGMT_GATE 0x05
 #define NCI_HCI_LINK_MGMT_GATE     0x06
 
 /* Pipes */
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
