From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 3/3] edac: sifive: Add EDAC platform driver for SiFive SoCs
Date: Mon, 15 Apr 2019 17:10:43 +0530
Message-ID: <1555328443-30874-4-git-send-email-yash.shah@sifive.com>
References: <1555328443-30874-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555328443-30874-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

This initial ver of EDAC driver supports:
- ECC event monitoring and reporting through the EDAC framework for SiFive
  L2 cache controller.

This driver registers for notifier events from the L2 cache controller
driver (arch/riscv/mm/sifive_l2_cache.c) for L2 ECC events

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/Kconfig         |   1 +
 drivers/edac/Kconfig       |   6 +++
 drivers/edac/Makefile      |   1 +
 drivers/edac/sifive_edac.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 129 insertions(+)
 create mode 100644 drivers/edac/sifive_edac.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb56c82..31999a6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -49,6 +49,7 @@ config RISCV
 	select GENERIC_IRQ_MULTI_HANDLER
 	select ARCH_HAS_PTE_SPECIAL
 	select HAVE_EBPF_JIT if 64BIT
+	select EDAC_SUPPORT
 
 config MMU
 	def_bool y
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 47eb4d1..3e05228 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -460,6 +460,12 @@ config EDAC_ALTERA_SDMMC
 	  Support for error detection and correction on the
 	  Altera SDMMC FIFO Memory for Altera SoCs.
 
+config EDAC_SIFIVE
+	bool "Sifive platform EDAC driver"
+	depends on EDAC=y && RISCV
+	help
+	  Support for error detection and correction on the SiFive SoCs.
+
 config EDAC_SYNOPSYS
 	tristate "Synopsys DDR Memory Controller"
 	depends on ARCH_ZYNQ || ARCH_ZYNQMP
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 89ad4a84..165ca65e 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_EDAC_OCTEON_PCI)		+= octeon_edac-pci.o
 obj-$(CONFIG_EDAC_THUNDERX)		+= thunderx_edac.o
 
 obj-$(CONFIG_EDAC_ALTERA)		+= altera_edac.o
+obj-$(CONFIG_EDAC_SIFIVE)		+= sifive_edac.o
 obj-$(CONFIG_EDAC_SYNOPSYS)		+= synopsys_edac.o
 obj-$(CONFIG_EDAC_XGENE)		+= xgene_edac.o
 obj-$(CONFIG_EDAC_TI)			+= ti_edac.o
diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
new file mode 100644
index 0000000..eb7a9b9
--- /dev/null
+++ b/drivers/edac/sifive_edac.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SiFive Platform EDAC Driver
+ *
+ * Copyright (C) 2018-2019 SiFive, Inc.
+ *
+ * This driver is partially based on octeon_edac-pc.c
+ *
+ */
+#include <linux/edac.h>
+#include <linux/platform_device.h>
+#include "edac_module.h"
+
+#define DRVNAME "sifive_edac"
+
+extern int register_sifive_l2_error_notifier(struct notifier_block *nb);
+extern int unregister_sifive_l2_error_notifier(struct notifier_block *nb);
+
+struct sifive_edac_priv {
+	struct notifier_block notifier;
+	struct edac_device_ctl_info *dci;
+};
+
+/**
+ * EDAC error callback
+ *
+ * @event: non-zero if unrecoverable.
+ */
+static
+int ecc_err_event(struct notifier_block *this, unsigned long event, void *ptr)
+{
+	const char *msg = (char *)ptr;
+	struct sifive_edac_priv *p;
+
+	p = container_of(this, struct sifive_edac_priv, notifier);
+
+	if (event)
+		edac_device_handle_ue(p->dci, 0, 0, msg);
+	else
+		edac_device_handle_ce(p->dci, 0, 0, msg);
+
+	return NOTIFY_STOP;
+}
+
+static int ecc_register(struct platform_device *pdev)
+{
+	struct sifive_edac_priv *p;
+
+	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	p->notifier.notifier_call = ecc_err_event;
+	platform_set_drvdata(pdev, p);
+
+	p->dci = edac_device_alloc_ctl_info(sizeof(*p), "sifive_ecc", 1,
+					    "sifive_ecc", 1, 1, NULL, 0,
+					    edac_device_alloc_index());
+	if (IS_ERR(p->dci))
+		return PTR_ERR(p->dci);
+
+	p->dci->dev = &pdev->dev;
+	p->dci->mod_name = "Sifive ECC Manager";
+	p->dci->ctl_name = dev_name(&pdev->dev);
+	p->dci->dev_name = dev_name(&pdev->dev);
+
+	if (edac_device_add_device(p->dci)) {
+		dev_err(p->dci->dev, "failed to register with EDAC core\n");
+		goto err;
+	}
+
+	register_sifive_l2_error_notifier(&p->notifier);
+
+	return 0;
+
+err:
+	edac_device_free_ctl_info(p->dci);
+
+	return -ENXIO;
+}
+
+static int ecc_unregister(struct platform_device *pdev)
+{
+	struct sifive_edac_priv *p = platform_get_drvdata(pdev);
+
+	unregister_sifive_l2_error_notifier(&p->notifier);
+	edac_device_del_device(&pdev->dev);
+	edac_device_free_ctl_info(p->dci);
+
+	return 0;
+}
+
+struct platform_device *sifive_pdev;
+
+static int __init sifive_edac_init(void)
+{
+	int ret;
+
+	sifive_pdev = platform_device_register_simple(DRVNAME, 0, NULL, 0);
+	if (IS_ERR(sifive_pdev))
+		return PTR_ERR(sifive_pdev);
+
+	ret = ecc_register(sifive_pdev);
+	if (ret)
+		platform_device_unregister(sifive_pdev);
+
+	return ret;
+}
+
+static void __exit sifive_edac_exit(void)
+{
+	ecc_unregister(sifive_pdev);
+	platform_device_unregister(sifive_pdev);
+}
+
+module_init(sifive_edac_init);
+module_exit(sifive_edac_exit);
+
+MODULE_AUTHOR("SiFive Inc.");
+MODULE_DESCRIPTION("SiFive platform EDAC driver");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
