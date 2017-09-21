From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v9 3/7] mailbox: qcom: Move the apcs struct into a separate header
Date: Thu, 21 Sep 2017 19:49:36 +0300
Message-ID: <20170921164940.20343-4-georgi.djakov@linaro.org>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170921164940.20343-1-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

Move the structure shared by the APCS IPC device and its subdevices
into a separate header file.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 11 +----------
 include/linux/mailbox/qcom-apcs.h       | 34 +++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 10 deletions(-)
 create mode 100644 include/linux/mailbox/qcom-apcs.h

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index fd9055eacf42..50c7f6c54b74 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -20,16 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/mailbox_controller.h>
-
-#define QCOM_APCS_IPC_BITS	32
-
-struct qcom_apcs_ipc {
-	struct mbox_controller mbox;
-	struct mbox_chan mbox_chans[QCOM_APCS_IPC_BITS];
-
-	struct regmap *regmap;
-	unsigned long offset;
-};
+#include <linux/mailbox/qcom-apcs.h>
 
 static const struct regmap_config apcs_regmap_config = {
 	.reg_bits = 32,
diff --git a/include/linux/mailbox/qcom-apcs.h b/include/linux/mailbox/qcom-apcs.h
new file mode 100644
index 000000000000..7e48fa2372dc
--- /dev/null
+++ b/include/linux/mailbox/qcom-apcs.h
@@ -0,0 +1,34 @@
+/*
+ * Copyright (c) 2017, Linaro Limited
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _LINUX_QCOM_APCS_H_
+#define _LINUX_QCOM_APCS_H_
+
+#define QCOM_APCS_IPC_BITS	32
+
+/**
+ * struct qcom_apcs_ipc - APCS shared struct
+ *
+ * @mbox: mailbox controller
+ * @mbox_chans: array of the available communication channels
+ * @offset: mailbox IPC register offset
+ * @regmap: register map used to access APCS registers
+ */
+struct qcom_apcs_ipc {
+	struct mbox_controller mbox;
+	struct mbox_chan mbox_chans[QCOM_APCS_IPC_BITS];
+	unsigned long offset;
+	struct regmap *regmap;
+};
+
+#endif /* _LINUX_QCOM_APCS_H_ */
