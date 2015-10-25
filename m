From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH v2 06/35] nfc: nci: Fix improper management of HCI return code
Date: Sun, 25 Oct 2015 22:54:21 +0100
Message-ID: <1445810090-18403-7-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When sending HCI data over NCI, HCI return code is part of the NCI data.
In order to get correctly the HCI return code, we assume the NCI
communication is successful and extract the return code for the nci_hci
functions return code.

This is done because nci_to_errno does not match hci return code value.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 net/nfc/nci/hci.c | 60 ++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index bc6b9d5..73afb47 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -101,6 +101,20 @@ struct nci_hcp_packet {
 #define NCI_HCP_MSG_GET_CMD(header)  (header & 0x3f)
 #define NCI_HCP_MSG_GET_PIPE(header) (header & 0x7f)
 
+static int nci_hci_result_to_errno(u8 result)
+{
+	switch (result) {
+	case NCI_HCI_ANY_OK:
+		return 0;
+	case NCI_HCI_ANY_E_REG_PAR_UNKNOWN:
+		return -EOPNOTSUPP;
+	case NCI_HCI_ANY_E_TIMEOUT:
+		return -ETIME;
+	default:
+		return -1;
+	}
+}
+
 /* HCI core */
 static void nci_hci_reset_pipes(struct nci_hci_dev *hdev)
 {
@@ -217,7 +231,8 @@ int nci_hci_send_cmd(struct nci_dev *ndev, u8 gate, u8 cmd,
 		     const u8 *param, size_t param_len,
 		     struct sk_buff **skb)
 {
-	struct nci_conn_info    *conn_info;
+	struct nci_hcp_message *message;
+	struct nci_conn_info   *conn_info;
 	struct nci_data data;
 	int r;
 	u8 pipe = ndev->hci_dev->gate2pipe[gate];
@@ -237,9 +252,14 @@ int nci_hci_send_cmd(struct nci_dev *ndev, u8 gate, u8 cmd,
 
 	r = nci_request(ndev, nci_hci_send_data_req, (unsigned long)&data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
+	if (r == NCI_STATUS_OK) {
+		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
+		r = nci_hci_result_to_errno(NCI_HCP_MSG_GET_CMD(message->header));
+		skb_pull(conn_info->rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
 
-	if (r == NCI_STATUS_OK && skb)
-		*skb = conn_info->rx_skb;
+		if (!r && skb)
+			*skb = conn_info->rx_skb;
+	}
 
 	return r;
 }
@@ -333,9 +353,6 @@ static void nci_hci_resp_received(struct nci_dev *ndev, u8 pipe,
 	struct nci_conn_info    *conn_info;
 	u8 status = result;
 
-	if (result != NCI_HCI_ANY_OK)
-		goto exit;
-
 	conn_info = ndev->hci_dev->conn_info;
 	if (!conn_info) {
 		status = NCI_STATUS_REJECTED;
@@ -345,7 +362,7 @@ static void nci_hci_resp_received(struct nci_dev *ndev, u8 pipe,
 	conn_info->rx_skb = skb;
 
 exit:
-	nci_req_complete(ndev, status);
+	nci_req_complete(ndev, NCI_STATUS_OK);
 }
 
 /* Receive hcp message for pipe, with type and cmd.
@@ -400,7 +417,7 @@ void nci_hci_data_received_cb(void *context,
 {
 	struct nci_dev *ndev = (struct nci_dev *)context;
 	struct nci_hcp_packet *packet;
-	u8 pipe, type, instruction;
+	u8 pipe, type;
 	struct sk_buff *hcp_skb;
 	struct sk_buff *frag_skb;
 	int msg_len;
@@ -439,7 +456,7 @@ void nci_hci_data_received_cb(void *context,
 		*skb_put(hcp_skb, NCI_HCI_HCP_PACKET_HEADER_LEN) = pipe;
 
 		skb_queue_walk(&ndev->hci_dev->rx_hcp_frags, frag_skb) {
-		       msg_len = frag_skb->len - NCI_HCI_HCP_PACKET_HEADER_LEN;
+			msg_len = frag_skb->len - NCI_HCI_HCP_PACKET_HEADER_LEN;
 			memcpy(skb_put(hcp_skb, msg_len), frag_skb->data +
 			       NCI_HCI_HCP_PACKET_HEADER_LEN, msg_len);
 		}
@@ -457,11 +474,9 @@ void nci_hci_data_received_cb(void *context,
 	packet = (struct nci_hcp_packet *)hcp_skb->data;
 	type = NCI_HCP_MSG_GET_TYPE(packet->message.header);
 	if (type == NCI_HCI_HCP_RESPONSE) {
-		pipe = packet->header;
-		instruction = NCI_HCP_MSG_GET_CMD(packet->message.header);
-		skb_pull(hcp_skb, NCI_HCI_HCP_PACKET_HEADER_LEN +
-			 NCI_HCI_HCP_MESSAGE_HEADER_LEN);
-		nci_hci_hcp_message_rx(ndev, pipe, type, instruction, hcp_skb);
+		pipe = NCI_HCP_MSG_GET_PIPE(packet->header);
+		skb_pull(hcp_skb, NCI_HCI_HCP_PACKET_HEADER_LEN);
+		nci_hci_hcp_message_rx(ndev, pipe, type, NCI_STATUS_OK, hcp_skb);
 	} else {
 		skb_queue_tail(&ndev->hci_dev->msg_rx_queue, hcp_skb);
 		schedule_work(&ndev->hci_dev->msg_rx_work);
@@ -493,6 +508,7 @@ EXPORT_SYMBOL(nci_hci_open_pipe);
 int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      const u8 *param, size_t param_len)
 {
+	struct nci_hcp_message *message;
 	struct nci_conn_info *conn_info;
 	struct nci_data data;
 	int r;
@@ -525,6 +541,11 @@ int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8 idx,
 	r = nci_request(ndev, nci_hci_send_data_req,
 			(unsigned long)&data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
+	if (r == NCI_STATUS_OK) {
+		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
+		r = nci_hci_result_to_errno(NCI_HCP_MSG_GET_CMD(message->header));
+		skb_pull(conn_info->rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
+	}
 
 	kfree(tmp);
 	return r;
@@ -534,6 +555,7 @@ EXPORT_SYMBOL(nci_hci_set_param);
 int nci_hci_get_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      struct sk_buff **skb)
 {
+	struct nci_hcp_message *message;
 	struct nci_conn_info    *conn_info;
 	struct nci_data data;
 	int r;
@@ -558,8 +580,14 @@ int nci_hci_get_param(struct nci_dev *ndev, u8 gate, u8 idx,
 	r = nci_request(ndev, nci_hci_send_data_req, (unsigned long)&data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
 
-	if (r == NCI_STATUS_OK)
-		*skb = conn_info->rx_skb;
+	if (r == NCI_STATUS_OK) {
+		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
+		r = nci_hci_result_to_errno(NCI_HCP_MSG_GET_CMD(message->header));
+		skb_pull(conn_info->rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
+
+		if (!r && skb)
+			*skb = conn_info->rx_skb;
+	}
 
 	return r;
 }
-- 
2.1.4
