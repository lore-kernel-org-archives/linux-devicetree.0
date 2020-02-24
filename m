Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B69AC11D3E
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:24:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DBE620838
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M99vGkY3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgBXSYh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 13:24:37 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32963 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbgBXSYh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 13:24:37 -0500
Received: by mail-wr1-f68.google.com with SMTP id u6so11606527wrt.0
        for <devicetree@vger.kernel.org>; Mon, 24 Feb 2020 10:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4BAEKhOJP+vfPilA/A1esaPeb85rQ2xVF1xbquVY184=;
        b=M99vGkY31vfp3/5YFldshvaVVuOLujfh7ojFCDTnoKW41IMEWZ1aa749ylDMF02mL8
         EsF76A/xd0+D9G0LiMy/75wIjbUpTj5ggp4qwOihccmc7SvybU8lVP0RrXN+zijYA5Qc
         apJfsPNlPuSkqhHR1soKd4ou/vRywxfhU5WwI8xMxkH50xEZuIxIVA73IGnf8LHXAHCj
         UjbtPVxpTDPbVdR0XSSIE6QUa8HgvKgCyzUv3n8pFmnjopnM1ov1eMApD+8zJk5ozwNB
         OxiUpbtucYRP2+G9IoH1N/DTaBxGAqy/M1yy3lxCR8X1HtuJnfAnMQlEHu+w73fAfXiH
         B1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4BAEKhOJP+vfPilA/A1esaPeb85rQ2xVF1xbquVY184=;
        b=pldLr0VZNyryiFC5eAamzKJGJgKZN+K0zkG1MiL8pG6+/BEz63FUSSuL4eYcQ7bO93
         ueoSRr+TkT1ad4AfOjVRqyMmw5vdIOMIhcr27nArVrmD158l3abpnu1PtIqK+xUflmxG
         w/Y+2oiaSS5LiclZgwS8y7w5KrEuSl3/Tk3ezRCAqjeQrO9PA8jBnYRi8XeUnhDvf5FQ
         sa56dOMCr1hdSpJeK1K2uZqc3nCJxVwQXE16DRbGb9lm9INx2ialKt5+zIhD+I1BBi9a
         8Okb+c1zAR2RKHsOL0X7CGCWnmjYNEM4eT5TEFSJWKKA2Jq0/mw7PKOX90s6ww1mtd5F
         T6MQ==
X-Gm-Message-State: APjAAAXErQ6DaHg7qUGDFDS9CUkXvoAeNQyoTE9lO0F+hhiIgkNTEwDX
        aI5l4XtdLMgorLOVFzRF2qFOHQ==
X-Google-Smtp-Source: APXvYqzHbo1uSnOjPvq1dly/T3bNuAsEH0s+K/Vbu0r956R09tVR+hP/VVgCejHxcU6EI1GRu4bYzg==
X-Received: by 2002:a5d:4651:: with SMTP id j17mr69088399wrs.237.1582568675196;
        Mon, 24 Feb 2020 10:24:35 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id n3sm304255wmc.27.2020.02.24.10.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 10:24:34 -0800 (PST)
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
Subject: [PATCH v4 05/26] iommu/iopf: Handle mm faults
Date:   Mon, 24 Feb 2020 19:23:40 +0100
Message-Id: <20200224182401.353359-6-jean-philippe@linaro.org>
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

When a recoverable page fault is handled by the fault workqueue, find the
associated mm and call handle_mm_fault.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/io-pgfault.c | 86 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgfault.c b/drivers/iommu/io-pgfault.c
index 76e153c59fe3..ffa9f14e0803 100644
--- a/drivers/iommu/io-pgfault.c
+++ b/drivers/iommu/io-pgfault.c
@@ -7,6 +7,7 @@
 
 #include <linux/iommu.h>
 #include <linux/list.h>
+#include <linux/sched/mm.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
@@ -76,8 +77,65 @@ static int iopf_complete(struct device *dev, struct iopf_fault *iopf,
 static enum iommu_page_response_code
 iopf_handle_single(struct iopf_fault *iopf)
 {
-	/* TODO */
-	return -ENODEV;
+	vm_fault_t ret;
+	struct mm_struct *mm;
+	struct vm_area_struct *vma;
+	unsigned int access_flags = 0;
+	unsigned int fault_flags = FAULT_FLAG_REMOTE;
+	struct iommu_fault_page_request *prm = &iopf->fault.prm;
+	enum iommu_page_response_code status = IOMMU_PAGE_RESP_INVALID;
+
+	if (!(prm->flags & IOMMU_FAULT_PAGE_REQUEST_PASID_VALID))
+		return status;
+
+	mm = iommu_sva_find(prm->pasid);
+	if (IS_ERR_OR_NULL(mm))
+		return status;
+
+	down_read(&mm->mmap_sem);
+
+	vma = find_extend_vma(mm, prm->addr);
+	if (!vma)
+		/* Unmapped area */
+		goto out_put_mm;
+
+	if (prm->perm & IOMMU_FAULT_PERM_READ)
+		access_flags |= VM_READ;
+
+	if (prm->perm & IOMMU_FAULT_PERM_WRITE) {
+		access_flags |= VM_WRITE;
+		fault_flags |= FAULT_FLAG_WRITE;
+	}
+
+	if (prm->perm & IOMMU_FAULT_PERM_EXEC) {
+		access_flags |= VM_EXEC;
+		fault_flags |= FAULT_FLAG_INSTRUCTION;
+	}
+
+	if (!(prm->perm & IOMMU_FAULT_PERM_PRIV))
+		fault_flags |= FAULT_FLAG_USER;
+
+	if (access_flags & ~vma->vm_flags)
+		/* Access fault */
+		goto out_put_mm;
+
+	ret = handle_mm_fault(vma, prm->addr, fault_flags);
+	status = ret & VM_FAULT_ERROR ? IOMMU_PAGE_RESP_INVALID :
+		IOMMU_PAGE_RESP_SUCCESS;
+
+out_put_mm:
+	up_read(&mm->mmap_sem);
+
+	/*
+	 * If the process exits while we're handling the fault on its mm, we
+	 * can't do mmput(). exit_mmap() would release the MMU notifier, calling
+	 * iommu_notifier_release(), which has to flush the fault queue that
+	 * we're executing on... So mmput_async() moves the release of the mm to
+	 * another thread, if we're the last user.
+	 */
+	mmput_async(mm);
+
+	return status;
 }
 
 static void iopf_handle_group(struct work_struct *work)
@@ -111,6 +169,30 @@ static void iopf_handle_group(struct work_struct *work)
  *
  * Add a fault to the device workqueue, to be handled by mm.
  *
+ * This module doesn't handle PCI PASID Stop Marker; IOMMU drivers must discard
+ * them before reporting faults. A PASID Stop Marker (LRW = 0b100) doesn't
+ * expect a response. It may be generated when disabling a PASID (issuing a
+ * PASID stop request) by some PCI devices.
+ *
+ * The PASID stop request is triggered by the mm_exit() callback. When the
+ * callback returns from the device driver, no page request is generated for
+ * this PASID anymore and outstanding ones have been pushed to the IOMMU (as per
+ * PCIe 4.0r1.0 - 6.20.1 and 10.4.1.2 - Managing PASID TLP Prefix Usage). Some
+ * PCI devices will wait for all outstanding page requests to come back with a
+ * response before completing the PASID stop request. Others do not wait for
+ * page responses, and instead issue this Stop Marker that tells us when the
+ * PASID can be reallocated.
+ *
+ * It is safe to discard the Stop Marker because it is an optimization.
+ * a. Page requests, which are posted requests, have been flushed to the IOMMU
+ *    when mm_exit() returns,
+ * b. We flush all fault queues after mm_exit() returns and before freeing the
+ *    PASID.
+ *
+ * So even though the Stop Marker might be issued by the device *after* the stop
+ * request completes, outstanding faults will have been dealt with by the time
+ * we free the PASID.
+ *
  * Return: 0 on success and <0 on error.
  */
 int iommu_queue_iopf(struct iommu_fault *fault, void *cookie)
-- 
2.25.0

