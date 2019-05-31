From: Alex Elder <elder@linaro.org>
Subject: [PATCH v2 09/17] soc: qcom: ipa: IPA interface to GSI
Date: Thu, 30 May 2019 22:53:40 -0500
Message-ID: <20190531035348.7194-10-elder@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190531035348.7194-1-elder@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, arnd@arndb.de, bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org
Cc: evgreen@chromium.org, benchan@google.com, ejcaruso@google.com, cpratapa@codeaurora.org, syadagir@codeaurora.org, subashab@codeaurora.org, abhishek.esse@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch provides interface functions supplied by the IPA layer
that are called from the GSI layer.  One function is called when a
GSI transaction has completed.  The others allow the GSI layer to
inform the IPA layer when the hardware has been told it has new TREs
to execute, and when the hardware has indicated transactions have
completed.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_gsi.c | 48 ++++++++++++++++++++++++++++++++++++++
 drivers/net/ipa/ipa_gsi.h | 49 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 drivers/net/ipa/ipa_gsi.c
 create mode 100644 drivers/net/ipa/ipa_gsi.h

diff --git a/drivers/net/ipa/ipa_gsi.c b/drivers/net/ipa/ipa_gsi.c
new file mode 100644
index 000000000000..7f8d74688c1e
--- /dev/null
+++ b/drivers/net/ipa/ipa_gsi.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2019 Linaro Ltd.
+ */
+
+#include <linux/types.h>
+
+#include "gsi_trans.h"
+#include "ipa.h"
+#include "ipa_endpoint.h"
+
+void ipa_gsi_trans_complete(struct gsi_trans *trans)
+{
+	struct ipa *ipa = container_of(trans->gsi, struct ipa, gsi);
+	struct ipa_endpoint *endpoint;
+
+	endpoint = ipa->endpoint_map[trans->channel_id];
+	if (endpoint == ipa->command_endpoint)
+		return;		/* Nothing to do for commands */
+
+	if (endpoint->toward_ipa)
+		ipa_endpoint_skb_tx_complete(trans);
+	else
+		ipa_endpoint_rx_complete(trans);
+}
+
+void ipa_gsi_channel_tx_queued(struct gsi *gsi, u32 channel_id, u32 count,
+			       u32 byte_count)
+{
+	struct ipa *ipa = container_of(gsi, struct ipa, gsi);
+	struct ipa_endpoint *endpoint;
+
+	endpoint = ipa->endpoint_map[channel_id];
+	if (endpoint->netdev)
+		netdev_sent_queue(endpoint->netdev, byte_count);
+}
+
+void ipa_gsi_channel_tx_completed(struct gsi *gsi, u32 channel_id, u32 count,
+				  u32 byte_count)
+{
+	struct ipa *ipa = container_of(gsi, struct ipa, gsi);
+	struct ipa_endpoint *endpoint;
+
+	endpoint = ipa->endpoint_map[channel_id];
+	if (endpoint->netdev)
+		netdev_completed_queue(endpoint->netdev, count, byte_count);
+}
diff --git a/drivers/net/ipa/ipa_gsi.h b/drivers/net/ipa/ipa_gsi.h
new file mode 100644
index 000000000000..72adb520da40
--- /dev/null
+++ b/drivers/net/ipa/ipa_gsi.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2019 Linaro Ltd.
+ */
+#ifndef _IPA_GSI_TRANS_H_
+#define _IPA_GSI_TRANS_H_
+
+#include <linux/types.h>
+
+struct gsi_trans;
+
+/**
+ * ipa_gsi_trans_complete() - GSI transaction completion callback
+ * @gsi:	GSI pointer
+ * @trans:	Transaction that has completed
+ *
+ * This called from the GSI layer to notify the IPA layer that a
+ * transaction has completed.
+ */
+void ipa_gsi_trans_complete(struct gsi_trans *trans);
+
+/**
+ * ipa_gsi_channel_tx_queued() - GSI queued to hardware notification
+ * @gsi:	GSI pointer
+ * @channel_id:	Channel number
+ * @count:	Number of transactions queued
+ * @byte_count:	Number of bytes to transfer represented by transactions
+ *
+ * This called from the GSI layer to notify the IPA layer that some
+ * number of transactions have been queued to hardware for execution.
+ */
+void ipa_gsi_channel_tx_queued(struct gsi *gsi, u32 channel_id, u32 count,
+			       u32 byte_count);
+/**
+ * ipa_gsi_trans_complete() - GSI transaction completion callback
+ipa_gsi_channel_tx_completed()
+ * @gsi:	GSI pointer
+ * @channel_id:	Channel number
+ * @count:	Number of transactions completed since last report
+ * @byte_count:	Number of bytes transferred represented by transactions
+ *
+ * This called from the GSI layer to notify the IPA layer that the hardware
+ * has reported the completion of some number of transactions.
+ */
+void ipa_gsi_channel_tx_completed(struct gsi *gsi, u32 channel_id, u32 count,
+				  u32 byte_count);
+
+#endif /* _IPA_GSI_TRANS_H_ */
-- 
2.20.1
