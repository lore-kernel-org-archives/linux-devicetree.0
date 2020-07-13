Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A49C433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 09:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BA142067D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 09:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CRdrZP7d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbgGMJMl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 05:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728950AbgGMJMk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 05:12:40 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE75C061794
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 02:12:40 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w17so5245058ply.11
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 02:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mirXUn5TUmS/dbhbyJX3BC/2rEdT8KRDdAz9WZUgPW8=;
        b=CRdrZP7d4uFBeFJ+2xLkO1cEIz8pxkeItDf3u83+5V+Kvy0hLB0Ef/gbWZXRtd8f6S
         70n1pILvl2+hT7PyJ2Y4EZSu47/7/wezZB/ZbV/PQSeHFolDL5Jik73oeokkEukQSYIR
         BwaQAd2qOBPd0SjHgTbtYGmYMNCqO57c0tE1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mirXUn5TUmS/dbhbyJX3BC/2rEdT8KRDdAz9WZUgPW8=;
        b=ErYzn36qBOlpHodYf3YTsgv2P60dcLKlEeCLwXupVWHFndzxOvYjBKlri3nw0TTuB6
         JkWMHB47LCHTXWUu16T7zFT4XaKfTa/OQths/pu/YMSSv58VCafjHBhxDODDKE7QvRIF
         Gi9xEWsPXn7L5mJVsCPDDnapzB9bdCHetgU2ZN9HEzB9rzjonm/MD2jgindqUITxqudp
         DjqKJgE9cPhlvlEkpbDJK8QyWBFcNU+pp+OYDZ/Mqsm2ETPm4CZcI0TmzizvUUn4XGGD
         0w4GvDuxXDhAhUN5v4kMkKtL+FObTUpfIWIfHNRQWZopgeKRjDpZqKXIWxX2vtxAdBT6
         T1nw==
X-Gm-Message-State: AOAM531WUS2baD43lZ9irP8Bar6SgND2sywC6t/GXj84vPySRz3y75yO
        h/eTrUuwbfr9hR8y63Ve7vT3Mg==
X-Google-Smtp-Source: ABdhPJzu0Q4AUTfbacNOnYuGCl2X1HWeB4fiSN3zpAO0QNwTnhYh4E4F2Jk57CsEHlCX8nUq3gfvsg==
X-Received: by 2002:a17:90b:4c91:: with SMTP id my17mr17575628pjb.81.1594631560286;
        Mon, 13 Jul 2020 02:12:40 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:3e52:82ff:fe5e:cc9d])
        by smtp.gmail.com with ESMTPSA id m9sm14027581pjs.18.2020.07.13.02.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 02:12:39 -0700 (PDT)
From:   Claire Chang <tientzu@chromium.org>
To:     robh+dt@kernel.org, frowand.list@gmail.com, hch@lst.de,
        m.szyprowski@samsung.com, robin.murphy@arm.com
Cc:     treding@nvidia.com, gregkh@linuxfoundation.org,
        saravanak@google.com, suzuki.poulose@arm.com,
        dan.j.williams@intel.com, heikki.krogerus@linux.intel.com,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        tfiga@chromium.org, drinkcat@chromium.org,
        Claire Chang <tientzu@chromium.org>
Subject: [PATCH 1/4] dma-mapping: Add bounced DMA ops
Date:   Mon, 13 Jul 2020 17:12:08 +0800
Message-Id: <20200713091211.2183368-2-tientzu@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713091211.2183368-1-tientzu@chromium.org>
References: <20200713091211.2183368-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The bounced DMA ops provide an implementation of DMA ops that bounce
streaming DMA in and out of a specially allocated region. Only the
operations relevant to streaming DMA are supported.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/device.h      |   3 +
 include/linux/dma-mapping.h |   1 +
 kernel/dma/Kconfig          |  17 +++
 kernel/dma/Makefile         |   1 +
 kernel/dma/bounced.c        | 215 ++++++++++++++++++++++++++++++++++++
 5 files changed, 237 insertions(+)
 create mode 100644 kernel/dma/bounced.c

diff --git a/include/linux/device.h b/include/linux/device.h
index 7322c51e9c0c..868b9a364003 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -588,6 +588,9 @@ struct device {
 
 	struct list_head	dma_pools;	/* dma pools (if dma'ble) */
 
+#ifdef CONFIG_DMA_BOUNCED
+	struct dma_bounced_mem  *dma_bounced_mem;
+#endif
 #ifdef CONFIG_DMA_DECLARE_COHERENT
 	struct dma_coherent_mem	*dma_mem; /* internal for coherent mem
 					     override */
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 2328f451a45d..86089424dafd 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -135,6 +135,7 @@ struct dma_map_ops {
 
 extern const struct dma_map_ops dma_virt_ops;
 extern const struct dma_map_ops dma_dummy_ops;
+extern const struct dma_map_ops dma_bounced_ops;
 
 #define DMA_BIT_MASK(n)	(((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
 
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 1da3f44f2565..148734c8748b 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -88,6 +88,23 @@ config DMA_DIRECT_REMAP
 	select DMA_REMAP
 	select DMA_COHERENT_POOL
 
+config DMA_BOUNCED
+	bool "DMA Bounced"
+	depends on !HIGHMEM
+	select OF_RESERVED_MEM
+	help
+	  This enables support for bounced DMA pools which provide a level of
+	  DMA memory protection on systems with limited hardware protection
+	  capabilities, such as those lacking an IOMMU. It does so by bouncing
+	  the data to a specially allocated DMA-accessible protected region
+	  before mapping and unmapping. One can assign the protected memory
+	  region in the device tree by using reserved-memory.
+
+	  For more information see
+	  <Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt>
+	  and <kernel/dma/bounced.c>.
+	  If unsure, say "n".
+
 config DMA_CMA
 	bool "DMA Contiguous Memory Allocator"
 	depends on HAVE_DMA_CONTIGUOUS && CMA
diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile
index 370f63344e9c..f5fb4f42326a 100644
--- a/kernel/dma/Makefile
+++ b/kernel/dma/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_HAS_DMA)			+= mapping.o direct.o dummy.o
+obj-$(CONFIG_DMA_BOUNCED)		+= bounced.o
 obj-$(CONFIG_DMA_CMA)			+= contiguous.o
 obj-$(CONFIG_DMA_DECLARE_COHERENT)	+= coherent.o
 obj-$(CONFIG_DMA_VIRT_OPS)		+= virt.o
diff --git a/kernel/dma/bounced.c b/kernel/dma/bounced.c
new file mode 100644
index 000000000000..fcaabb5eccf2
--- /dev/null
+++ b/kernel/dma/bounced.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bounced DMA support.
+ *
+ * This implements the mitigations for lack of IOMMU by bouncing the data to a
+ * specially allocated region before mapping and unmapping.
+ *
+ * Copyright 2020 Google LLC.
+ */
+#include <linux/dma-direct.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-noncoherent.h>
+#include <linux/io.h>
+#include <linux/genalloc.h>
+#include <linux/slab.h>
+
+struct dma_bounced_mem {
+	void		**orig_addr;
+	void		*virt_base;
+	dma_addr_t	device_base;
+	dma_addr_t	device_end;
+	struct gen_pool	*pool;
+	size_t		size;
+};
+
+static void dma_bounced_set_orig_virt(struct device *dev, dma_addr_t dma_addr,
+				      void *orig_addr)
+{
+	struct dma_bounced_mem *mem = dev->dma_bounced_mem;
+	int idx = (dma_addr - mem->device_base) >> PAGE_SHIFT;
+
+	if (dma_addr < mem->device_base || dma_addr >= mem->device_end)
+		return;
+
+	mem->orig_addr[idx] = orig_addr;
+}
+
+static void *dma_bounced_get_orig_virt(struct device *dev, dma_addr_t dma_addr)
+{
+	struct dma_bounced_mem *mem = dev->dma_bounced_mem;
+	int idx = (dma_addr - mem->device_base) >> PAGE_SHIFT;
+
+	if (dma_addr < mem->device_base || dma_addr >= mem->device_end)
+		return NULL;
+
+	return mem->orig_addr[idx];
+}
+
+static void *dma_bounced_get_virt(struct device *dev, dma_addr_t dma_addr)
+{
+	struct dma_bounced_mem *mem = dev->dma_bounced_mem;
+
+	if (dma_addr < mem->device_base || dma_addr >= mem->device_end)
+		return NULL;
+
+	return (dma_addr - mem->device_base) + mem->virt_base;
+}
+
+static void dma_bounced_sync_single_for_cpu(struct device *dev,
+					    dma_addr_t dma_addr, size_t size,
+					    enum dma_data_direction dir)
+{
+	void *orig_virt = dma_bounced_get_orig_virt(dev, dma_addr);
+	void *bounced_virt = dma_bounced_get_virt(dev, dma_addr);
+
+	if (!orig_virt || !bounced_virt)
+		return;
+
+	dma_direct_sync_single_for_cpu(dev, dma_addr, size, dir);
+
+	if (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL)
+		memcpy(orig_virt, bounced_virt, size);
+}
+
+static void dma_bounced_sync_single_for_device(struct device *dev,
+					       dma_addr_t dma_addr, size_t size,
+					       enum dma_data_direction dir)
+{
+	void *orig_virt = dma_bounced_get_orig_virt(dev, dma_addr);
+	void *bounced_virt = dma_bounced_get_virt(dev, dma_addr);
+
+	if (!orig_virt || !bounced_virt)
+		return;
+
+	if (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL)
+		memcpy(bounced_virt, orig_virt, size);
+
+	dma_direct_sync_single_for_device(dev, dma_addr, size, dir);
+}
+
+static void dma_bounced_sync_sg_for_cpu(struct device *dev,
+					struct scatterlist *sgl, int nents,
+					enum dma_data_direction dir)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sgl, sg, nents, i) {
+		dma_bounced_sync_single_for_cpu(dev, sg->dma_address,
+						sg->length, dir);
+	}
+}
+
+static void dma_bounced_sync_sg_for_device(struct device *dev,
+					   struct scatterlist *sgl, int nents,
+					   enum dma_data_direction dir)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sgl, sg, nents, i) {
+		dma_bounced_sync_single_for_device(dev, sg->dma_address,
+						   sg->length, dir);
+	}
+}
+
+static void dma_bounced_unmap_page(struct device *dev, dma_addr_t dma_addr,
+				   size_t size, enum dma_data_direction dir,
+				   unsigned long attrs)
+{
+	struct dma_bounced_mem *mem = dev->dma_bounced_mem;
+
+	if (dma_addr < mem->device_base || dma_addr >= mem->device_end)
+		return;
+
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		dma_bounced_sync_single_for_cpu(dev, dma_addr, size, dir);
+
+	dma_bounced_set_orig_virt(dev, dma_addr, NULL);
+	gen_pool_free(mem->pool,
+		      (unsigned long)dma_bounced_get_virt(dev, dma_addr), size);
+}
+
+static dma_addr_t dma_bounced_map_page(struct device *dev, struct page *page,
+				       unsigned long offset, size_t size,
+				       enum dma_data_direction dir,
+				       unsigned long attrs)
+{
+	struct dma_bounced_mem *mem = dev->dma_bounced_mem;
+	dma_addr_t dma_addr;
+	void *orig_virt;
+
+	if (unlikely(!gen_pool_dma_alloc(mem->pool, size, &dma_addr)))
+		return DMA_MAPPING_ERROR;
+
+	orig_virt = page_to_virt(page) + offset;
+	dma_bounced_set_orig_virt(dev, dma_addr, orig_virt);
+
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		dma_bounced_sync_single_for_device(dev, dma_addr, size, dir);
+
+	return dma_addr;
+}
+
+static void dma_bounced_unmap_sg(struct device *dev, struct scatterlist *sgl,
+				 int nents, enum dma_data_direction dir,
+				 unsigned long attrs)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sgl, sg, nents, i) {
+		dma_bounced_unmap_page(dev, sg->dma_address, sg_dma_len(sg),
+				       dir, attrs);
+	}
+}
+
+static int dma_bounced_map_sg(struct device *dev, struct scatterlist *sgl,
+			      int nents, enum dma_data_direction dir,
+			      unsigned long attrs)
+{
+	int i;
+	struct scatterlist *sg;
+
+	for_each_sg(sgl, sg, nents, i) {
+		sg->dma_address = dma_bounced_map_page(
+			dev, sg_page(sg), sg->offset, sg->length, dir, attrs);
+		if (sg->dma_address == DMA_MAPPING_ERROR)
+			goto out_unmap;
+		sg_dma_len(sg) = sg->length;
+	}
+
+	return nents;
+
+out_unmap:
+	dma_bounced_unmap_sg(dev, sgl, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
+	return 0;
+}
+
+static size_t dma_bounced_max_mapping_size(struct device *dev)
+{
+	return dev->dma_bounced_mem->size;
+}
+
+const struct dma_map_ops dma_bounced_ops = {
+	.alloc			= NULL,
+	.free			= NULL,
+	.mmap			= NULL,
+	.get_sgtable		= NULL,
+	.sync_single_for_cpu	= dma_bounced_sync_single_for_cpu,
+	.sync_single_for_device = dma_bounced_sync_single_for_device,
+	.sync_sg_for_cpu	= dma_bounced_sync_sg_for_cpu,
+	.sync_sg_for_device	= dma_bounced_sync_sg_for_device,
+	.map_page		= dma_bounced_map_page,
+	.unmap_page		= dma_bounced_unmap_page,
+	.map_sg			= dma_bounced_map_sg,
+	.unmap_sg		= dma_bounced_unmap_sg,
+	.unmap_resource		= NULL,
+	.map_resource		= NULL,
+	.cache_sync		= NULL,
+	.dma_supported		= dma_direct_supported,
+	.get_required_mask	= dma_direct_get_required_mask,
+	.max_mapping_size	= dma_bounced_max_mapping_size,
+	.get_merge_boundary	= NULL,
+};
-- 
2.27.0.383.g050319c2ae-goog

