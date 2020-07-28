Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA92C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 03:15:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEBB0207CD
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 03:15:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CyZOFqJg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgG1DPL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 23:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbgG1DPK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 23:15:10 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6ECC0619D2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 20:15:10 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id w17so9158686ply.11
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 20:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/t4x1lE/ln+iWxTd0oAMxFTi1bLACFMxmDNz8ZnbyNc=;
        b=CyZOFqJgDYD4ZLKir402Lq/oR5tQffh77J7UFxTayeAClA0cXIEjPFG+ZUXbPGjCmL
         itx7Uk+8Q9GtxvHWGW6rv+/v2en8qJmsTQMp9h129EXR4TxsXXI+cQ0lu9SjlQUjKqdK
         ESbUe1lywvJqLryHSi5WgpBOdXl2N5/eerL7bUNyqpwQyQDLWGJdHBnw0BiTZm1yOF79
         D94pBWr3p5usy+xvNa1Ah+x2JI4cG+YR9Ji5Roe1mSHYMVUAnFqRbvRsNEeFi2WW4Oad
         N3S98BoQVyi+RZt/m90mSpEiMv6wyA2kn4o6fnh6nWeGn/tzjsgrk/w9oyNC9AtoZJ0d
         9lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/t4x1lE/ln+iWxTd0oAMxFTi1bLACFMxmDNz8ZnbyNc=;
        b=VBqAJFpUwuHknA80YAFq4i5EylfJvNE5X038MONYL46BHqqj/TzJzNi6IXiEVtXowE
         zISORh3y7+TeGOl+BFL8ER3Tw3ZsMkl1HDAyFN78+/DrJFYvLpv62/iRXnW+xnWZpyCz
         HU0vk2A0Qas61M/rU8GtbvAlaIXjbOKqQuIH6t99x5j9ZxczrK/T+aDncc3pBf/o/MLq
         70UeE7vXfYCOHeZA7B1k2CT7vgVZxuxEh6+87wTeeYa+wUGCDLhdsi76DSM8YeKUcPM/
         AxeV03rkCVHxJhofElkX5WoK1YaPtOiFa9IJ/qmBKXENW/hKjPHSC4Sh78v1Hj9YwF7F
         KE4Q==
X-Gm-Message-State: AOAM530dk/jeiYZd+6h4a36jOTLdE+ZQrzK4hGVdRAYYJzLIMmgdjZZm
        rjLv2Lj0oUwQ9E/l6nBu/9ZyDwnDtUVhMA==
X-Google-Smtp-Source: ABdhPJxJpgk8fzwnHmt3anr64wsYWjpEFBXtH6raBeEEJh0Jt1zjTpcHFBBxiyiRB+FY65wjRAvBYg==
X-Received: by 2002:a17:902:7791:: with SMTP id o17mr21600872pll.224.1595906109557;
        Mon, 27 Jul 2020 20:15:09 -0700 (PDT)
Received: from debian.flets-east.jp ([2400:2411:502:a100:c84b:19e2:9b53:48bb])
        by smtp.gmail.com with ESMTPSA id s10sm3895285pjf.3.2020.07.27.20.15.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 20:15:08 -0700 (PDT)
From:   Masahisa Kojima <masahisa.kojima@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     masahisa.kojima@linaro.org, jarkko.sakkinen@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
        devicetree@vger.kernel.org, linux-integrity@vger.kernel.org,
        peterhuewe@gmx.de, jgg@ziepe.ca
Subject: [PATCH v5 1/2] tpm: tis: add support for MMIO TPM on SynQuacer
Date:   Tue, 28 Jul 2020 12:14:31 +0900
Message-Id: <20200728031433.3370-2-masahisa.kojima@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200728031433.3370-1-masahisa.kojima@linaro.org>
References: <20200728031433.3370-1-masahisa.kojima@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

When fitted, the SynQuacer platform exposes its SPI TPM via a MMIO
window that is backed by the SPI command sequencer in the SPI bus
controller. This arrangement has the limitation that only byte size
accesses are supported, and so we'll need to provide a separate module
that take this into account.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
---
 drivers/char/tpm/Kconfig             |  12 ++
 drivers/char/tpm/Makefile            |   1 +
 drivers/char/tpm/tpm_tis_synquacer.c | 208 +++++++++++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_tis_synquacer.c

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 58b4c573d176..a18c314da211 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -74,6 +74,18 @@ config TCG_TIS_SPI_CR50
 	  If you have a H1 secure module running Cr50 firmware on SPI bus,
 	  say Yes and it will be accessible from within Linux.
 
+config TCG_TIS_SYNQUACER
+	tristate "TPM Interface Specification 1.2 Interface / TPM 2.0 FIFO Interface (MMIO - SynQuacer)"
+	depends on ARCH_SYNQUACER
+	select TCG_TIS_CORE
+	help
+	  If you have a TPM security chip that is compliant with the
+	  TCG TIS 1.2 TPM specification (TPM1.2) or the TCG PTP FIFO
+	  specification (TPM2.0) say Yes and it will be accessible from
+	  within Linux on Socionext SynQuacer platform.
+	  To compile this driver as a module, choose  M here;
+	  the module will be called tpm_tis_synquacer.
+
 config TCG_TIS_I2C_ATMEL
 	tristate "TPM Interface Specification 1.2 Interface (I2C - Atmel)"
 	depends on I2C
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 9567e5197f74..84db4fb3a9c9 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -21,6 +21,7 @@ tpm-$(CONFIG_EFI) += eventlog/efi.o
 tpm-$(CONFIG_OF) += eventlog/of.o
 obj-$(CONFIG_TCG_TIS_CORE) += tpm_tis_core.o
 obj-$(CONFIG_TCG_TIS) += tpm_tis.o
+obj-$(CONFIG_TCG_TIS_SYNQUACER) += tpm_tis_synquacer.o
 
 obj-$(CONFIG_TCG_TIS_SPI) += tpm_tis_spi.o
 tpm_tis_spi-y := tpm_tis_spi_main.o
diff --git a/drivers/char/tpm/tpm_tis_synquacer.c b/drivers/char/tpm/tpm_tis_synquacer.c
new file mode 100644
index 000000000000..e47bdd272704
--- /dev/null
+++ b/drivers/char/tpm/tpm_tis_synquacer.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Linaro Ltd.
+ *
+ * This device driver implements MMIO TPM on SynQuacer Platform.
+ */
+#include <linux/acpi.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/kernel.h>
+#include "tpm.h"
+#include "tpm_tis_core.h"
+
+/*
+ * irq > 0 means: use irq $irq;
+ * irq = 0 means: autoprobe for an irq;
+ * irq = -1 means: no irq support
+ */
+struct tpm_tis_synquacer_info {
+	struct resource res;
+	int irq;
+};
+
+struct tpm_tis_synquacer_phy {
+	struct tpm_tis_data priv;
+	void __iomem *iobase;
+};
+
+static inline struct tpm_tis_synquacer_phy *to_tpm_tis_tcg_phy(struct tpm_tis_data *data)
+{
+	return container_of(data, struct tpm_tis_synquacer_phy, priv);
+}
+
+static int tpm_tis_synquacer_read_bytes(struct tpm_tis_data *data, u32 addr,
+					u16 len, u8 *result)
+{
+	struct tpm_tis_synquacer_phy *phy = to_tpm_tis_tcg_phy(data);
+
+	while (len--)
+		*result++ = ioread8(phy->iobase + addr);
+
+	return 0;
+}
+
+static int tpm_tis_synquacer_write_bytes(struct tpm_tis_data *data, u32 addr,
+					 u16 len, const u8 *value)
+{
+	struct tpm_tis_synquacer_phy *phy = to_tpm_tis_tcg_phy(data);
+
+	while (len--)
+		iowrite8(*value++, phy->iobase + addr);
+
+	return 0;
+}
+
+static int tpm_tis_synquacer_read16_bw(struct tpm_tis_data *data,
+				       u32 addr, u16 *result)
+{
+	struct tpm_tis_synquacer_phy *phy = to_tpm_tis_tcg_phy(data);
+
+	/*
+	 * Due to the limitation of SPI controller on SynQuacer,
+	 * 16/32 bits access must be done in byte-wise and descending order.
+	 */
+	*result = (ioread8(phy->iobase + addr + 1) << 8) |
+		  (ioread8(phy->iobase + addr));
+
+	return 0;
+}
+
+static int tpm_tis_synquacer_read32_bw(struct tpm_tis_data *data,
+				       u32 addr, u32 *result)
+{
+	struct tpm_tis_synquacer_phy *phy = to_tpm_tis_tcg_phy(data);
+
+	/*
+	 * Due to the limitation of SPI controller on SynQuacer,
+	 * 16/32 bits access must be done in byte-wise and descending order.
+	 */
+	*result = (ioread8(phy->iobase + addr + 3) << 24) |
+		  (ioread8(phy->iobase + addr + 2) << 16) |
+		  (ioread8(phy->iobase + addr + 1) << 8) |
+		  (ioread8(phy->iobase + addr));
+
+	return 0;
+}
+
+static int tpm_tis_synquacer_write32_bw(struct tpm_tis_data *data,
+					u32 addr, u32 value)
+{
+	struct tpm_tis_synquacer_phy *phy = to_tpm_tis_tcg_phy(data);
+
+	/*
+	 * Due to the limitation of SPI controller on SynQuacer,
+	 * 16/32 bits access must be done in byte-wise and descending order.
+	 */
+	iowrite8(value >> 24, phy->iobase + addr + 3);
+	iowrite8(value >> 16, phy->iobase + addr + 2);
+	iowrite8(value >> 8, phy->iobase + addr + 1);
+	iowrite8(value, phy->iobase + addr);
+
+	return 0;
+}
+
+static const struct tpm_tis_phy_ops tpm_tcg_bw = {
+	.read_bytes	= tpm_tis_synquacer_read_bytes,
+	.write_bytes	= tpm_tis_synquacer_write_bytes,
+	.read16		= tpm_tis_synquacer_read16_bw,
+	.read32		= tpm_tis_synquacer_read32_bw,
+	.write32	= tpm_tis_synquacer_write32_bw,
+};
+
+static int tpm_tis_synquacer_init(struct device *dev,
+				  struct tpm_tis_synquacer_info *tpm_info)
+{
+	struct tpm_tis_synquacer_phy *phy;
+
+	phy = devm_kzalloc(dev, sizeof(struct tpm_tis_synquacer_phy), GFP_KERNEL);
+	if (phy == NULL)
+		return -ENOMEM;
+
+	phy->iobase = devm_ioremap_resource(dev, &tpm_info->res);
+	if (IS_ERR(phy->iobase))
+		return PTR_ERR(phy->iobase);
+
+	return tpm_tis_core_init(dev, &phy->priv, tpm_info->irq, &tpm_tcg_bw,
+				 ACPI_HANDLE(dev));
+}
+
+static SIMPLE_DEV_PM_OPS(tpm_tis_synquacer_pm, tpm_pm_suspend, tpm_tis_resume);
+
+static int tpm_tis_synquacer_probe(struct platform_device *pdev)
+{
+	struct tpm_tis_synquacer_info tpm_info = {};
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL) {
+		dev_err(&pdev->dev, "no memory resource defined\n");
+		return -ENODEV;
+	}
+	tpm_info.res = *res;
+
+	tpm_info.irq = -1;
+
+	return tpm_tis_synquacer_init(&pdev->dev, &tpm_info);
+}
+
+static int tpm_tis_synquacer_remove(struct platform_device *pdev)
+{
+	struct tpm_chip *chip = dev_get_drvdata(&pdev->dev);
+
+	tpm_chip_unregister(chip);
+	tpm_tis_remove(chip);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id tis_synquacer_of_platform_match[] = {
+	{.compatible = "socionext,synquacer-tpm-mmio"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, tis_synquacer_of_platform_match);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id tpm_synquacer_acpi_tbl[] = {
+	{ "SCX0009" },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, tpm_synquacer_acpi_tbl);
+#endif
+
+static struct platform_driver tis_synquacer_drv = {
+	.probe = tpm_tis_synquacer_probe,
+	.remove = tpm_tis_synquacer_remove,
+	.driver = {
+		.name		= "tpm_tis_synquacer",
+		.pm		= &tpm_tis_synquacer_pm,
+		.of_match_table = of_match_ptr(tis_synquacer_of_platform_match),
+		.acpi_match_table = ACPI_PTR(tpm_synquacer_acpi_tbl),
+	},
+};
+
+static int __init tpm_tis_synquacer_module_init(void)
+{
+	int rc;
+
+	rc = platform_driver_register(&tis_synquacer_drv);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static void __exit tpm_tis_synquacer_module_exit(void)
+{
+	platform_driver_unregister(&tis_synquacer_drv);
+}
+
+module_init(tpm_tis_synquacer_module_init);
+module_exit(tpm_tis_synquacer_module_exit);
+MODULE_DESCRIPTION("TPM MMIO Driver for Socionext SynQuacer platform");
+MODULE_LICENSE("GPL");
-- 
2.20.1

