From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 42/49] ath11k: add testmode_i.h
Date: Tue, 20 Aug 2019 18:48:08 +0300
Message-ID: <1566316095-27507-43-git-send-email-kvalo@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-1-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

---
 drivers/net/wireless/ath/ath11k/testmode_i.h | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/testmode_i.h b/drivers/net/wireless/ath/ath11k/testmode_i.h
new file mode 100644
index 000000000000..96ae22b558af
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/testmode_i.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ */
+
+/* "API" level of the ath11k testmode interface. Bump it after every
+ * incompatible interface change.
+ */
+#define ATH11K_TESTMODE_VERSION_MAJOR 1
+
+/* Bump this after every _compatible_ interface change, for example
+ * addition of a new command or an attribute.
+ */
+#define ATH11K_TESTMODE_VERSION_MINOR 0
+
+#define ATH11K_TM_DATA_MAX_LEN		5000
+
+enum ath11k_tm_attr {
+	__ATH11K_TM_ATTR_INVALID		= 0,
+	ATH11K_TM_ATTR_CMD			= 1,
+	ATH11K_TM_ATTR_DATA			= 2,
+	ATH11K_TM_ATTR_WMI_CMDID		= 3,
+	ATH11K_TM_ATTR_VERSION_MAJOR		= 4,
+	ATH11K_TM_ATTR_VERSION_MINOR		= 5,
+	ATH11K_TM_ATTR_WMI_OP_VERSION		= 6,
+
+	/* keep last */
+	__ATH11K_TM_ATTR_AFTER_LAST,
+	ATH11K_TM_ATTR_MAX		= __ATH11K_TM_ATTR_AFTER_LAST - 1,
+};
+
+/* All ath11k testmode interface commands specified in
+ * ATH11K_TM_ATTR_CMD
+ */
+enum ath11k_tm_cmd {
+	/* Returns the supported ath11k testmode interface version in
+	 * ATH11K_TM_ATTR_VERSION. Always guaranteed to work. User space
+	 * uses this to verify it's using the correct version of the
+	 * testmode interface
+	 */
+	ATH11K_TM_CMD_GET_VERSION = 0,
+
+	/* The command used to transmit a WMI command to the firmware and
+	 * the event to receive WMI events from the firmware. Without
+	 * struct wmi_cmd_hdr header, only the WMI payload. Command id is
+	 * provided with ATH11K_TM_ATTR_WMI_CMDID and payload in
+	 * ATH11K_TM_ATTR_DATA.
+	 */
+	ATH11K_TM_CMD_WMI = 1,
+};
