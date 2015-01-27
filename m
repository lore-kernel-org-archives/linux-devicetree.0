From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 08/14] NFC: st21nfcb: Add HCI protocol over NCI protocol support
Date: Tue, 27 Jan 2015 01:28:18 +0100
Message-ID: <1422318504-10039-9-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some st21nfcb features are only available through HCI commands. Those
HCI commands can be address over NCI by sending data using a dynamic
conn_id. This is useful for example for Secure Element communication.

The HCI core brings the minimal HCI functions required to communicate with
a secure element.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/Makefile            |   2 +-
 drivers/nfc/st21nfcb/st21nfcb_hci_core.c | 783 +++++++++++++++++++++++++++++++
 drivers/nfc/st21nfcb/st21nfcb_hci_core.h | 134 ++++++
 3 files changed, 918 insertions(+), 1 deletion(-)
 create mode 100644 drivers/nfc/st21nfcb/st21nfcb_hci_core.c
 create mode 100644 drivers/nfc/st21nfcb/st21nfcb_hci_core.h

diff --git a/drivers/nfc/st21nfcb/Makefile b/drivers/nfc/st21nfcb/Makefile
index f4d835d..974c2e9 100644
--- a/drivers/nfc/st21nfcb/Makefile
+++ b/drivers/nfc/st21nfcb/Makefile
@@ -2,7 +2,7 @@
 # Makefile for ST21NFCB NCI based NFC driver
 #
 
-st21nfcb_nci-objs = ndlc.o st21nfcb.o
+st21nfcb_nci-objs = ndlc.o st21nfcb.o st21nfcb_hci_core.o
 obj-$(CONFIG_NFC_ST21NFCB)     += st21nfcb_nci.o
 
 st21nfcb_i2c-objs = i2c.o
diff --git a/drivers/nfc/st21nfcb/st21nfcb_hci_core.c b/drivers/nfc/st21nfcb/st21nfcb_hci_core.c
new file mode 100644
index 0000000..f5a8f2e
--- /dev/null
+++ b/drivers/nfc/st21nfcb/st21nfcb_hci_core.c
@@ -0,0 +1,783 @@
+/*
+ * NCI based Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/module.h>
+#include <linux/nfc.h>
+#include <net/nfc/nci.h>
+#include <net/nfc/nci_core.h>
+
+#include "st21nfcb_hci_core.h"
+
+struct nci_data {
+	u8		conn_id;
+	u8		pipe;
+	u8		cmd;
+	const u8	*data;
+	u32		data_len;
+} __packed;
+
+struct st21nfcb_hci_create_pipe_params {
+	u8 src_gate;
+	u8 dest_host;
+	u8 dest_gate;
+} __packed;
+
+struct st21nfcb_hci_create_pipe_resp {
+	u8 src_host;
+	u8 src_gate;
+	u8 dest_host;
+	u8 dest_gate;
+	u8 pipe;
+} __packed;
+
+struct st21nfcb_hci_delete_pipe_noti {
+	u8 pipe;
+} __packed;
+
+struct st21nfcb_hci_all_pipe_cleared_noti {
+	u8 host;
+} __packed;
+
+struct st21nfcb_hcp_message {
+	u8 header;	/* type -cmd,evt,rsp- + instruction */
+	u8 data[];
+} __packed;
+
+struct st21nfcb_hcp_packet {
+	u8 header;	/* cbit+pipe */
+	struct st21nfcb_hcp_message message;
+} __packed;
+
+
+#define ST21NFCB_HCI_ANY_SET_PARAMETER	0x01
+#define ST21NFCB_HCI_ANY_GET_PARAMETER	0x02
+#define ST21NFCB_HCI_ANY_CLOSE_PIPE	0x04
+
+#define ST21NFCB_HFP_NO_CHAINING	0x80
+
+#define NCI_NFCEE_ID_HCI		0x80
+
+#define ST21NFCB_EVT_HOT_PLUG		0x03
+
+#define ST21NFCB_HCI_ADMIN_PARAM_SESSION_IDENTITY       0x01
+
+/* HCP headers */
+#define ST21NFCB_HCI_HCP_PACKET_HEADER_LEN	1
+#define ST21NFCB_HCI_HCP_MESSAGE_HEADER_LEN	1
+#define ST21NFCB_HCI_HCP_HEADER_LEN		2
+
+/* HCP types */
+#define ST21NFCB_HCI_HCP_COMMAND	0x00
+#define ST21NFCB_HCI_HCP_EVENT		0x01
+#define ST21NFCB_HCI_HCP_RESPONSE	0x02
+
+#define ST21NFCB_HCI_ADM_NOTIFY_PIPE_CREATED     0x12
+#define ST21NFCB_HCI_ADM_NOTIFY_PIPE_DELETED     0x13
+#define ST21NFCB_HCI_ADM_NOTIFY_ALL_PIPE_CLEARED 0x15
+
+#define ST21NFCB_HCI_FRAGMENT		0x7f
+#define ST21NFCB_HCP_HEADER(type, instr) ((((type) & 0x03) << 6) |\
+					   ((instr) & 0x3f))
+
+#define ST21NFCB_HCP_MSG_GET_TYPE(header) ((header & 0xc0) >> 6)
+#define ST21NFCB_HCP_MSG_GET_CMD(header)  (header & 0x3f)
+#define ST21NFCB_HCP_MSG_GET_PIPE(header) (header & 0x7f)
+
+#define ST21NFCB_NUM_DEVICES		256
+
+static DECLARE_BITMAP(dev_mask, ST21NFCB_NUM_DEVICES);
+
+static void st21nfcb_hci_data_received_cb(void *context,
+					  struct sk_buff *skb, int err);
+
+static void st21nfcb_hci_reset_pipes(struct st21nfcb_hci_dev *hdev)
+{
+	int i;
+
+	for (i = 0; i < ST21NFCB_HCI_MAX_PIPES; i++) {
+		hdev->pipes[i].gate = ST21NFCB_HCI_INVALID_GATE;
+		hdev->pipes[i].host = ST21NFCB_HCI_INVALID_HOST;
+	}
+	memset(hdev->gate2pipe, ST21NFCB_HCI_INVALID_PIPE,
+	       sizeof(hdev->gate2pipe));
+}
+
+static void st21nfcb_hci_reset_pipes_per_host(struct st21nfcb_hci_dev *hdev, u8 host)
+{
+	int i;
+
+	for (i = 0; i < ST21NFCB_HCI_MAX_PIPES; i++) {
+		if (hdev->pipes[i].host == host) {
+			hdev->pipes[i].gate = ST21NFCB_HCI_INVALID_GATE;
+			hdev->pipes[i].host = ST21NFCB_HCI_INVALID_HOST;
+		}
+	}
+}
+
+/* Fragment HCI data over NCI packet.
+ * NFC Forum NCI 10.2.2 Data Exchange:
+ * The payload of the Data Packets sent on the Logical Connection SHALL be
+ * valid HCP packets, as defined within [ETSI_102622]. Each Data Packet SHALL
+ * contain a single HCP packet. NCI Segmentation and Reassembly SHALL NOT be
+ * applied to Data Messages in either direction. The HCI fragmentation mechanism
+ * is used if required.
+ */
+static int st21nfcb_hci_send_data(struct nci_dev *ndev, u8 conn_id,
+				  u8 pipe, const u8 data_type, const u8 *data,
+				  size_t data_len)
+{
+	struct nci_conn_info    *conn_info;
+	struct sk_buff *skb;
+	int len, i, r;
+	u8 cb = pipe;
+
+	conn_info = ndev->conn_info_by_id[NCI_NFCEE_ID_HCI];
+	if (!conn_info)
+		return -EPROTO;
+
+	skb = nci_skb_alloc(ndev, 2 + conn_info->max_pkt_payload_len +
+			NCI_DATA_HDR_SIZE, GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+
+	skb_reserve(skb, 2 + NCI_DATA_HDR_SIZE);
+	*skb_push(skb, 1) = data_type;
+
+	i = 0;
+	len = conn_info->max_pkt_payload_len;
+
+	do {
+		/* If last packet add ST21NFCB_HFP_NO_CHAINING */
+		if (i + conn_info->max_pkt_payload_len -
+		    (skb->len + 1) >= data_len) {
+			cb |= ST21NFCB_HFP_NO_CHAINING;
+			len = data_len - i;
+		} else {
+			len = conn_info->max_pkt_payload_len - skb->len - 1;
+		}
+
+		*skb_push(skb, 1) = cb;
+
+		if (len > 0)
+			memcpy(skb_put(skb, len), data + i, len);
+
+		r = nci_send_data(ndev, conn_info->conn_id, skb);
+		if (r < 0)
+			return r;
+
+		i += len;
+		if (i < data_len) {
+			skb_trim(skb, 0);
+			skb_pull(skb, len);
+		}
+	} while (i < data_len);
+
+	return i;
+}
+
+static void st21nfcb_hci_send_data_req(struct nci_dev *ndev, unsigned long opt)
+{
+	struct nci_data *data = (struct nci_data *) opt;
+
+	st21nfcb_hci_send_data(ndev, data->conn_id, data->pipe, data->cmd,
+			       data->data, data->data_len);
+}
+
+int st21nfcb_hci_send_event(struct st21nfcb_hci_dev *hdev, u8 gate, u8 event,
+				const u8 *param, size_t param_len)
+{
+	struct nci_dev *ndev = st21nfcb_hci_get_nci(hdev);
+	struct nci_conn_info    *conn_info;
+	u8 pipe = hdev->gate2pipe[gate];
+
+	if (pipe == ST21NFCB_HCI_INVALID_PIPE)
+		return -EADDRNOTAVAIL;
+
+	conn_info = ndev->conn_info_by_id[NCI_NFCEE_ID_HCI];
+	if (!conn_info)
+		return -EPROTO;
+
+	return st21nfcb_hci_send_data(ndev, conn_info->conn_id, pipe,
+			ST21NFCB_HCP_HEADER(ST21NFCB_HCI_HCP_EVENT, event),
+			param, param_len);
+}
+EXPORT_SYMBOL(st21nfcb_hci_send_event);
+
+int st21nfcb_hci_send_cmd(struct st21nfcb_hci_dev *hdev, u8 gate,
+			u8 cmd, const u8 *param, size_t param_len,
+			struct sk_buff **skb)
+{
+	struct nci_dev *ndev = st21nfcb_hci_get_nci(hdev);
+	struct nci_conn_info    *conn_info;
+	struct nci_data data;
+	int r;
+	u8 pipe = hdev->gate2pipe[gate];
+
+	if (pipe == ST21NFCB_HCI_INVALID_PIPE)
+		return -EADDRNOTAVAIL;
+
+	conn_info = ndev->conn_info_by_id[NCI_NFCEE_ID_HCI];
+	if (!conn_info)
+		return -EPROTO;
+
+	data.conn_id = conn_info->conn_id;
+	data.pipe = pipe;
+	data.cmd = ST21NFCB_HCP_HEADER(ST21NFCB_HCI_HCP_COMMAND, cmd);
+	data.data = param;
+	data.data_len = param_len;
+
+	r = nci_request(ndev, st21nfcb_hci_send_data_req, (unsigned long)&data,
+			 msecs_to_jiffies(NCI_DATA_TIMEOUT));
+
+	if (r == NCI_STATUS_OK)
+		*skb = conn_info->rx_skb;
+
+	return r;
+}
+EXPORT_SYMBOL(st21nfcb_hci_send_cmd);
+
+int st21nfcb_hci_send_response(struct st21nfcb_hci_dev *hdev, u8 pipe,
+				u8 cmd, const u8 *param, size_t param_len)
+{
+	struct nci_dev *ndev = st21nfcb_hci_get_nci(hdev);
+	struct nci_conn_info    *conn_info;
+
+	conn_info = ndev->conn_info_by_id[NCI_NFCEE_ID_HCI];
+	if (!conn_info)
+		return -EPROTO;
+
+	return st21nfcb_hci_send_data(ndev, conn_info->conn_id, pipe,
+			ST21NFCB_HCP_HEADER(ST21NFCB_HCI_HCP_RESPONSE, cmd),
+			param, param_len);
+}
+EXPORT_SYMBOL(st21nfcb_hci_send_response);
+
+static void st21nfcb_hci_event_received(struct st21nfcb_hci_dev *hdev, u8 pipe,
+					u8 event, struct sk_buff *skb)
+{
+	if (hdev->ops->event_received)
+		hdev->ops->event_received(hdev, pipe, event, skb);
+}
+
+static void st21nfcb_hci_cmd_received(struct st21nfcb_hci_dev *hdev, u8 pipe,
+				      u8 cmd, struct sk_buff *skb)
+{
+	u8 gate = hdev->pipes[pipe].gate;
+	u8 status = ST21NFCB_HCI_ANY_OK;
+	struct st21nfcb_hci_create_pipe_resp *create_info;
+	struct st21nfcb_hci_delete_pipe_noti *delete_info;
+	struct st21nfcb_hci_all_pipe_cleared_noti *cleared_info;
+
+	pr_debug("from gate %x pipe %x cmd %x\n", gate, pipe, cmd);
+
+	switch (cmd) {
+	case ST21NFCB_HCI_ADM_NOTIFY_PIPE_CREATED:
+		if (skb->len != 5) {
+			status = ST21NFCB_HCI_ANY_E_NOK;
+			goto exit;
+		}
+		create_info = (struct st21nfcb_hci_create_pipe_resp *)skb->data;
+
+		/*
+		 * Save the new created pipe and bind with local gate,
+		 * the description for skb->data[3] is destination gate id
+		 * but since we received this cmd from host controller, we
+		 * are the destination and it is our local gate
+		 */
+		hdev->gate2pipe[create_info->dest_gate] = create_info->pipe;
+		hdev->pipes[create_info->pipe].gate = create_info->dest_gate;
+		hdev->pipes[create_info->pipe].host = create_info->src_host;
+		break;
+	case ST21NFCB_HCI_ANY_OPEN_PIPE:
+		/* If the pipe is not created report an error */
+		if (gate == ST21NFCB_HCI_INVALID_GATE) {
+			status = ST21NFCB_HCI_ANY_E_NOK;
+			goto exit;
+		}
+		break;
+	case ST21NFCB_HCI_ADM_NOTIFY_PIPE_DELETED:
+		if (skb->len != 1) {
+			status = ST21NFCB_HCI_ANY_E_NOK;
+			goto exit;
+		}
+		delete_info = (struct st21nfcb_hci_delete_pipe_noti *)skb->data;
+
+		hdev->pipes[delete_info->pipe].gate = ST21NFCB_HCI_INVALID_GATE;
+		hdev->pipes[delete_info->pipe].host = ST21NFCB_HCI_INVALID_HOST;
+		break;
+	case ST21NFCB_HCI_ADM_NOTIFY_ALL_PIPE_CLEARED:
+		if (skb->len != 1) {
+			status = ST21NFCB_HCI_ANY_E_NOK;
+			goto exit;
+		}
+		cleared_info = (struct st21nfcb_hci_all_pipe_cleared_noti *)skb->data;
+		st21nfcb_hci_reset_pipes_per_host(hdev, cleared_info->host);
+		break;
+	default:
+		pr_debug("Discarded unknown cmd %x to gate %x\n", cmd, gate);
+		break;
+	}
+
+	if (hdev->ops->cmd_received)
+		hdev->ops->cmd_received(hdev, pipe, cmd, skb);
+
+exit:
+	st21nfcb_hci_send_response(hdev, pipe, status, NULL, 0);
+
+	kfree_skb(skb);
+}
+
+static void st21nfcb_hci_resp_received(struct st21nfcb_hci_dev *hdev, u8 pipe,
+					u8 result, struct sk_buff *skb)
+{
+	struct nci_dev *ndev = st21nfcb_hci_get_nci(hdev);
+	struct nci_conn_info    *conn_info;
+	u8 status = result;
+
+	if (result != ST21NFCB_HCI_ANY_OK)
+		goto exit;
+
+	conn_info = ndev->conn_info_by_id[NCI_NFCEE_ID_HCI];
+	if (!conn_info) {
+		status = NCI_STATUS_REJECTED;
+		goto exit;
+	}
+
+	conn_info->rx_skb = skb;
+
+exit:
+	nci_req_complete(ndev, status);
+}
+
+/*
+ * Receive hcp message for pipe, with type and cmd.
+ * skb contains optional message data only.
+ */
+static void st21nfcb_hci_hcp_message_rx(struct st21nfcb_hci_dev *hdev, u8 pipe,
+				u8 type, u8 instruction, struct sk_buff *skb)
+{
+	struct nci_dev *ndev = st21nfcb_hci_get_nci(hdev);
+
+	switch (type) {
+	case ST21NFCB_HCI_HCP_RESPONSE:
+		st21nfcb_hci_resp_received(hdev, pipe, instruction, skb);
+		break;
+	case ST21NFCB_HCI_HCP_COMMAND:
+		st21nfcb_hci_cmd_received(hdev, pipe, instruction, skb);
+		break;
+	case ST21NFCB_HCI_HCP_EVENT:
+		st21nfcb_hci_event_received(hdev, pipe, instruction, skb);
+		break;
+	default:
+		pr_err("UNKNOWN MSG Type %d, instruction=%d\n",
+			type, instruction);
+		kfree_skb(skb);
+		break;
+	}
+
+	nci_req_complete(ndev, 0);
+}
+
+static void st21nfcb_hci_msg_rx_work(struct work_struct *work)
+{
+	struct st21nfcb_hci_dev *hdev = container_of(work,
+						struct st21nfcb_hci_dev,
+						msg_rx_work);
+	struct sk_buff *skb;
+	struct st21nfcb_hcp_message *message;
+	u8 pipe, type, instruction;
+
+	while ((skb = skb_dequeue(&hdev->msg_rx_queue)) != NULL) {
+		pipe = skb->data[0];
+		skb_pull(skb, ST21NFCB_HCI_HCP_PACKET_HEADER_LEN);
+		message = (struct st21nfcb_hcp_message *)skb->data;
+		type = ST21NFCB_HCP_MSG_GET_TYPE(message->header);
+		instruction = ST21NFCB_HCP_MSG_GET_CMD(message->header);
+		skb_pull(skb, ST21NFCB_HCI_HCP_MESSAGE_HEADER_LEN);
+
+		st21nfcb_hci_hcp_message_rx(hdev, pipe, type, instruction, skb);
+	}
+}
+
+static void st21nfcb_hci_data_received_cb(void *context,
+				struct sk_buff *skb, int err)
+{
+	struct st21nfcb_hci_dev *hdev = (struct st21nfcb_hci_dev *)context;
+	struct st21nfcb_hcp_packet *packet;
+	u8 pipe, type, instruction;
+	struct sk_buff *hcp_skb;
+	struct sk_buff *frag_skb;
+	int msg_len;
+
+	pr_debug("\n");
+
+	if (err) {
+		nci_req_complete(hdev->ndev, err);
+		return;
+	}
+
+	packet = (struct st21nfcb_hcp_packet *)skb->data;
+	if ((packet->header & ~ST21NFCB_HCI_FRAGMENT) == 0) {
+		skb_queue_tail(&hdev->rx_hcp_frags, skb);
+		return;
+	}
+
+	/* it's the last fragment. Does it need re-aggregation? */
+	if (skb_queue_len(&hdev->rx_hcp_frags)) {
+		pipe = packet->header & ST21NFCB_HCI_FRAGMENT;
+		skb_queue_tail(&hdev->rx_hcp_frags, skb);
+
+		msg_len = 0;
+		skb_queue_walk(&hdev->rx_hcp_frags, frag_skb) {
+			msg_len += (frag_skb->len -
+				    ST21NFCB_HCI_HCP_PACKET_HEADER_LEN);
+		}
+
+		hcp_skb = nfc_alloc_recv_skb(ST21NFCB_HCI_HCP_PACKET_HEADER_LEN +
+					     msg_len, GFP_KERNEL);
+		if (hcp_skb == NULL) {
+			nci_req_complete(hdev->ndev, -ENOMEM);
+			return;
+		}
+
+		*skb_put(hcp_skb, ST21NFCB_HCI_HCP_PACKET_HEADER_LEN) = pipe;
+
+		skb_queue_walk(&hdev->rx_hcp_frags, frag_skb) {
+			msg_len = frag_skb->len -
+				  ST21NFCB_HCI_HCP_PACKET_HEADER_LEN;
+			memcpy(skb_put(hcp_skb, msg_len), frag_skb->data +
+			       ST21NFCB_HCI_HCP_PACKET_HEADER_LEN, msg_len);
+		}
+
+		skb_queue_purge(&hdev->rx_hcp_frags);
+	} else {
+		packet->header &= ST21NFCB_HCI_FRAGMENT;
+		hcp_skb = skb;
+	}
+
+	/* if this is a response, dispatch immediately to
+	 * unblock waiting cmd context. Otherwise, enqueue to dispatch
+	 * in separate context where handler can also execute command.
+	 */
+	packet = (struct st21nfcb_hcp_packet *)hcp_skb->data;
+	type = ST21NFCB_HCP_MSG_GET_TYPE(packet->message.header);
+	if (type == ST21NFCB_HCI_HCP_RESPONSE) {
+		pipe = packet->header;
+		instruction = ST21NFCB_HCP_MSG_GET_CMD(packet->message.header);
+		skb_pull(hcp_skb, ST21NFCB_HCI_HCP_PACKET_HEADER_LEN +
+			ST21NFCB_HCI_HCP_MESSAGE_HEADER_LEN);
+		st21nfcb_hci_hcp_message_rx(hdev, pipe, type, instruction,
+					    hcp_skb);
+	} else {
+		skb_queue_tail(&hdev->msg_rx_queue, hcp_skb);
+		schedule_work(&hdev->msg_rx_work);
+	}
+}
+
+int st21nfcb_hci_open_pipe(struct st21nfcb_hci_dev *hdev, u8 pipe)
+{
+	struct nci_dev *ndev = st21nfcb_hci_get_nci(hdev);
+	struct nci_data data;
+	struct nci_conn_info    *conn_info;
+
+	conn_info = ndev->conn_info_by_id[NCI_NFCEE_ID_HCI];
+	if (!conn_info)
+		return -EPROTO;
+
+	data.conn_id = conn_info->conn_id;
+	data.pipe = pipe;
+	data.cmd = ST21NFCB_HCP_HEADER(ST21NFCB_HCI_HCP_COMMAND,
+				       ST21NFCB_HCI_ANY_OPEN_PIPE);
+	data.data = NULL;
+	data.data_len = 0;
+
+	return nci_request(ndev, st21nfcb_hci_send_data_req,
+			(unsigned long)&data,
+			msecs_to_jiffies(NCI_DATA_TIMEOUT));
+}
+EXPORT_SYMBOL(st21nfcb_hci_open_pipe);
+
+int st21nfcb_hci_set_param(struct st21nfcb_hci_dev *hdev, u8 gate, u8 idx,
+			const u8 *param, size_t param_len)
+{
+	struct nci_dev *ndev = st21nfcb_hci_get_nci(hdev);
+	struct nci_conn_info *conn_info;
+	struct nci_data data;
+	int r;
+	u8 *tmp;
+	u8 pipe = hdev->gate2pipe[gate];
+
+	pr_debug("idx=%d to gate %d\n", idx, gate);
+
+	if (pipe == ST21NFCB_HCI_INVALID_PIPE)
+		return -EADDRNOTAVAIL;
+
+	conn_info = ndev->conn_info_by_id[NCI_NFCEE_ID_HCI];
+	if (!conn_info)
+		return -EPROTO;
+
+	tmp = kmalloc(1 + param_len, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	*tmp = idx;
+	memcpy(tmp + 1, param, param_len);
+
+	data.conn_id = conn_info->conn_id;
+	data.pipe = pipe;
+	data.cmd = ST21NFCB_HCP_HEADER(ST21NFCB_HCI_HCP_COMMAND,
+				ST21NFCB_HCI_ANY_SET_PARAMETER);
+	data.data = tmp;
+	data.data_len = param_len + 1;
+
+	r = nci_request(ndev, st21nfcb_hci_send_data_req,
+			(unsigned long)&data,
+			msecs_to_jiffies(NCI_DATA_TIMEOUT));
+
+	kfree(tmp);
+	return r;
+}
+EXPORT_SYMBOL(st21nfcb_hci_set_param);
+
+int st21nfcb_hci_get_param(struct st21nfcb_hci_dev *hdev, u8 gate, u8 idx,
+			struct sk_buff **skb)
+{
+	struct nci_dev *ndev = st21nfcb_hci_get_nci(hdev);
+	struct nci_conn_info    *conn_info;
+	struct nci_data data;
+	int r;
+	u8 pipe = hdev->gate2pipe[gate];
+
+	pr_debug("idx=%d to gate %d\n", idx, gate);
+
+	if (pipe == ST21NFCB_HCI_INVALID_PIPE)
+		return -EADDRNOTAVAIL;
+
+	conn_info = ndev->conn_info_by_id[NCI_NFCEE_ID_HCI];
+	if (!conn_info)
+		return -EPROTO;
+
+	data.conn_id = conn_info->conn_id;
+	data.pipe = pipe;
+	data.cmd = ST21NFCB_HCP_HEADER(ST21NFCB_HCI_HCP_COMMAND,
+				ST21NFCB_HCI_ANY_GET_PARAMETER);
+	data.data = &idx;
+	data.data_len = 1;
+
+	r = nci_request(ndev, st21nfcb_hci_send_data_req, (unsigned long)&data,
+			msecs_to_jiffies(NCI_DATA_TIMEOUT));
+
+	if (r == NCI_STATUS_OK)
+		*skb = conn_info->rx_skb;
+
+	return r;
+}
+EXPORT_SYMBOL(st21nfcb_hci_get_param);
+
+int st21nfcb_hci_connect_gate(struct st21nfcb_hci_dev *hdev,
+				u8 dest_host, u8 dest_gate, u8 pipe)
+{
+	int r;
+
+	if (pipe == ST21NFCB_HCI_DO_NOT_OPEN_PIPE)
+		return 0;
+
+	if (hdev->gate2pipe[dest_gate] != ST21NFCB_HCI_INVALID_PIPE)
+		return -EADDRINUSE;
+
+	if (pipe != ST21NFCB_HCI_INVALID_PIPE)
+		goto open_pipe;
+
+	switch (dest_gate) {
+	case ST21NFCB_HCI_LINK_MGMT_GATE:
+		pipe = ST21NFCB_HCI_LINK_MGMT_PIPE;
+	break;
+	case ST21NFCB_HCI_ADMIN_GATE:
+		pipe = ST21NFCB_HCI_ADMIN_PIPE;
+	break;
+	}
+
+open_pipe:
+	r = st21nfcb_hci_open_pipe(hdev, pipe);
+	if (r < 0)
+		return r;
+
+	hdev->pipes[pipe].gate = dest_gate;
+	hdev->pipes[pipe].host = dest_host;
+	hdev->gate2pipe[dest_gate] = pipe;
+
+	return 0;
+}
+EXPORT_SYMBOL(st21nfcb_hci_connect_gate);
+
+static int st21nfcb_hci_dev_connect_gates(struct st21nfcb_hci_dev *hdev,
+					  u8 gate_count,
+					  struct st21nfcb_hci_gate *gates)
+{
+	int r;
+
+	while (gate_count--) {
+		r = st21nfcb_hci_connect_gate(hdev, ST21NFCB_HOST_CONTROLLER_ID,
+					      gates->gate, gates->pipe);
+		if (r < 0)
+			return r;
+		gates++;
+	}
+
+	return 0;
+}
+
+static int st21nfcb_hci_dev_session_init(struct st21nfcb_hci_dev *hdev,
+					 const char *session_id)
+{
+	struct sk_buff *skb;
+	int r, dev_num;
+
+	hdev->count_pipes = 0;
+	hdev->expected_pipes = 0;
+
+	/*
+	 * Session id must include the driver name + i2c bus addr
+	 * persistent info to discriminate 2 identical chips
+	 */
+	dev_num = find_first_zero_bit(dev_mask, ST21NFCB_NUM_DEVICES);
+	if (dev_num >= ST21NFCB_NUM_DEVICES)
+		return -ENODEV;
+
+	scnprintf(hdev->init_data.session_id,
+		  sizeof(hdev->init_data.session_id), "%s%2x", session_id,
+		  dev_num);
+
+	if (hdev->init_data.gates[0].gate != ST21NFCB_HCI_ADMIN_GATE)
+		return -EPROTO;
+
+	r = st21nfcb_hci_connect_gate(hdev, ST21NFCB_HOST_CONTROLLER_ID,
+				hdev->init_data.gates[0].gate,
+				hdev->init_data.gates[0].pipe);
+	if (r < 0)
+		goto exit;
+
+	r = st21nfcb_hci_get_param(hdev, ST21NFCB_HCI_ADMIN_GATE,
+				ST21NFCB_HCI_ADMIN_PARAM_SESSION_IDENTITY,
+				&skb);
+	if (r < 0)
+		goto exit;
+
+	if (skb->len && skb->len == strlen(hdev->init_data.session_id) &&
+	    memcmp(hdev->init_data.session_id, skb->data, skb->len) == 0 &&
+		   hdev->ops->load_session) {
+		/* Restore gate<->pipe table from some proprietary location. */
+		r = hdev->ops->load_session(hdev);
+		if (r < 0)
+			goto exit;
+	} else {
+		r = st21nfcb_hci_dev_connect_gates(hdev,
+					hdev->init_data.gate_count,
+					hdev->init_data.gates);
+		if (r < 0)
+			goto exit;
+
+		r = st21nfcb_hci_set_param(hdev, ST21NFCB_HCI_ADMIN_GATE,
+				ST21NFCB_HCI_ADMIN_PARAM_SESSION_IDENTITY,
+				hdev->init_data.session_id,
+				strlen(hdev->init_data.session_id));
+	}
+	if (r == 0)
+		goto exit;
+
+exit:
+	kfree_skb(skb);
+
+	return r;
+}
+
+struct st21nfcb_hci_dev *st21nfcb_hci_allocate(struct nci_dev *ndev,
+					       struct st21nfcb_hci_ops *ops,
+					       const char *session_id,
+					       struct st21nfcb_hci_gate *gates,
+					       int gates_len)
+{
+	struct st21nfcb_hci_dev  *hdev;
+	struct core_conn_create_dest_spec_params dest_params;
+	struct nci_conn_info    *conn_info;
+	int r;
+
+	hdev = kzalloc(sizeof(struct st21nfcb_hci_dev), GFP_KERNEL);
+	if (!hdev)
+		return NULL;
+
+	r = nci_nfcee_discover(ndev, NCI_NFCEE_DISCOVERY_ACTION_ENABLE);
+	if (r != NCI_STATUS_OK)
+		goto exit;
+
+	dest_params.type = NCI_DESTINATION_SPECIFIC_PARAM_NFCEE_TYPE;
+	dest_params.length = sizeof(struct dest_spec_params);
+	dest_params.value.id = NCI_NFCEE_ID_HCI;
+	dest_params.value.protocol = NCI_NFCEE_INTERFACE_HCI_ACCESS;
+	r = nci_core_conn_create(ndev, &dest_params);
+	if (r != NCI_STATUS_OK)
+		goto exit;
+
+	conn_info = ndev->conn_info_by_id[NCI_NFCEE_ID_HCI];
+	if (!conn_info)
+		goto exit;
+
+	conn_info->data_exchange_cb = st21nfcb_hci_data_received_cb;
+	conn_info->data_exchange_cb_context = hdev;
+
+	hdev->ndev = ndev;
+	hdev->ops = ops;
+
+	skb_queue_head_init(&hdev->rx_hcp_frags);
+	INIT_WORK(&hdev->msg_rx_work, st21nfcb_hci_msg_rx_work);
+	skb_queue_head_init(&hdev->msg_rx_queue);
+
+	memcpy(hdev->init_data.gates, gates, gates_len);
+
+	st21nfcb_hci_reset_pipes(hdev);
+	r = st21nfcb_hci_dev_session_init(hdev, "ST21BH");
+	if (r != ST21NFCB_HCI_ANY_OK)
+		goto exit;
+
+	r = nci_nfcee_mode_set(ndev, NCI_NFCEE_ID_HCI, NCI_NFCEE_ENABLE);
+	if (r != NCI_STATUS_OK)
+		goto exit;
+
+	return hdev;
+
+exit:
+	kfree(hdev);
+	return NULL;
+}
+EXPORT_SYMBOL(st21nfcb_hci_allocate);
+
+void st21nfcb_hci_free(struct st21nfcb_hci_dev *hdev)
+{
+	struct nci_conn_info    *conn_info;
+
+	conn_info = hdev->ndev->conn_info_by_id[NCI_NFCEE_ID_HCI];
+	if (!conn_info)
+		return;
+
+	nci_core_conn_close(hdev->ndev, conn_info->conn_id);
+	kfree(hdev);
+}
+EXPORT_SYMBOL(st21nfcb_hci_free);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/nfc/st21nfcb/st21nfcb_hci_core.h b/drivers/nfc/st21nfcb/st21nfcb_hci_core.h
new file mode 100644
index 0000000..fa468b4
--- /dev/null
+++ b/drivers/nfc/st21nfcb/st21nfcb_hci_core.h
@@ -0,0 +1,134 @@
+/*
+ * NCI based Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __LOCAL_ST21NFCB_HCI_CORE_H_
+#define __LOCAL_ST21NFCB_HCI_CORE_H_
+
+#define ST21NFCB_HCI_ANY_OPEN_PIPE	0x03
+
+/* Hosts */
+#define ST21NFCB_HOST_CONTROLLER_ID     0x00
+#define ST21NFCB_TERMINAL_HOST_ID       0x01
+#define ST21NFCB_UICC_HOST_ID           0x02
+#define ST21NFCB_ESE_HOST_ID            0xc0
+
+/* Gates */
+#define ST21NFCB_HCI_ADMIN_GATE         0x00
+#define ST21NFCB_DEVICE_MGNT_GATE       0x01
+#define ST21NFCB_HCI_LINK_MGMT_GATE     0x06
+#define ST21NFCB_APDU_READER_GATE       0xf0
+#define ST21NFCB_CONNECTIVITY_GATE      0x41
+
+/* Pipes */
+#define ST21NFCB_HCI_LINK_MGMT_PIPE             0x00
+#define ST21NFCB_HCI_ADMIN_PIPE                 0x01
+#define ST21NFCB_DEVICE_MGNT_PIPE               0x02
+
+/* Generic responses */
+#define ST21NFCB_HCI_ANY_OK                     0x00
+#define ST21NFCB_HCI_ANY_E_NOT_CONNECTED        0x01
+#define ST21NFCB_HCI_ANY_E_CMD_PAR_UNKNOWN      0x02
+#define ST21NFCB_HCI_ANY_E_NOK                  0x03
+#define ST21NFCB_HCI_ANY_E_PIPES_FULL           0x04
+#define ST21NFCB_HCI_ANY_E_REG_PAR_UNKNOWN      0x05
+#define ST21NFCB_HCI_ANY_E_PIPE_NOT_OPENED      0x06
+#define ST21NFCB_HCI_ANY_E_CMD_NOT_SUPPORTED    0x07
+#define ST21NFCB_HCI_ANY_E_INHIBITED            0x08
+#define ST21NFCB_HCI_ANY_E_TIMEOUT              0x09
+#define ST21NFCB_HCI_ANY_E_REG_ACCESS_DENIED    0x0a
+#define ST21NFCB_HCI_ANY_E_PIPE_ACCESS_DENIED   0x0b
+
+#define ST21NFCB_HCI_DO_NOT_OPEN_PIPE		0x81
+#define ST21NFCB_HCI_INVALID_PIPE		0x80
+#define ST21NFCB_HCI_INVALID_GATE		0xFF
+#define ST21NFCB_HCI_INVALID_HOST		0x80
+
+#define ST21NFCB_HCI_MAX_CUSTOM_GATES   50
+#define ST21NFCB_HCI_MAX_PIPES          127
+
+struct st21nfcb_hci_gate {
+	u8 gate;
+	u8 pipe;
+} __packed;
+
+struct st21nfcb_hci_pipe {
+	u8 gate;
+	u8 host;
+} __packed;
+
+struct st21nfcb_hci_init_data {
+	u8 gate_count;
+	struct st21nfcb_hci_gate gates[ST21NFCB_HCI_MAX_CUSTOM_GATES];
+	char session_id[9];
+};
+
+#define ST21NFCB_HCI_MAX_GATES		256
+
+struct st21nfcb_hci_dev {
+	struct nci_dev *ndev;
+
+	struct st21nfcb_hci_init_data init_data;
+	struct st21nfcb_hci_pipe pipes[ST21NFCB_HCI_MAX_PIPES];
+	u8 gate2pipe[ST21NFCB_HCI_MAX_GATES];
+	int expected_pipes;
+	int count_pipes;
+
+	struct sk_buff_head rx_hcp_frags;
+	struct work_struct msg_rx_work;
+	struct sk_buff_head msg_rx_queue;
+
+	struct st21nfcb_hci_ops *ops;
+};
+
+struct st21nfcb_hci_ops {
+	int (*load_session)(struct st21nfcb_hci_dev *hdev);
+	void (*event_received)(struct st21nfcb_hci_dev *hdev, u8 pipe, u8 event,
+			      struct sk_buff *skb);
+	void (*cmd_received)(struct st21nfcb_hci_dev *ndev, u8 pipe, u8 cmd,
+			    struct sk_buff *skb);
+};
+
+static inline struct nci_dev *st21nfcb_hci_get_nci(struct st21nfcb_hci_dev *hdev)
+{
+	return hdev->ndev;
+}
+
+int st21nfcb_hci_send_event(struct st21nfcb_hci_dev *hdev, u8 gate, u8 event,
+			    const u8 *param, size_t param_len);
+int st21nfcb_hci_send_cmd(struct st21nfcb_hci_dev *hdev, u8 gate,
+			  u8 cmd, const u8 *param, size_t param_len,
+			  struct sk_buff **skb);
+int st21nfcb_hci_send_response(struct st21nfcb_hci_dev *hdev, u8 pipe,
+			       u8 cmd, const u8 *param, size_t param_len);
+
+int st21nfcb_hci_open_pipe(struct st21nfcb_hci_dev *hdev, u8 pipe);
+int st21nfcb_hci_connect_gate(struct st21nfcb_hci_dev *hdev,
+			      u8 dest_host, u8 dest_gate, u8 pipe);
+int st21nfcb_hci_set_param(struct st21nfcb_hci_dev *hdev, u8 gate, u8 idx,
+			   const u8 *param, size_t param_len);
+int st21nfcb_hci_get_param(struct st21nfcb_hci_dev *hdev, u8 gate, u8 idx,
+			   struct sk_buff **skb);
+
+struct st21nfcb_hci_dev *st21nfcb_hci_allocate(struct nci_dev *ndev,
+					struct st21nfcb_hci_ops *ops,
+					const char *session_id,
+					struct st21nfcb_hci_gate *gates,
+					int gates_len);
+void st21nfcb_hci_free(struct st21nfcb_hci_dev *hdev);
+
+#endif /* __LOCAL_ST21NFCB_HCI_CORE_H_ */
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
