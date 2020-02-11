Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE1FC3B186
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 12:26:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30D0920714
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 12:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgBKM0d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 07:26:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:50142 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727975AbgBKM0d (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Feb 2020 07:26:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3D7DEAFB2;
        Tue, 11 Feb 2020 12:26:31 +0000 (UTC)
From:   Nikolay Borisov <nborisov@suse.com>
To:     mripard@kernel.org, bjorn.andersson@linaro.org
Cc:     devicetree@vger.kernel.org, wens@csie.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v2 1/3] hwspinlock: sunxi: Implement support for Allwinner's A64 SoC
Date:   Tue, 11 Feb 2020 14:26:22 +0200
Message-Id: <20200211122624.16484-2-nborisov@suse.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211122624.16484-1-nborisov@suse.com>
References: <20200211122624.16484-1-nborisov@suse.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Based on the datasheet this implements support for the hwspinlock IP
block.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 drivers/hwspinlock/Kconfig             |   9 ++
 drivers/hwspinlock/Makefile            |   1 +
 drivers/hwspinlock/sun50i_hwspinlock.c | 163 +++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/hwspinlock/sun50i_hwspinlock.c

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 37740e992cfa..aff39bad3e90 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -68,3 +68,12 @@ config HSEM_U8500
 	  SoC.
 
 	  If unsure, say N.
+
+config HWSPINLOCK_SUN50I
+	tristate "Allwinner Hardware Spinlock device"
+	depends on ARCH_SUNXI
+	depends on HWSPINLOCK
+	help
+	  Say y here to support the SUNXI Hardware Spinlock device.
+
+	  If unsure, say N.
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index ed053e3f02be..ebabe5c7b7ef 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -8,5 +8,6 @@ obj-$(CONFIG_HWSPINLOCK_OMAP)		+= omap_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SIRF)		+= sirf_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
+obj-$(CONFIG_HWSPINLOCK_SUN50I)		+= sun50i_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_STM32)		+= stm32_hwspinlock.o
 obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
diff --git a/drivers/hwspinlock/sun50i_hwspinlock.c b/drivers/hwspinlock/sun50i_hwspinlock.c
new file mode 100644
index 000000000000..2b54c0a0148d
--- /dev/null
+++ b/drivers/hwspinlock/sun50i_hwspinlock.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Author: Nikolay Borisov <nborisov@suse.com> */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/hwspinlock.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include "hwspinlock_internal.h"
+
+/* Bits containing number of locks in SPINLOCK_SYSSTATUS_REG */
+#define SPINLOCK_LOCKS_NUM GENMASK(29, 28)
+
+/* Spinlock register offsets */
+#define SPINLOCK_ID(X) (0x100 + 0x4 * X)
+
+/* Possible values of SPINLOCK_LOCK_REG */
+#define SPINLOCK_NOTTAKEN		(0)	/* free */
+#define SPINLOCK_TAKEN			(1)	/* locked */
+
+struct sun50i_hwspinlock {
+	struct clk *clk;
+	struct reset_control *reset;
+	struct hwspinlock_device *bank;
+};
+
+static int sun50i_hwspinlock_trylock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = lock->priv;
+
+	/* attempt to acquire the lock by reading its value */
+	return readl(lock_addr) == SPINLOCK_NOTTAKEN;
+}
+
+static void sun50i_hwspinlock_unlock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = lock->priv;
+
+	/* release the lock by writing 0 to it */
+	writel(SPINLOCK_NOTTAKEN, lock_addr);
+}
+
+static const struct hwspinlock_ops sun50i_hwspinlock_ops = {
+	.trylock	= sun50i_hwspinlock_trylock,
+	.unlock		= sun50i_hwspinlock_unlock,
+};
+
+static int sun50i_get_num_locks(void __iomem *io_base)
+{
+	u32 i = readl(io_base);
+	i = FIELD_GET(SPINLOCK_LOCKS_NUM, i);
+
+	switch (i) {
+	case 0x1: return 32;
+	case 0x2: return 64;
+	case 0x3: return 128;
+	case 0x4: return 256;
+	}
+
+	return 0;
+}
+
+static int sun50i_hwspinlock_probe(struct platform_device *pdev)
+{
+	struct sun50i_hwspinlock *hw;
+	void __iomem *io_base;
+	struct clk *clk;
+	struct reset_control *reset;
+	int i, ret, num_locks;
+
+	io_base = devm_platform_ioremap_resource(&pdev->dev, 0);
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
+
+	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
+	if (!hw)
+		return -ENOMEM;
+
+	hw->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(hw->clk))
+		return PTR_ERR(hw->clk);
+
+	ret = clk_prepare_enable(hw->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Cannot enable clock\n");
+		return ret;
+	}
+
+	/* Disable soft reset */
+	hw->reset= devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(hw->reset)) {
+		clk_disable_unprepare(hw->clk);
+		return PTR_ERR(hw->reset);
+	}
+	reset_control_deassert(hw->reset);
+
+	ret = devm_add_action_or_reset(&pdev->dev, sun50i_hwpinlock_disable,
+				       hw);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to add hwspinlock disable action\n");
+		return ret;
+	}
+
+	num_locks = sun50i_get_num_locks(io_base);
+	if (!num_locks) {
+		dev_err(&pdev->dev, "Unrecognised sun50i hwspinlock device\n");
+		ret = -EINVAL;
+		goto out_reset;
+	}
+
+	hw->bank = devm_kzalloc(&pdev->dev,
+				struct_size(hw->bank, lock, num_locks),
+				GFP_KERNEL);
+	if (!hw) {
+		ret = -ENOMEM;
+		goto out_reset;
+	}
+
+	for (i = 0; i < num_locks; i++)
+		hw->bank.lock[i].priv = io_base + SPINLOCK_ID(i);
+
+	platform_set_drvdata(pdev, hw);
+
+	return devm_hwspin_lock_register(&pdev->dev, &hw->bank,
+					 &sun50i_hwspinlock_ops, 0, num_locks);
+}
+
+static int sun50i_hwspinlock_disable(struct platform_device *pdev)
+{
+	struct sun50i_hwspinlock *hw = platform_get_drvdata(pdev);
+	int ret;
+
+	reset_control_assert(hw->reset);
+	clk_disable_unprepare(hw->clk);
+
+	return 0;
+}
+
+static const struct of_device_id sun50i_hwpinlock_ids[] = {
+	{ .compatible = "allwinner,sun50i-a64-hwspinlock", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sun50i_hwpinlock_ids);
+
+static struct platform_driver sun50i_hwspinlock_driver = {
+	.probe		= sun50i_hwspinlock_probe,
+	.driver		= {
+		.name	= "sun50i_hwspinlock",
+		.of_match_table = sun50i_hwpinlock_ids,
+	},
+};
+
+module_platform_driver(sun50i_hwspinlock_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Hardware spinlock driver for sun50i SoCs");
+MODULE_AUTHOR("Nikolay Borisov <nborisov@suse.com>");
-- 
2.17.1

