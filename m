Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6551C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 00:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C37F8208DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 00:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438022AbgE2AZw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 20:25:52 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:34029 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438021AbgE2AZv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 20:25:51 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9AE11200007;
        Fri, 29 May 2020 00:25:47 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <weijie.gao@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v7 15/20] mtd: nand: Introduce the ECC engine abstraction
Date:   Fri, 29 May 2020 02:25:12 +0200
Message-Id: <20200529002517.3546-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529002517.3546-1-miquel.raynal@bootlin.com>
References: <20200529002517.3546-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Create a generic ECC engine object.

Later the ecc.c file will receive more generic code coming from
the raw NAND specific part. This is a base to instantiate ECC engine
objects.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/Kconfig  |   8 ++
 drivers/mtd/nand/Makefile |   2 +
 drivers/mtd/nand/ecc.c    | 157 ++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h  |  67 ++++++++++++++++
 4 files changed, 234 insertions(+)
 create mode 100644 drivers/mtd/nand/ecc.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index c1a45b071165..263d474d091c 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -9,4 +9,12 @@ source "drivers/mtd/nand/onenand/Kconfig"
 source "drivers/mtd/nand/raw/Kconfig"
 source "drivers/mtd/nand/spi/Kconfig"
 
+menu "ECC engine support"
+
+config MTD_NAND_ECC
+	bool
+	depends on MTD_NAND_CORE
+
+endmenu
+
 endmenu
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 7ecd80c0a66e..981372953b56 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -6,3 +6,5 @@ obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
 obj-y	+= onenand/
 obj-y	+= raw/
 obj-y	+= spi/
+
+nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
new file mode 100644
index 000000000000..f7300ba37167
--- /dev/null
+++ b/drivers/mtd/nand/ecc.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Generic Error-Correcting Code (ECC) engine
+ *
+ * Copyright (C) 2019 Macronix
+ * Author:
+ *     Miquèl RAYNAL <miquel.raynal@bootlin.com>
+ *
+ *
+ * This file describes the abstraction of any NAND ECC engine. It has been
+ * designed to fit most cases, including parallel NANDs and SPI-NANDs.
+ *
+ * There are three main situations where instantiating this ECC engine makes
+ * sense:
+ *   - external: The ECC engine is outside the NAND pipeline, typically this
+ *               is a software ECC engine, or an hardware engine that is
+ *               outside the NAND controller pipeline.
+ *   - pipelined: The ECC engine is inside the NAND pipeline, ie. on the
+ *                controller's side. This is the case of most of the raw NAND
+ *                controllers. In the pipeline case, the ECC bytes are
+ *                generated/data corrected on the fly when a page is
+ *                written/read.
+ *   - ondie: The ECC engine is inside the NAND pipeline, on the chip's side.
+ *            Some NAND chips can correct themselves the data.
+ *
+ * Besides the initial setup and final cleanups, the interfaces are rather
+ * simple:
+ *   - prepare: Prepare an I/O request. Enable/disable the ECC engine based on
+ *              the I/O request type. In case of software correction or external
+ *              engine, this step may involve to derive the ECC bytes and place
+ *              them in the OOB area before a write.
+ *   - finish: Finish an I/O request. Correct the data in case of a read
+ *             request and report the number of corrected bits/uncorrectable
+ *             errors. Most likely empty for write operations, unless you have
+ *             hardware specific stuff to do, like shutting down the engine to
+ *             save power.
+ *
+ * The I/O request should be enclosed in a prepare()/finish() pair of calls
+ * and will behave differently depending on the requested I/O type:
+ *   - raw: Correction disabled
+ *   - ecc: Correction enabled
+ *
+ * The request direction is impacting the logic as well:
+ *   - read: Load data from the NAND chip
+ *   - write: Store data in the NAND chip
+ *
+ * Mixing all this combinations together gives the following behavior.
+ * Those are just examples, drivers are free to add custom steps in their
+ * prepare/finish hook.
+ *
+ * [external ECC engine]
+ *   - external + prepare + raw + read: do nothing
+ *   - external + finish  + raw + read: do nothing
+ *   - external + prepare + raw + write: do nothing
+ *   - external + finish  + raw + write: do nothing
+ *   - external + prepare + ecc + read: do nothing
+ *   - external + finish  + ecc + read: calculate expected ECC bytes, extract
+ *                                      ECC bytes from OOB buffer, correct
+ *                                      and report any bitflip/error
+ *   - external + prepare + ecc + write: calculate ECC bytes and store them at
+ *                                       the right place in the OOB buffer based
+ *                                       on the OOB layout
+ *   - external + finish  + ecc + write: do nothing
+ *
+ * [pipelined ECC engine]
+ *   - pipelined + prepare + raw + read: disable the controller's ECC engine if
+ *                                       activated
+ *   - pipelined + finish  + raw + read: do nothing
+ *   - pipelined + prepare + raw + write: disable the controller's ECC engine if
+ *                                        activated
+ *   - pipelined + finish  + raw + write: do nothing
+ *   - pipelined + prepare + ecc + read: enable the controller's ECC engine if
+ *                                       deactivated
+ *   - pipelined + finish  + ecc + read: check the status, report any
+ *                                       error/bitflip
+ *   - pipelined + prepare + ecc + write: enable the controller's ECC engine if
+ *                                        deactivated
+ *   - pipelined + finish  + ecc + write: do nothing
+ *
+ * [ondie ECC engine]
+ *   - ondie + prepare + raw + read: send commands to disable the on-chip ECC
+ *                                   engine if activated
+ *   - ondie + finish  + raw + read: do nothing
+ *   - ondie + prepare + raw + write: send commands to disable the on-chip ECC
+ *                                    engine if activated
+ *   - ondie + finish  + raw + write: do nothing
+ *   - ondie + prepare + ecc + read: send commands to enable the on-chip ECC
+ *                                   engine if deactivated
+ *   - ondie + finish  + ecc + read: send commands to check the status, report
+ *                                   any error/bitflip
+ *   - ondie + prepare + ecc + write: send commands to enable the on-chip ECC
+ *                                    engine if deactivated
+ *   - ondie + finish  + ecc + write: do nothing
+ */
+
+#include <linux/module.h>
+#include <linux/mtd/nand.h>
+
+/**
+ * nand_ecc_init_ctx - Init the ECC engine context
+ * @nand: the NAND device
+ *
+ * On success, the caller is responsible of calling @nand_ecc_cleanup_ctx().
+ */
+int nand_ecc_init_ctx(struct nand_device *nand)
+{
+	if (!nand->ecc.engine->ops->init_ctx)
+		return 0;
+
+	return nand->ecc.engine->ops->init_ctx(nand);
+}
+EXPORT_SYMBOL(nand_ecc_init_ctx);
+
+/**
+ * nand_ecc_cleanup_ctx - Cleanup the ECC engine context
+ * @nand: the NAND device
+ */
+void nand_ecc_cleanup_ctx(struct nand_device *nand)
+{
+	if (nand->ecc.engine->ops->cleanup_ctx)
+		nand->ecc.engine->ops->cleanup_ctx(nand);
+}
+EXPORT_SYMBOL(nand_ecc_cleanup_ctx);
+
+/**
+ * nand_ecc_prepare_io_req - Prepare an I/O request
+ * @nand: the NAND device
+ * @req: the I/O request
+ */
+int nand_ecc_prepare_io_req(struct nand_device *nand,
+			    struct nand_page_io_req *req)
+{
+	if (!nand->ecc.engine->ops->prepare_io_req)
+		return 0;
+
+	return nand->ecc.engine->ops->prepare_io_req(nand, req);
+}
+EXPORT_SYMBOL(nand_ecc_prepare_io_req);
+
+/**
+ * nand_ecc_finish_io_req - Finish an I/O request
+ * @nand: the NAND device
+ * @req: the I/O request
+ */
+int nand_ecc_finish_io_req(struct nand_device *nand,
+			   struct nand_page_io_req *req)
+{
+	if (!nand->ecc.engine->ops->finish_io_req)
+		return 0;
+
+	return nand->ecc.engine->ops->finish_io_req(nand, req);
+}
+EXPORT_SYMBOL(nand_ecc_finish_io_req);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
+MODULE_DESCRIPTION("Generic ECC engine");
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9aacdf9dc779..2f838394b5f7 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -219,6 +219,73 @@ struct nand_ops {
 	bool (*isbad)(struct nand_device *nand, const struct nand_pos *pos);
 };
 
+/**
+ * struct nand_ecc_context - Context for the ECC engine
+ * @conf: basic ECC engine parameters
+ * @total: total number of bytes used for storing ECC codes, this is used by
+ *         generic OOB layouts
+ * @priv: ECC engine driver private data
+ */
+struct nand_ecc_context {
+	struct nand_ecc_props conf;
+	unsigned int total;
+	void *priv;
+};
+
+/**
+ * struct nand_ecc_engine_ops - ECC engine operations
+ * @init_ctx: given a desired user configuration for the pointed NAND device,
+ *            requests the ECC engine driver to setup a configuration with
+ *            values it supports.
+ * @cleanup_ctx: clean the context initialized by @init_ctx.
+ * @prepare_io_req: is called before reading/writing a page to prepare the I/O
+ *                  request to be performed with ECC correction.
+ * @finish_io_req: is called after reading/writing a page to terminate the I/O
+ *                 request and ensure proper ECC correction.
+ */
+struct nand_ecc_engine_ops {
+	int (*init_ctx)(struct nand_device *nand);
+	void (*cleanup_ctx)(struct nand_device *nand);
+	int (*prepare_io_req)(struct nand_device *nand,
+			      struct nand_page_io_req *req);
+	int (*finish_io_req)(struct nand_device *nand,
+			     struct nand_page_io_req *req);
+};
+
+/**
+ * struct nand_ecc_engine - ECC engine abstraction for NAND devices
+ * @ops: ECC engine operations
+ */
+struct nand_ecc_engine {
+	struct nand_ecc_engine_ops *ops;
+};
+
+int nand_ecc_init_ctx(struct nand_device *nand);
+void nand_ecc_cleanup_ctx(struct nand_device *nand);
+int nand_ecc_prepare_io_req(struct nand_device *nand,
+			    struct nand_page_io_req *req);
+int nand_ecc_finish_io_req(struct nand_device *nand,
+			   struct nand_page_io_req *req);
+
+/**
+ * struct nand_ecc - Information relative to the ECC
+ * @defaults: Default values, depend on the underlying subsystem
+ * @requirements: ECC requirements from the NAND chip perspective
+ * @user_conf: User desires in terms of ECC parameters
+ * @ctx: ECC context for the ECC engine, derived from the device @requirements
+ *       the @user_conf and the @defaults
+ * @ondie_engine: On-die ECC engine reference, if any
+ * @engine: ECC engine actually bound
+ */
+struct nand_ecc {
+	struct nand_ecc_props defaults;
+	struct nand_ecc_props requirements;
+	struct nand_ecc_props user_conf;
+	struct nand_ecc_context ctx;
+	struct nand_ecc_engine *ondie_engine;
+	struct nand_ecc_engine *engine;
+};
+
 /**
  * struct nand_device - NAND device
  * @mtd: MTD instance attached to the NAND device
-- 
2.20.1

