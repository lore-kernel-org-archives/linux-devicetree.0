Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED444C11D39
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2FF421744
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:24:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hQ7R/j32"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgBXSYi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 13:24:38 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41926 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727922AbgBXSYh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 13:24:37 -0500
Received: by mail-wr1-f65.google.com with SMTP id c9so11579051wrw.8
        for <devicetree@vger.kernel.org>; Mon, 24 Feb 2020 10:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ke1+5YSOcxDNzSzBBGnaN+kOVlCxvSlETx/6pQryQw=;
        b=hQ7R/j32SLrNiw6cB+MKzedjV5jb7wC2uDlPXljxSGn/Mm+e8K6vJRpSEh03PvC4u9
         6SWVO6jkqy8f1MhFEXuwvn5CVzySq1eAR0OMIHnH231Ilx59ro788ZXbVKhAb08vEu3x
         2DRDRX3reoEDjA1nXPvHdhi3NlMMHALRilHOP4FbegQ6bDl+MXF72BSCvs01Iga0ey/V
         lRA5BpuJcyT4Bo+4XEn4NxJCsLV3waRxK/XqqsUDdfn1vY0NKse5RC5ThKKbEOiOSL6S
         WBTlf6zQcjBQmTv4KAcSJKa3LHmn9N03VuV6CMiAjWvmhiZgf7OibmnfYlq8z45tqDXq
         +QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ke1+5YSOcxDNzSzBBGnaN+kOVlCxvSlETx/6pQryQw=;
        b=Viq51Ll0GVyFp6MbBzFtln97s2t3mrvHPwO9A9oBp7seYCi829GNaOuVhc1Gzswx6A
         n08t8EH3yhR9KNQYPgXCOJfsdi5sfjiQEBl0lbe4kkwt8F0lv5854EYfVpLOYDxFR/h9
         EBXtPnkin6mS1SQ+r2yfA0GJ3gvLeOiq/sEzHB4Hl7uqZrU7POn1/Y5lC0SfAei5tWpY
         tG3si+oCI3+yA5XJFyQ+/Msjz4by0EqNLvs5UyQBf8USuaG5U2yDqKQvAdRLXi9DLcAz
         ZQhG8tuRObGXQknjMNz7twoIOEHE029zHZ40ueghB6fHe8aeKzPPo70TRI4C5qoNRweD
         yv1Q==
X-Gm-Message-State: APjAAAVWbd2nUyQhbjsQEoopNyNAyV1ArnpCo6yfj0hb4ohWTcIgt7kq
        fI1orf3LVNGUt0KORMEmDgDD9A==
X-Google-Smtp-Source: APXvYqxKuED5BtGA+H9sncjVVYaPSWdkOdWHekAifEqs9Cn+ZBcftrmVm7FgSaad06EVLWBinDxKzg==
X-Received: by 2002:adf:df83:: with SMTP id z3mr67641748wrl.389.1582568676229;
        Mon, 24 Feb 2020 10:24:36 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id n3sm304255wmc.27.2020.02.24.10.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 10:24:35 -0800 (PST)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org
Cc:     joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com,
        catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
        kevin.tian@intel.com, baolu.lu@linux.intel.com,
        Jonathan.Cameron@huawei.com, jacob.jun.pan@linux.intel.com,
        christian.koenig@amd.com, yi.l.liu@intel.com,
        zhangfei.gao@linaro.org,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: [PATCH v4 06/26] iommu/sva: Register page fault handler
Date:   Mon, 24 Feb 2020 19:23:41 +0100
Message-Id: <20200224182401.353359-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224182401.353359-1-jean-philippe@linaro.org>
References: <20200224182401.353359-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

When enabling SVA, register the fault handler. Device driver will register
an I/O page fault queue before or after calling iommu_sva_enable. The
fault queue must be flushed before any io_mm is freed, to make sure that
its PASID isn't used in any fault queue, and can be reallocated. Add
iopf_queue_flush() calls in a few strategic locations.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/Kconfig     |  1 +
 drivers/iommu/iommu-sva.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index e4a42e1708b4..211684e785ea 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -106,6 +106,7 @@ config IOMMU_DMA
 config IOMMU_SVA
 	bool
 	select IOASID
+	select IOMMU_PAGE_FAULT
 	select IOMMU_API
 	select MMU_NOTIFIER
 
diff --git a/drivers/iommu/iommu-sva.c b/drivers/iommu/iommu-sva.c
index bfd0c477f290..494ca0824e4b 100644
--- a/drivers/iommu/iommu-sva.c
+++ b/drivers/iommu/iommu-sva.c
@@ -366,6 +366,8 @@ static void io_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
 			dev_WARN(dev, "possible leak of PASID %u",
 				 io_mm->pasid);
 
+		iopf_queue_flush_dev(dev, io_mm->pasid);
+
 		/* unbind() frees the bond, we just detach it */
 		io_mm_detach_locked(bond);
 	}
@@ -442,11 +444,20 @@ static void iommu_sva_unbind_locked(struct iommu_bond *bond)
 
 void iommu_sva_unbind_generic(struct iommu_sva *handle)
 {
+	int pasid;
 	struct iommu_param *param = handle->dev->iommu_param;
 
 	if (WARN_ON(!param))
 		return;
 
+	/*
+	 * Caller stopped the device from issuing PASIDs, now make sure they are
+	 * out of the fault queue.
+	 */
+	pasid = iommu_sva_get_pasid_generic(handle);
+	if (pasid != IOMMU_PASID_INVALID)
+		iopf_queue_flush_dev(handle->dev, pasid);
+
 	mutex_lock(&param->sva_lock);
 	mutex_lock(&iommu_sva_lock);
 	iommu_sva_unbind_locked(to_iommu_bond(handle));
@@ -484,6 +495,10 @@ int iommu_sva_enable(struct device *dev, struct iommu_sva_param *sva_param)
 		goto err_unlock;
 	}
 
+	ret = iommu_register_device_fault_handler(dev, iommu_queue_iopf, dev);
+	if (ret)
+		goto err_unlock;
+
 	dev->iommu_param->sva_param = new_param;
 	mutex_unlock(&param->sva_lock);
 	return 0;
@@ -521,6 +536,7 @@ int iommu_sva_disable(struct device *dev)
 		goto out_unlock;
 	}
 
+	iommu_unregister_device_fault_handler(dev);
 	kfree(param->sva_param);
 	param->sva_param = NULL;
 out_unlock:
-- 
2.25.0

