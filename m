From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v7 3/3] mailbox: Introduce Qualcomm APCS IPC driver
Date: Sat, 27 May 2017 16:14:04 -0700
Message-ID: <20170527231404.7632-3-bjorn.andersson@linaro.org>
References: <20170527231404.7632-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170527231404.7632-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This implements a driver that exposes the IPC bits found in the APCS
Global block in various Qualcomm platforms. The bits are used to signal
inter-processor communication signals from the application CPU to other
masters.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v6:
- Add COMPILE_TEST
- Drop "dev" from apcs_ipc struct
- Track only the IPC register instead of base and offset

 drivers/mailbox/Kconfig                 |   8 ++
 drivers/mailbox/Makefile                |   2 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 129 ++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/mailbox/qcom-apcs-ipc-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ee1a3d9147ef..c5731e5e3c6c 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -124,6 +124,14 @@ config MAILBOX_TEST
 	  Test client to help with testing new Controller driver
 	  implementations.
 
+config QCOM_APCS_IPC
+	tristate "Qualcomm APCS IPC driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  Say y here to enable support for the APCS IPC mailbox driver,
+	  providing an interface for invoking the inter-process communication
+	  signals from the application processor to other masters.
+
 config TEGRA_HSP_MBOX
 	bool "Tegra HSP (Hardware Synchronization Primitives) Driver"
 	depends on ARCH_TEGRA_186_SOC
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index e2bcb03cd35b..d54e41206e17 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -32,4 +32,6 @@ obj-$(CONFIG_BCM_PDC_MBOX)	+= bcm-pdc-mailbox.o
 
 obj-$(CONFIG_BCM_FLEXRM_MBOX)	+= bcm-flexrm-mailbox.o
 
+obj-$(CONFIG_QCOM_APCS_IPC)	+= qcom-apcs-ipc-mailbox.o
+
 obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
new file mode 100644
index 000000000000..9924c6d7f05d
--- /dev/null
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -0,0 +1,129 @@
+/*
+ * Copyright (c) 2017, Linaro Ltd
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
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/mailbox_controller.h>
+
+#define QCOM_APCS_IPC_BITS	32
+
+struct qcom_apcs_ipc {
+	struct mbox_controller mbox;
+	struct mbox_chan mbox_chans[QCOM_APCS_IPC_BITS];
+
+	void __iomem *reg;
+	unsigned long offset;
+};
+
+static int qcom_apcs_ipc_send_data(struct mbox_chan *chan, void *data)
+{
+	struct qcom_apcs_ipc *apcs = container_of(chan->mbox,
+						  struct qcom_apcs_ipc, mbox);
+	unsigned long idx = (unsigned long)chan->con_priv;
+
+	writel(BIT(idx), apcs->reg);
+
+	return 0;
+}
+
+static const struct mbox_chan_ops qcom_apcs_ipc_ops = {
+	.send_data = qcom_apcs_ipc_send_data,
+};
+
+static int qcom_apcs_ipc_probe(struct platform_device *pdev)
+{
+	struct qcom_apcs_ipc *apcs;
+	struct resource *res;
+	unsigned long offset;
+	void __iomem *base;
+	unsigned long i;
+	int ret;
+
+	apcs = devm_kzalloc(&pdev->dev, sizeof(*apcs), GFP_KERNEL);
+	if (!apcs)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	offset = (unsigned long)of_device_get_match_data(&pdev->dev);
+
+	apcs->reg = base + offset;
+
+	/* Initialize channel identifiers */
+	for (i = 0; i < ARRAY_SIZE(apcs->mbox_chans); i++)
+		apcs->mbox_chans[i].con_priv = (void *)i;
+
+	apcs->mbox.dev = &pdev->dev;
+	apcs->mbox.ops = &qcom_apcs_ipc_ops;
+	apcs->mbox.chans = apcs->mbox_chans;
+	apcs->mbox.num_chans = ARRAY_SIZE(apcs->mbox_chans);
+
+	ret = mbox_controller_register(&apcs->mbox);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register APCS IPC controller\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, apcs);
+
+	return 0;
+}
+
+static int qcom_apcs_ipc_remove(struct platform_device *pdev)
+{
+	struct qcom_apcs_ipc *apcs = platform_get_drvdata(pdev);
+
+	mbox_controller_unregister(&apcs->mbox);
+
+	return 0;
+}
+
+/* .data is the offset of the ipc register within the global block */
+static const struct of_device_id qcom_apcs_ipc_of_match[] = {
+	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = (void *)8 },
+	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = (void *)16 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
+
+static struct platform_driver qcom_apcs_ipc_driver = {
+	.probe = qcom_apcs_ipc_probe,
+	.remove = qcom_apcs_ipc_remove,
+	.driver = {
+		.name = "qcom_apcs_ipc",
+		.of_match_table = qcom_apcs_ipc_of_match,
+	},
+};
+
+static int __init qcom_apcs_ipc_init(void)
+{
+	return platform_driver_register(&qcom_apcs_ipc_driver);
+}
+postcore_initcall(qcom_apcs_ipc_init);
+
+static void __exit qcom_apcs_ipc_exit(void)
+{
+	platform_driver_unregister(&qcom_apcs_ipc_driver);
+}
+module_exit(qcom_apcs_ipc_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Qualcomm APCS IPC driver");
-- 
2.12.0
