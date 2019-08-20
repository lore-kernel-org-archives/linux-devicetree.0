From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 18/49] ath11k: add dp_rx.h
Date: Tue, 20 Aug 2019 18:47:44 +0300
Message-ID: <1566316095-27507-19-git-send-email-kvalo@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-1-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

---
 drivers/net/wireless/ath/ath11k/dp_rx.h | 84 +++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
new file mode 100644
index 000000000000..0a243ec5eb16
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ */
+#ifndef ATH11K_DP_RX_H
+#define ATH11K_DP_RX_H
+
+#include "core.h"
+#include "rx_desc.h"
+#include "debug.h"
+
+#define DP_RX_MPDU_ERR_FCS			BIT(0)
+#define DP_RX_MPDU_ERR_DECRYPT			BIT(1)
+#define DP_RX_MPDU_ERR_TKIP_MIC			BIT(2)
+#define DP_RX_MPDU_ERR_AMSDU_ERR		BIT(3)
+#define DP_RX_MPDU_ERR_OVERFLOW			BIT(4)
+#define DP_RX_MPDU_ERR_MSDU_LEN			BIT(5)
+#define DP_RX_MPDU_ERR_MPDU_LEN			BIT(6)
+#define DP_RX_MPDU_ERR_UNENCRYPTED_FRAME	BIT(7)
+
+enum dp_rx_decap_type {
+	DP_RX_DECAP_TYPE_RAW,
+	DP_RX_DECAP_TYPE_NATIVE_WIFI,
+	DP_RX_DECAP_TYPE_ETHERNET2_DIX,
+	DP_RX_DECAP_TYPE_8023,
+};
+
+struct ath11k_dp_amsdu_subframe_hdr {
+	u8 dst[ETH_ALEN];
+	u8 src[ETH_ALEN];
+	__be16 len;
+} __packed;
+
+struct ath11k_dp_rfc1042_hdr {
+	u8 llc_dsap;
+	u8 llc_ssap;
+	u8 llc_ctrl;
+	u8 snap_oui[3];
+	__be16 snap_type;
+} __packed;
+
+int ath11k_dp_rx_ampdu_start(struct ath11k *ar,
+			     struct ieee80211_ampdu_params *params);
+int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
+			    struct ieee80211_ampdu_params *params);
+void ath11k_peer_rx_tid_cleanup(struct ath11k *ar, struct ath11k_peer *peer);
+int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
+			     u8 tid, u32 ba_win_sz, u16 ssn);
+void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
+				       struct sk_buff *skb);
+int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int pdev_idx);
+void ath11k_dp_rx_pdev_free(struct ath11k_base *ab, int pdev_idx);
+void ath11k_dp_reo_cmd_list_cleanup(struct ath11k_base *ab);
+void ath11k_dp_process_reo_status(struct ath11k_base *ab);
+int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget);
+int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
+				 struct napi_struct *napi, int budget);
+int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
+			     int budget);
+int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
+			 struct napi_struct *napi, struct sk_buff_head *pending_q,
+			 int budget);
+int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
+			       struct dp_rxdma_ring *rx_ring,
+			       int req_entries,
+			       enum hal_rx_buf_return_buf_manager mgr,
+			       gfp_t gfp);
+int ath11k_dp_htt_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
+			   int (*iter)(struct ath11k_base *ar, u16 tag, u16 len,
+				       const void *ptr, void *data),
+			   void *data);
+int ath11k_dp_rx_process_mon_rings(struct ath11k_base *ab, int mac_id,
+				   struct napi_struct *napi, int budget);
+int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
+				    struct napi_struct *napi, int budget);
+int ath11k_dp_rx_mon_status_bufs_replenish(struct ath11k_base *ab, int mac_id,
+					   struct dp_rxdma_ring *rx_ring,
+					   int req_entries,
+					   enum hal_rx_buf_return_buf_manager mgr,
+					   gfp_t gfp);
+int ath11k_dp_rx_pdev_mon_detach(struct ath11k *ar);
+int ath11k_dp_rx_pdev_mon_attach(struct ath11k *ar);
+
+#endif /* ATH11K_DP_RX_H */
