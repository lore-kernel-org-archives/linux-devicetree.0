From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 27/49] ath11k: add hal_tx.h
Date: Tue, 20 Aug 2019 18:47:53 +0300
Message-ID: <1566316095-27507-28-git-send-email-kvalo@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-1-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

---
 drivers/net/wireless/ath/ath11k/hal_tx.h | 80 ++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.h b/drivers/net/wireless/ath/ath11k/hal_tx.h
new file mode 100644
index 000000000000..3b12dfda7423
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef ATH11K_HAL_TX_H
+#define ATH11K_HAL_TX_H
+
+#include "hal_desc.h"
+
+#define HAL_TX_ADDRX_EN			1
+#define HAL_TX_ADDRY_EN			2
+
+#define HAL_TX_ADDR_SEARCH_INDEX	0
+#define HAL_TX_ADDR_SEARCH_DEFAULT	1
+
+struct hal_tx_info {
+	u16 meta_data_flags; /* %HAL_TCL_DATA_CMD_INFO0_META_ */
+	u8 ring_id;
+	u32 desc_id;
+	enum hal_tcl_desc_type type;
+	enum hal_tcl_encap_type encap_type;
+	dma_addr_t paddr;
+	u32 data_len;
+	u32 pkt_offset;
+	enum hal_encrypt_type encrypt_type;
+	u32 flags0; /* %HAL_TCL_DATA_CMD_INFO1_ */
+	u32 flags1; /* %HAL_TCL_DATA_CMD_INFO2_ */
+	u16 addr_search_flags; /* %HAL_TCL_DATA_CMD_INFO0_ADDR(X/Y)_ */
+	u16 bss_ast_hash;
+	u8 tid;
+	u8 search_type; /* %HAL_TX_ADDR_SEARCH_ */
+	u8 lmac_id;
+	u8 dscp_tid_tbl_idx;
+};
+
+/* TODO: Check if the actual desc macros can be used instead */
+#define HAL_TX_STATUS_FLAGS_FIRST_MSDU		BIT(0)
+#define HAL_TX_STATUS_FLAGS_LAST_MSDU		BIT(1)
+#define HAL_TX_STATUS_FLAGS_MSDU_IN_AMSDU	BIT(2)
+#define HAL_TX_STATUS_FLAGS_RATE_STATS_VALID	BIT(3)
+#define HAL_TX_STATUS_FLAGS_RATE_LDPC		BIT(4)
+#define HAL_TX_STATUS_FLAGS_RATE_STBC		BIT(5)
+#define HAL_TX_STATUS_FLAGS_OFDMA		BIT(6)
+
+#define HAL_TX_STATUS_DESC_LEN		sizeof(struct hal_wbm_release_ring)
+
+/* Tx status parsed from srng desc */
+struct hal_tx_status {
+	enum hal_wbm_rel_src_module buf_rel_source;
+	u32 desc_id;
+	enum hal_wbm_tqm_rel_reason status;
+	u8 ack_rssi;
+	enum hal_tx_rate_stats_bw bw;
+	enum hal_tx_rate_stats_pkt_type pkt_type;
+	enum hal_tx_rate_stats_sgi sgi;
+	u8 mcs;
+	u16 num_tones_in_ru;
+	u32 flags; /* %HAL_TX_STATUS_FLAGS_ */
+	u32 tsf;
+	u32 ppdu_id;
+	u8 try_cnt;
+	u8 tid;
+	u16 peer_id;
+};
+
+void ath11k_hal_tx_cmd_desc_setup(struct ath11k_base *ab, void *cmd,
+				  struct hal_tx_info *ti);
+void ath11k_hal_tx_desc_sync(void *tx_desc_cached, void *hw_desc);
+void ath11k_hal_tx_status_parse(struct ath11k_base *ab,
+				struct hal_wbm_release_ring *desc,
+				struct hal_tx_status *ts);
+void ath11k_hal_tx_status_desc_sync(void *hw_desc, void *local_desc);
+void ath11k_hal_tx_set_dscp_tid_map(struct ath11k_base *ab, int id);
+int ath11k_hal_reo_cmd_send(struct ath11k_base *ab, struct hal_srng *srng,
+			    enum hal_reo_cmd_type type,
+			    struct ath11k_hal_reo_cmd *cmd);
+void ath11k_hal_tx_init_data_ring(struct ath11k_base *ab,
+				  struct hal_srng *srng);
+#endif
