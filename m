From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 01/35] nfc: st-nci: Align st-nci driver with other nfc driver
Date: Mon, 26 Oct 2015 07:49:41 +0100
Message-ID: <1445842215-28403-2-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Align st-nci driver with or nfc driver:
- Remove st-nci_ prefix
- Merge se.h in st-nci.h

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/core.c   |  1 -
 drivers/nfc/st-nci/se.c     |  1 -
 drivers/nfc/st-nci/se.h     | 61 ---------------------------------------------
 drivers/nfc/st-nci/st-nci.h | 40 ++++++++++++++++++++++++++++-
 4 files changed, 39 insertions(+), 64 deletions(-)
 delete mode 100644 drivers/nfc/st-nci/se.h

diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
index c419d39..96997e6 100644
--- a/drivers/nfc/st-nci/core.c
+++ b/drivers/nfc/st-nci/core.c
@@ -24,7 +24,6 @@
 #include <linux/delay.h>
 
 #include "st-nci.h"
-#include "st-nci_se.h"
 
 #define DRIVER_DESC "NCI NFC driver for ST_NCI"
 
diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index c742ef6..4acb945 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -23,7 +23,6 @@
 #include <net/nfc/nci_core.h>
 
 #include "st-nci.h"
-#include "st-nci_se.h"
 
 struct st_nci_pipe_info {
 	u8 pipe_state;
diff --git a/drivers/nfc/st-nci/se.h b/drivers/nfc/st-nci/se.h
deleted file mode 100644
index ea66e87..0000000
--- a/drivers/nfc/st-nci/se.h
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- * Secure Element Driver for STMicroelectronics NFC NCI Chip
- *
- * Copyright (C) 2014-2015 STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef __LOCAL_ST_NCI_SE_H_
-#define __LOCAL_ST_NCI_SE_H_
-
-/*
- * ref ISO7816-3 chap 8.1. the initial character TS is followed by a
- * sequence of at most 32 characters.
- */
-#define ST_NCI_ESE_MAX_LENGTH	33
-#define ST_NCI_HCI_HOST_ID_ESE	0xc0
-
-struct st_nci_se_info {
-	u8 atr[ST_NCI_ESE_MAX_LENGTH];
-	struct completion req_completion;
-
-	struct timer_list bwi_timer;
-	int wt_timeout; /* in msecs */
-	bool bwi_active;
-
-	struct timer_list se_active_timer;
-	bool se_active;
-
-	bool xch_error;
-
-	se_io_cb_t cb;
-	void *cb_context;
-};
-
-int st_nci_se_init(struct nci_dev *ndev);
-void st_nci_se_deinit(struct nci_dev *ndev);
-
-int st_nci_discover_se(struct nci_dev *ndev);
-int st_nci_enable_se(struct nci_dev *ndev, u32 se_idx);
-int st_nci_disable_se(struct nci_dev *ndev, u32 se_idx);
-int st_nci_se_io(struct nci_dev *ndev, u32 se_idx,
-		u8 *apdu, size_t apdu_length,
-		se_io_cb_t cb, void *cb_context);
-int st_nci_hci_load_session(struct nci_dev *ndev);
-void st_nci_hci_event_received(struct nci_dev *ndev, u8 pipe,
-			u8 event, struct sk_buff *skb);
-void st_nci_hci_cmd_received(struct nci_dev *ndev, u8 pipe, u8 cmd,
-			struct sk_buff *skb);
-
-
-#endif /* __LOCAL_ST_NCI_SE_H_ */
diff --git a/drivers/nfc/st-nci/st-nci.h b/drivers/nfc/st-nci/st-nci.h
index 850a239..5d3f4d9 100644
--- a/drivers/nfc/st-nci/st-nci.h
+++ b/drivers/nfc/st-nci/st-nci.h
@@ -19,7 +19,6 @@
 #ifndef __LOCAL_ST_NCI_H_
 #define __LOCAL_ST_NCI_H_
 
-#include "st-nci_se.h"
 #include "ndlc.h"
 
 /* Define private flags: */
@@ -28,6 +27,13 @@
 #define ST_NCI_CORE_PROP                0x01
 #define ST_NCI_SET_NFC_MODE             0x02
 
+/*
+ * ref ISO7816-3 chap 8.1. the initial character TS is followed by a
+ * sequence of at most 32 characters.
+ */
+#define ST_NCI_ESE_MAX_LENGTH	33
+#define ST_NCI_HCI_HOST_ID_ESE	0xc0
+
 struct nci_mode_set_cmd {
 	u8 cmd_type;
 	u8 mode;
@@ -37,6 +43,23 @@ struct nci_mode_set_rsp {
 	u8 status;
 } __packed;
 
+struct st_nci_se_info {
+	u8 atr[ST_NCI_ESE_MAX_LENGTH];
+	struct completion req_completion;
+
+	struct timer_list bwi_timer;
+	int wt_timeout; /* in msecs */
+	bool bwi_active;
+
+	struct timer_list se_active_timer;
+	bool se_active;
+
+	bool xch_error;
+
+	se_io_cb_t cb;
+	void *cb_context;
+};
+
 struct st_nci_info {
 	struct llt_ndlc *ndlc;
 	unsigned long flags;
@@ -47,4 +70,19 @@ void st_nci_remove(struct nci_dev *ndev);
 int st_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
 		int phy_tailroom);
 
+int st_nci_se_init(struct nci_dev *ndev);
+void st_nci_se_deinit(struct nci_dev *ndev);
+
+int st_nci_discover_se(struct nci_dev *ndev);
+int st_nci_enable_se(struct nci_dev *ndev, u32 se_idx);
+int st_nci_disable_se(struct nci_dev *ndev, u32 se_idx);
+int st_nci_se_io(struct nci_dev *ndev, u32 se_idx,
+		u8 *apdu, size_t apdu_length,
+		se_io_cb_t cb, void *cb_context);
+int st_nci_hci_load_session(struct nci_dev *ndev);
+void st_nci_hci_event_received(struct nci_dev *ndev, u8 pipe,
+			u8 event, struct sk_buff *skb);
+void st_nci_hci_cmd_received(struct nci_dev *ndev, u8 pipe, u8 cmd,
+			struct sk_buff *skb);
+
 #endif /* __LOCAL_ST_NCI_H_ */
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
