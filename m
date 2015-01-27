From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 01/14] NFC: nci: Add dynamic conn_id NCI concept.
Date: Tue, 27 Jan 2015 01:28:11 +0100
Message-ID: <1422318504-10039-2-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The current NCI core only support static conn_id for RF communication.
For other NFC features such as Secure Element communication, we may need
additional conn_id.

In order to address each conn_id dynamically including statics one such as
NCI_STATIC_RF_CONN_ID, we introduce 2 tables referring to conn_id context
by conn_id or by ID (RF Discovery ID or NFCEE ID).

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci_core.h | 29 +++++++++++++++++------
 net/nfc/nci/core.c         | 28 +++++++++++++++++------
 net/nfc/nci/data.c         | 57 ++++++++++++++++++++++++++++++++++------------
 net/nfc/nci/ntf.c          | 34 +++++++++++++++++++--------
 net/nfc/nci/rsp.c          | 16 ++++++++++++-
 5 files changed, 124 insertions(+), 40 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 9e51bb4..25c0a70 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -82,6 +82,22 @@ struct nci_ops {
 
 #define NCI_MAX_SUPPORTED_RF_INTERFACES		4
 #define NCI_MAX_DISCOVERED_TARGETS		10
+#define NCI_MAX_NUM_NFCEE   255
+#define NCI_MAX_CONN_ID		7
+
+struct nci_conn_info {
+	__u8	id; /* can be an RF Discovery ID or an NFCEE ID */
+	__u8	conn_id;
+	__u8	max_pkt_payload_len;
+
+	atomic_t credits_cnt;
+	__u8	 initial_num_credits;
+
+	data_exchange_cb_t	data_exchange_cb;
+	void *data_exchange_cb_context;
+
+	struct sk_buff *rx_skb;
+};
 
 /* NCI Core structures */
 struct nci_dev {
@@ -95,7 +111,8 @@ struct nci_dev {
 	unsigned long		flags;
 
 	atomic_t		cmd_cnt;
-	atomic_t		credits_cnt;
+	__u8			cur_conn_id;
+	struct nci_conn_info	*conn_info_by_conn_id[NCI_MAX_CONN_ID];
 
 	struct timer_list	cmd_timer;
 	struct timer_list	data_timer;
@@ -141,13 +158,11 @@ struct nci_dev {
 	__u8			manufact_id;
 	__u32			manufact_specific_info;
 
-	/* received during NCI_OP_RF_INTF_ACTIVATED_NTF */
-	__u8			max_data_pkt_payload_size;
-	__u8			initial_num_credits;
+	/* Save RF Discovery ID or NFCEE ID under conn_create */
+	__u8			cur_id;
+	struct nci_conn_info	*conn_info_by_id[NCI_MAX_NUM_NFCEE];
 
 	/* stored during nci_data_exchange */
-	data_exchange_cb_t	data_exchange_cb;
-	void			*data_exchange_cb_context;
 	struct sk_buff		*rx_data_reassembly;
 
 	/* stored during intf_activated_ntf */
@@ -200,7 +215,7 @@ void nci_rx_data_packet(struct nci_dev *ndev, struct sk_buff *skb);
 int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, void *payload);
 int nci_send_data(struct nci_dev *ndev, __u8 conn_id, struct sk_buff *skb);
 void nci_data_exchange_complete(struct nci_dev *ndev, struct sk_buff *skb,
-				int err);
+				__u8 conn_id, int err);
 void nci_clear_target_list(struct nci_dev *ndev);
 
 /* ----- NCI requests ----- */
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 51feb5e..92b42e2 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -712,6 +712,12 @@ static int nci_transceive(struct nfc_dev *nfc_dev, struct nfc_target *target,
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
 	int rc;
+	struct nci_conn_info    *conn_info;
+
+	conn_info =
+		(struct nci_conn_info *)ndev->conn_info_by_conn_id[NCI_STATIC_RF_CONN_ID];
+	if (!conn_info)
+		return -EPROTO;
 
 	pr_debug("target_idx %d, len %d\n", target->idx, skb->len);
 
@@ -724,8 +730,8 @@ static int nci_transceive(struct nfc_dev *nfc_dev, struct nfc_target *target,
 		return -EBUSY;
 
 	/* store cb and context to be used on receiving data */
-	ndev->data_exchange_cb = cb;
-	ndev->data_exchange_cb_context = cb_context;
+	conn_info->data_exchange_cb = cb;
+	conn_info->data_exchange_cb_context = cb_context;
 
 	rc = nci_send_data(ndev, NCI_STATIC_RF_CONN_ID, skb);
 	if (rc)
@@ -1027,20 +1033,26 @@ int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, void *payload)
 static void nci_tx_work(struct work_struct *work)
 {
 	struct nci_dev *ndev = container_of(work, struct nci_dev, tx_work);
+	struct nci_conn_info    *conn_info;
 	struct sk_buff *skb;
 
-	pr_debug("credits_cnt %d\n", atomic_read(&ndev->credits_cnt));
+	conn_info =
+		(struct nci_conn_info *)ndev->conn_info_by_conn_id[ndev->cur_conn_id];
+	if (!conn_info)
+		return;
+
+	pr_debug("credits_cnt %d\n", atomic_read(&conn_info->credits_cnt));
 
 	/* Send queued tx data */
-	while (atomic_read(&ndev->credits_cnt)) {
+	while (atomic_read(&conn_info->credits_cnt)) {
 		skb = skb_dequeue(&ndev->tx_q);
 		if (!skb)
 			return;
 
 		/* Check if data flow control is used */
-		if (atomic_read(&ndev->credits_cnt) !=
+		if (atomic_read(&conn_info->credits_cnt) !=
 		    NCI_DATA_FLOW_CONTROL_NOT_USED)
-			atomic_dec(&ndev->credits_cnt);
+			atomic_dec(&conn_info->credits_cnt);
 
 		pr_debug("NCI TX: MT=data, PBF=%d, conn_id=%d, plen=%d\n",
 			 nci_pbf(skb->data),
@@ -1092,7 +1104,9 @@ static void nci_rx_work(struct work_struct *work)
 	if (test_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags)) {
 		/* complete the data exchange transaction, if exists */
 		if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
-			nci_data_exchange_complete(ndev, NULL, -ETIMEDOUT);
+			nci_data_exchange_complete(ndev, NULL,
+						   ndev->cur_conn_id,
+						   -ETIMEDOUT);
 
 		clear_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags);
 	}
diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index a2de2a8..5485293 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -36,10 +36,21 @@
 
 /* Complete data exchange transaction and forward skb to nfc core */
 void nci_data_exchange_complete(struct nci_dev *ndev, struct sk_buff *skb,
-				int err)
+				__u8 conn_id, int err)
 {
-	data_exchange_cb_t cb = ndev->data_exchange_cb;
-	void *cb_context = ndev->data_exchange_cb_context;
+	struct nci_conn_info    *conn_info;
+	data_exchange_cb_t cb;
+	void *cb_context;
+
+	conn_info =
+		(struct nci_conn_info *)ndev->conn_info_by_conn_id[conn_id];
+	if (!conn_info) {
+		kfree_skb(skb);
+		goto exit;
+	}
+
+	cb = conn_info->data_exchange_cb;
+	cb_context = conn_info->data_exchange_cb_context;
 
 	pr_debug("len %d, err %d\n", skb ? skb->len : 0, err);
 
@@ -48,9 +59,6 @@ void nci_data_exchange_complete(struct nci_dev *ndev, struct sk_buff *skb,
 	clear_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags);
 
 	if (cb) {
-		ndev->data_exchange_cb = NULL;
-		ndev->data_exchange_cb_context = NULL;
-
 		/* forward skb to nfc core */
 		cb(cb_context, skb, err);
 	} else if (skb) {
@@ -60,6 +68,7 @@ void nci_data_exchange_complete(struct nci_dev *ndev, struct sk_buff *skb,
 		kfree_skb(skb);
 	}
 
+exit:
 	clear_bit(NCI_DATA_EXCHANGE, &ndev->flags);
 }
 
@@ -85,6 +94,7 @@ static inline void nci_push_data_hdr(struct nci_dev *ndev,
 static int nci_queue_tx_data_frags(struct nci_dev *ndev,
 				   __u8 conn_id,
 				   struct sk_buff *skb) {
+	struct nci_conn_info    *conn_info;
 	int total_len = skb->len;
 	unsigned char *data = skb->data;
 	unsigned long flags;
@@ -95,11 +105,17 @@ static int nci_queue_tx_data_frags(struct nci_dev *ndev,
 
 	pr_debug("conn_id 0x%x, total_len %d\n", conn_id, total_len);
 
+	conn_info = ndev->conn_info_by_conn_id[conn_id];
+	if (!conn_info) {
+		rc = -EPROTO;
+		goto free_exit;
+	}
+
 	__skb_queue_head_init(&frags_q);
 
 	while (total_len) {
 		frag_len =
-			min_t(int, total_len, ndev->max_data_pkt_payload_size);
+			min_t(int, total_len, conn_info->max_pkt_payload_len);
 
 		skb_frag = nci_skb_alloc(ndev,
 					 (NCI_DATA_HDR_SIZE + frag_len),
@@ -151,12 +167,19 @@ exit:
 /* Send NCI data */
 int nci_send_data(struct nci_dev *ndev, __u8 conn_id, struct sk_buff *skb)
 {
+	struct nci_conn_info    *conn_info;
 	int rc = 0;
 
 	pr_debug("conn_id 0x%x, plen %d\n", conn_id, skb->len);
 
+	conn_info = (struct nci_conn_info *)ndev->conn_info_by_conn_id[conn_id];
+	if (!conn_info) {
+		rc = -EPROTO;
+		goto free_exit;
+	}
+
 	/* check if the packet need to be fragmented */
-	if (skb->len <= ndev->max_data_pkt_payload_size) {
+	if (skb->len <= conn_info->max_pkt_payload_len) {
 		/* no need to fragment packet */
 		nci_push_data_hdr(ndev, conn_id, skb, NCI_PBF_LAST);
 
@@ -170,6 +193,7 @@ int nci_send_data(struct nci_dev *ndev, __u8 conn_id, struct sk_buff *skb)
 		}
 	}
 
+	ndev->cur_conn_id = conn_id;
 	queue_work(ndev->tx_wq, &ndev->tx_work);
 
 	goto exit;
@@ -185,7 +209,7 @@ exit:
 
 static void nci_add_rx_data_frag(struct nci_dev *ndev,
 				 struct sk_buff *skb,
-				 __u8 pbf, __u8 status)
+				 __u8 pbf, __u8 conn_id, __u8 status)
 {
 	int reassembly_len;
 	int err = 0;
@@ -229,16 +253,13 @@ static void nci_add_rx_data_frag(struct nci_dev *ndev,
 	}
 
 exit:
-	if (ndev->nfc_dev->rf_mode == NFC_RF_INITIATOR) {
-		nci_data_exchange_complete(ndev, skb, err);
-	} else if (ndev->nfc_dev->rf_mode == NFC_RF_TARGET) {
+	if (ndev->nfc_dev->rf_mode == NFC_RF_TARGET) {
 		/* Data received in Target mode, forward to nfc core */
 		err = nfc_tm_data_received(ndev->nfc_dev, skb);
 		if (err)
 			pr_err("unable to handle received data\n");
 	} else {
-		pr_err("rf mode unknown\n");
-		kfree_skb(skb);
+		nci_data_exchange_complete(ndev, skb, conn_id, err);
 	}
 }
 
@@ -247,6 +268,8 @@ void nci_rx_data_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u8 pbf = nci_pbf(skb->data);
 	__u8 status = 0;
+	__u8 conn_id = nci_conn_id(skb->data);
+	struct nci_conn_info    *conn_info;
 
 	pr_debug("len %d\n", skb->len);
 
@@ -255,6 +278,10 @@ void nci_rx_data_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		 nci_conn_id(skb->data),
 		 nci_plen(skb->data));
 
+	conn_info = ndev->conn_info_by_conn_id[conn_id];
+	if (!conn_info)
+		return;
+
 	/* strip the nci data header */
 	skb_pull(skb, NCI_DATA_HDR_SIZE);
 
@@ -268,5 +295,5 @@ void nci_rx_data_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		skb_trim(skb, (skb->len - 1));
 	}
 
-	nci_add_rx_data_frag(ndev, skb, pbf, nci_to_errno(status));
+	nci_add_rx_data_frag(ndev, skb, pbf, conn_id, nci_to_errno(status));
 }
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 22e453c..8c73462 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -43,6 +43,7 @@ static void nci_core_conn_credits_ntf_packet(struct nci_dev *ndev,
 					     struct sk_buff *skb)
 {
 	struct nci_core_conn_credit_ntf *ntf = (void *) skb->data;
+	struct nci_conn_info	*conn_info;
 	int i;
 
 	pr_debug("num_entries %d\n", ntf->num_entries);
@@ -59,11 +60,12 @@ static void nci_core_conn_credits_ntf_packet(struct nci_dev *ndev,
 			 i, ntf->conn_entries[i].conn_id,
 			 ntf->conn_entries[i].credits);
 
-		if (ntf->conn_entries[i].conn_id == NCI_STATIC_RF_CONN_ID) {
-			/* found static rf connection */
-			atomic_add(ntf->conn_entries[i].credits,
-				   &ndev->credits_cnt);
-		}
+		conn_info = ndev->conn_info_by_conn_id[ntf->conn_entries[i].conn_id];
+		if (!conn_info)
+			return;
+
+		atomic_add(ntf->conn_entries[i].credits,
+			   &conn_info->credits_cnt);
 	}
 
 	/* trigger the next tx */
@@ -96,7 +98,7 @@ static void nci_core_conn_intf_error_ntf_packet(struct nci_dev *ndev,
 
 	/* complete the data exchange transaction, if exists */
 	if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
-		nci_data_exchange_complete(ndev, NULL, -EIO);
+		nci_data_exchange_complete(ndev, NULL, ntf->conn_id, -EIO);
 }
 
 static __u8 *nci_extract_rf_params_nfca_passive_poll(struct nci_dev *ndev,
@@ -513,6 +515,7 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 static void nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
 					     struct sk_buff *skb)
 {
+	struct nci_conn_info    *conn_info;
 	struct nci_rf_intf_activated_ntf ntf;
 	__u8 *data = skb->data;
 	int err = NCI_STATUS_OK;
@@ -614,11 +617,16 @@ static void nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
 
 exit:
 	if (err == NCI_STATUS_OK) {
-		ndev->max_data_pkt_payload_size = ntf.max_data_pkt_payload_size;
-		ndev->initial_num_credits = ntf.initial_num_credits;
+		conn_info = ndev->conn_info_by_conn_id[NCI_STATIC_RF_CONN_ID];
+		if (!conn_info)
+			return;
+
+		conn_info->max_pkt_payload_len = ntf.max_data_pkt_payload_size;
+		conn_info->initial_num_credits = ntf.initial_num_credits;
 
 		/* set the available credits to initial value */
-		atomic_set(&ndev->credits_cnt, ndev->initial_num_credits);
+		atomic_set(&conn_info->credits_cnt,
+			   conn_info->initial_num_credits);
 
 		/* store general bytes to be reported later in dep_link_up */
 		if (ntf.rf_interface == NCI_RF_INTERFACE_NFC_DEP) {
@@ -661,10 +669,15 @@ exit:
 static void nci_rf_deactivate_ntf_packet(struct nci_dev *ndev,
 					 struct sk_buff *skb)
 {
+	struct nci_conn_info    *conn_info;
 	struct nci_rf_deactivate_ntf *ntf = (void *) skb->data;
 
 	pr_debug("entry, type 0x%x, reason 0x%x\n", ntf->type, ntf->reason);
 
+	conn_info = ndev->conn_info_by_conn_id[NCI_STATIC_RF_CONN_ID];
+	if (!conn_info)
+		return;
+
 	/* drop tx data queue */
 	skb_queue_purge(&ndev->tx_q);
 
@@ -676,7 +689,8 @@ static void nci_rf_deactivate_ntf_packet(struct nci_dev *ndev,
 
 	/* complete the data exchange transaction, if exists */
 	if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
-		nci_data_exchange_complete(ndev, NULL, -EIO);
+		nci_data_exchange_complete(ndev, NULL, NCI_STATIC_RF_CONN_ID,
+					   -EIO);
 
 	switch (ntf->type) {
 	case NCI_DEACTIVATE_TYPE_IDLE_MODE:
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index 041de51..ff8721e 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -140,13 +140,27 @@ static void nci_rf_disc_map_rsp_packet(struct nci_dev *ndev,
 
 static void nci_rf_disc_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
+	struct nci_conn_info    *conn_info;
 	__u8 status = skb->data[0];
 
 	pr_debug("status 0x%x\n", status);
 
-	if (status == NCI_STATUS_OK)
+	if (status == NCI_STATUS_OK) {
 		atomic_set(&ndev->state, NCI_DISCOVERY);
+		if (!ndev->conn_info_by_conn_id[NCI_STATIC_RF_CONN_ID]) {
+			conn_info = devm_kzalloc(&ndev->nfc_dev->dev,
+						 sizeof(struct nci_conn_info),
+						 GFP_KERNEL);
+			if (!conn_info) {
+				status = NCI_STATUS_REJECTED;
+				goto exit;
+			}
+			ndev->conn_info_by_conn_id[NCI_STATIC_RF_CONN_ID] =
+								conn_info;
+		}
+	}
 
+exit:
 	nci_req_complete(ndev, status);
 }
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
