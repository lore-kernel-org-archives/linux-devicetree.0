Return-Path: <SRS0=d0Jw=VU=linaro.org=georgi.djakov@kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v5 3/5] interconnect: qcom: Add interconnect SMD over SMD driver
Date: Tue, 23 Jul 2019 17:23:37 +0300
Message-Id: <20190723142339.27772-4-georgi.djakov@linaro.org>
In-Reply-To: <20190723142339.27772-1-georgi.djakov@linaro.org>
References: <20190723142339.27772-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, georgi.djakov@linaro.org
Cc: vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On some Qualcomm SoCs, there is a remote processor, which controls some of
the Network-On-Chip interconnect resources. Other CPUs express their needs
by communicating with this processor. Add a driver to handle communication
with this remote processor.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---

v5:
- Use the more succinct return !!icc_smd_rpm;
- Picked Bjorn's r-b.

v4:
- Hide the driver from config menu. It will be selected by other driver.
- Add remove() function to zero out the rpm handle.

v3:
- New patch.

 drivers/interconnect/qcom/Kconfig   |  3 ++
 drivers/interconnect/qcom/Makefile  |  2 +
 drivers/interconnect/qcom/smd-rpm.c | 77 +++++++++++++++++++++++++++++
 drivers/interconnect/qcom/smd-rpm.h | 15 ++++++
 4 files changed, 97 insertions(+)
 create mode 100644 drivers/interconnect/qcom/smd-rpm.c
 create mode 100644 drivers/interconnect/qcom/smd-rpm.h

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index d5e70ebc2410..03fd67173494 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -12,3 +12,6 @@ config INTERCONNECT_QCOM_SDM845
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm845-based
 	  platforms.
+
+config INTERCONNECT_QCOM_SMD_RPM
+	tristate
diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
index 1c1cea690f92..a600cf6cc272 100644
--- a/drivers/interconnect/qcom/Makefile
+++ b/drivers/interconnect/qcom/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 qnoc-sdm845-objs			:= sdm845.o
+icc-smd-rpm-objs			:= smd-rpm.o
 
 obj-$(CONFIG_INTERCONNECT_QCOM_SDM845) += qnoc-sdm845.o
+obj-$(CONFIG_INTERCONNECT_QCOM_SMD_RPM) += icc-smd-rpm.o
diff --git a/drivers/interconnect/qcom/smd-rpm.c b/drivers/interconnect/qcom/smd-rpm.c
new file mode 100644
index 000000000000..dc8ff8d133a9
--- /dev/null
+++ b/drivers/interconnect/qcom/smd-rpm.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RPM over SMD communication wrapper for interconnects
+ *
+ * Copyright (C) 2019 Linaro Ltd
+ * Author: Georgi Djakov <georgi.djakov@linaro.org>
+ */
+
+#include <linux/interconnect-provider.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/soc/qcom/smd-rpm.h>
+
+#include "smd-rpm.h"
+
+#define RPM_KEY_BW		0x00007762
+
+static struct qcom_smd_rpm *icc_smd_rpm;
+
+struct icc_rpm_smd_req {
+	__le32 key;
+	__le32 nbytes;
+	__le32 value;
+};
+
+bool qcom_icc_rpm_smd_available(void)
+{
+	return !!icc_smd_rpm;
+}
+EXPORT_SYMBOL_GPL(qcom_icc_rpm_smd_available);
+
+int qcom_icc_rpm_smd_send(int ctx, int rsc_type, int id, u32 val)
+{
+	struct icc_rpm_smd_req req = {
+		.key = cpu_to_le32(RPM_KEY_BW),
+		.nbytes = cpu_to_le32(sizeof(u32)),
+		.value = cpu_to_le32(val),
+	};
+
+	return qcom_rpm_smd_write(icc_smd_rpm, ctx, rsc_type, id, &req,
+				  sizeof(req));
+}
+EXPORT_SYMBOL_GPL(qcom_icc_rpm_smd_send);
+
+static int qcom_icc_rpm_smd_remove(struct platform_device *pdev)
+{
+	icc_smd_rpm = NULL;
+
+	return 0;
+}
+
+static int qcom_icc_rpm_smd_probe(struct platform_device *pdev)
+{
+	icc_smd_rpm = dev_get_drvdata(pdev->dev.parent);
+
+	if (!icc_smd_rpm) {
+		dev_err(&pdev->dev, "unable to retrieve handle to RPM\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static struct platform_driver qcom_interconnect_rpm_smd_driver = {
+	.driver = {
+		.name		= "icc_smd_rpm",
+	},
+	.probe = qcom_icc_rpm_smd_probe,
+	.remove = qcom_icc_rpm_smd_remove,
+};
+module_platform_driver(qcom_interconnect_rpm_smd_driver);
+MODULE_AUTHOR("Georgi Djakov <georgi.djakov@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm SMD RPM interconnect proxy driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:icc_smd_rpm");
diff --git a/drivers/interconnect/qcom/smd-rpm.h b/drivers/interconnect/qcom/smd-rpm.h
new file mode 100644
index 000000000000..ca9d0327b8ac
--- /dev/null
+++ b/drivers/interconnect/qcom/smd-rpm.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019, Linaro Ltd.
+ * Author: Georgi Djakov <georgi.djakov@linaro.org>
+ */
+
+#ifndef __DRIVERS_INTERCONNECT_QCOM_SMD_RPM_H
+#define __DRIVERS_INTERCONNECT_QCOM_SMD_RPM_H
+
+#include <linux/soc/qcom/smd-rpm.h>
+
+bool qcom_icc_rpm_smd_available(void);
+int qcom_icc_rpm_smd_send(int ctx, int rsc_type, int id, u32 val);
+
+#endif
