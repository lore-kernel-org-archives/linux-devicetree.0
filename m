From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 41/49] ath11k: add testmode.h
Date: Tue, 20 Aug 2019 18:48:07 +0300
Message-ID: <1566316095-27507-42-git-send-email-kvalo@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-1-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

---
 drivers/net/wireless/ath/ath11k/testmode.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.h b/drivers/net/wireless/ath/ath11k/testmode.h
new file mode 100644
index 000000000000..303091b7fe78
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/testmode.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ */
+
+#include "core.h"
+
+#ifdef CONFIG_NL80211_TESTMODE
+
+bool ath11k_tm_event_wmi(struct ath11k *ar, u32 cmd_id, struct sk_buff *skb);
+int ath11k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		  void *data, int len);
+
+#else
+
+static inline bool ath11k_tm_event_wmi(struct ath11k *ar, u32 cmd_id,
+				       struct sk_buff *skb)
+{
+	return false;
+}
+
+static inline int ath11k_tm_cmd(struct ieee80211_hw *hw,
+				struct ieee80211_vif *vif,
+				void *data, int len)
+{
+	return 0;
+}
+
+#endif
