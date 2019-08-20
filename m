From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 20/49] ath11k: add dp_tx.h
Date: Tue, 20 Aug 2019 18:47:46 +0300
Message-ID: <1566316095-27507-21-git-send-email-kvalo@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-1-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

---
 drivers/net/wireless/ath/ath11k/dp_tx.h | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
new file mode 100644
index 000000000000..0a1f151aad8a
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef ATH11K_DP_TX_H
+#define ATH11K_DP_TX_H
+
+#include "core.h"
+#include "hal_tx.h"
+
+struct ath11k_dp_htt_wbm_tx_status {
+	u32 msdu_id;
+	bool acked;
+	int ack_rssi;
+};
+
+int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
+int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
+		 struct sk_buff *skb);
+void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
+int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
+			      enum hal_reo_cmd_type type,
+			      struct ath11k_hal_reo_cmd *cmd,
+			      void (*func)(struct ath11k_dp *, void *,
+					   enum hal_reo_cmd_status));
+
+int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask);
+int
+ath11k_dp_tx_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
+				   struct htt_ext_stats_cfg_params *cfg_params,
+				   u64 cookie);
+int ath11k_dp_tx_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset);
+
+int ath11k_dp_tx_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
+				     int mac_id, enum hal_ring_type ring_type,
+				     int rx_buf_size,
+				     struct htt_rx_ring_tlv_filter *tlv_filter);
+
+#endif
