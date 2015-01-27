From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/10] NFC: hci: Add pipes table to reference them with a tuple {gate, host}
Date: Tue, 27 Jan 2015 01:18:12 +0100
Message-ID: <1422317900-3810-3-git-send-email-christophe-h.ricard@st.com>
References: <1422317900-3810-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422317900-3810-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to keep host source information on specific hci event (such as
evt_connectivity or evt_transaction) and because 2 pipes can be connected
to the same gate, it is necessary to add a table referencing every pipe
with a {gate, host} tuple.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/hci.h | 13 ++++++++++++-
 net/nfc/hci/command.c |  6 ++++--
 net/nfc/hci/core.c    | 36 +++++++++++++++++++++++++++++++-----
 3 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/include/net/nfc/hci.h b/include/net/nfc/hci.h
index 031c0be..5570f4a 100644
--- a/include/net/nfc/hci.h
+++ b/include/net/nfc/hci.h
@@ -63,8 +63,10 @@ struct nfc_hci_ops {
 };
 
 /* Pipes */
-#define NFC_HCI_INVALID_PIPE	0x80
 #define NFC_HCI_DO_NOT_CREATE_PIPE	0x81
+#define NFC_HCI_INVALID_PIPE	0x80
+#define NFC_HCI_INVALID_GATE	0xFF
+#define NFC_HCI_INVALID_HOST	0x80
 #define NFC_HCI_LINK_MGMT_PIPE	0x00
 #define NFC_HCI_ADMIN_PIPE	0x01
 
@@ -73,7 +75,13 @@ struct nfc_hci_gate {
 	u8 pipe;
 };
 
+struct nfc_hci_pipe {
+	u8 gate;
+	u8 dest_host;
+};
+
 #define NFC_HCI_MAX_CUSTOM_GATES	50
+#define NFC_HCI_MAX_PIPES		127
 struct nfc_hci_init_data {
 	u8 gate_count;
 	struct nfc_hci_gate gates[NFC_HCI_MAX_CUSTOM_GATES];
@@ -125,6 +133,7 @@ struct nfc_hci_dev {
 	void *clientdata;
 
 	u8 gate2pipe[NFC_HCI_MAX_GATES];
+	struct nfc_hci_pipe pipes[NFC_HCI_MAX_PIPES];
 
 	u8 sw_romlib;
 	u8 sw_patch;
@@ -167,6 +176,8 @@ void *nfc_hci_get_clientdata(struct nfc_hci_dev *hdev);
 void nfc_hci_driver_failure(struct nfc_hci_dev *hdev, int err);
 
 int nfc_hci_result_to_errno(u8 result);
+void nfc_hci_reset_pipes(struct nfc_hci_dev *dev);
+void nfc_hci_reset_pipes_per_host(struct nfc_hci_dev *hdev, u8 host);
 
 /* Host IDs */
 #define NFC_HCI_HOST_CONTROLLER_ID	0x00
diff --git a/net/nfc/hci/command.c b/net/nfc/hci/command.c
index 91df487..9acf586 100644
--- a/net/nfc/hci/command.c
+++ b/net/nfc/hci/command.c
@@ -331,7 +331,7 @@ int nfc_hci_disconnect_all_gates(struct nfc_hci_dev *hdev)
 	if (r < 0)
 		return r;
 
-	memset(hdev->gate2pipe, NFC_HCI_INVALID_PIPE, sizeof(hdev->gate2pipe));
+	nfc_hci_reset_pipes(hdev);
 
 	return 0;
 }
@@ -345,7 +345,7 @@ int nfc_hci_connect_gate(struct nfc_hci_dev *hdev, u8 dest_host, u8 dest_gate,
 
 	pr_debug("\n");
 
-	if (hdev->gate2pipe[dest_gate] == NFC_HCI_DO_NOT_CREATE_PIPE)
+	if (pipe == NFC_HCI_DO_NOT_CREATE_PIPE)
 		return 0;
 
 	if (hdev->gate2pipe[dest_gate] != NFC_HCI_INVALID_PIPE)
@@ -380,6 +380,8 @@ open_pipe:
 		return r;
 	}
 
+	hdev->pipes[pipe].gate = dest_gate;
+	hdev->pipes[pipe].dest_host = dest_host;
 	hdev->gate2pipe[dest_gate] = pipe;
 
 	return 0;
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index 12a9a4b..8f8abfe 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -46,6 +46,32 @@ int nfc_hci_result_to_errno(u8 result)
 }
 EXPORT_SYMBOL(nfc_hci_result_to_errno);
 
+void nfc_hci_reset_pipes(struct nfc_hci_dev *hdev)
+{
+	int i = 0;
+
+	for (i = 0; i < NFC_HCI_MAX_PIPES; i++) {
+		hdev->pipes[i].gate = NFC_HCI_INVALID_GATE;
+		hdev->pipes[i].dest_host = NFC_HCI_INVALID_HOST;
+	}
+	memset(hdev->gate2pipe, NFC_HCI_INVALID_PIPE, sizeof(hdev->gate2pipe));
+}
+EXPORT_SYMBOL(nfc_hci_reset_pipes);
+
+void nfc_hci_reset_pipes_per_host(struct nfc_hci_dev *hdev, u8 host)
+{
+	int i = 0;
+
+	for (i = 0; i < NFC_HCI_MAX_PIPES; i++) {
+		if (hdev->pipes[i].dest_host != host)
+			continue;
+
+		hdev->pipes[i].gate = NFC_HCI_INVALID_GATE;
+		hdev->pipes[i].dest_host = NFC_HCI_INVALID_HOST;
+	}
+}
+EXPORT_SYMBOL(nfc_hci_reset_pipes_per_host);
+
 static void nfc_hci_msg_tx_work(struct work_struct *work)
 {
 	struct nfc_hci_dev *hdev = container_of(work, struct nfc_hci_dev,
@@ -168,7 +194,7 @@ void nfc_hci_cmd_received(struct nfc_hci_dev *hdev, u8 pipe, u8 cmd,
 			  struct sk_buff *skb)
 {
 	int r = 0;
-	u8 gate = nfc_hci_pipe2gate(hdev, pipe);
+	u8 gate = hdev->pipes[pipe].gate;
 	u8 local_gate, new_pipe;
 	u8 gate_opened = 0x00;
 
@@ -330,9 +356,9 @@ void nfc_hci_event_received(struct nfc_hci_dev *hdev, u8 pipe, u8 event,
 			    struct sk_buff *skb)
 {
 	int r = 0;
-	u8 gate = nfc_hci_pipe2gate(hdev, pipe);
+	u8 gate = hdev->pipes[pipe].gate;
 
-	if (gate == 0xff) {
+	if (gate == NFC_HCI_INVALID_GATE) {
 		pr_err("Discarded event %x to unopened pipe %x\n", event, pipe);
 		goto exit;
 	}
@@ -573,7 +599,7 @@ static int hci_dev_down(struct nfc_dev *nfc_dev)
 	if (hdev->ops->close)
 		hdev->ops->close(hdev);
 
-	memset(hdev->gate2pipe, NFC_HCI_INVALID_PIPE, sizeof(hdev->gate2pipe));
+	nfc_hci_reset_pipes(hdev);
 
 	return 0;
 }
@@ -932,7 +958,7 @@ struct nfc_hci_dev *nfc_hci_allocate_device(struct nfc_hci_ops *ops,
 
 	nfc_set_drvdata(hdev->ndev, hdev);
 
-	memset(hdev->gate2pipe, NFC_HCI_INVALID_PIPE, sizeof(hdev->gate2pipe));
+	nfc_hci_reset_pipes(hdev);
 
 	hdev->quirks = quirks;
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
