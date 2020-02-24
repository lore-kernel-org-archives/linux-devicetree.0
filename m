Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0F6C11D35
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:24:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EE0224656
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k7mwUwe4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgBXSYg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 13:24:36 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34514 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727922AbgBXSYg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 13:24:36 -0500
Received: by mail-wr1-f68.google.com with SMTP id z15so3239456wrl.1
        for <devicetree@vger.kernel.org>; Mon, 24 Feb 2020 10:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t1PrCtZ92DmYIwAPbSp2v0XRYBlM5YZLGBrm+uzQwJw=;
        b=k7mwUwe4f2eaHon/rtOusNwQtFja3+krXzwRGZ76SMD3QIwZYajs0PGl8nhuOu3e/Q
         1apHjKKThGa9F78oa6DJmFMg6Kv3M0zbTmO8+Eugcb2SS/fYXhJ75yn9RhWShh6+ftqW
         SUfddUdmPp4ujwFKVXozNBlY07/fSNyDISwYswJ30vRiZLJreuqTJ9fsed4djsvvIOny
         CMUJVS9RaKMUHia7+nXA9mZRl4QIa/ovZElpv9c2ACyb/VTFsnCnfWqipmg5gOCNeNSo
         PYeBPGGuW7xmjQCqEwsgxBu69OnvQazgX6XmX1S0LvnK/9wPepXn8vuUv4vl+VoCv6/L
         MvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t1PrCtZ92DmYIwAPbSp2v0XRYBlM5YZLGBrm+uzQwJw=;
        b=O3NMjLSlH2RVSoXCX0QEnXPgKnMQn13HjbqWGNi6DNs5L1YGFgOzMTUq5wZ0Ppk/DD
         PXT9QWEUMtixQlWLaiCTo3AH5D60KtSWNgowNChUb3e4JlmegyRhoOeEYwferlteGF7s
         vS0L/uoMXKaq51etJW5Ceo+sfjLOAkbHGasOuD8lDG1j1/jERgAp4zKh9HykJt8gxMsf
         xc14tcKmf+VH866gUjo1rLaxQ83dX6mgoqufxcRRFIGPoHaZo4+pRQdp1A4edjdSKaXU
         Y49xrnSu4blKTJj/fRbufLbOGzklzMdotjOap1PU3/KtkC2aGBCiH1gEJ9M2536rbn1F
         dUDw==
X-Gm-Message-State: APjAAAWO5muJfUt14avC402KTn0fGqp2xPDCvnEYd+lZnJoaI2yZOxc/
        63ZPDBbgnEvsqktCJYgVFpaTIQ==
X-Google-Smtp-Source: APXvYqyJoaGCAZwRcxK03cHvWfZ3rPd9BodvC//3q8tPBefjV5p8k/3KCURkzx9rn1YbvnVHRvzLqg==
X-Received: by 2002:adf:e908:: with SMTP id f8mr4337597wrm.37.1582568674081;
        Mon, 24 Feb 2020 10:24:34 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id n3sm304255wmc.27.2020.02.24.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 10:24:33 -0800 (PST)
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
Subject: [PATCH v4 04/26] iommu/sva: Search mm by PASID
Date:   Mon, 24 Feb 2020 19:23:39 +0100
Message-Id: <20200224182401.353359-5-jean-philippe@linaro.org>
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

The fault handler will need to find an mm given its PASID. This is the
reason we have an IDR for storing address spaces, so hook it up.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/iommu-sva.c | 19 +++++++++++++++++++
 include/linux/iommu.h     |  9 +++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/iommu/iommu-sva.c b/drivers/iommu/iommu-sva.c
index 64f1d1c82383..bfd0c477f290 100644
--- a/drivers/iommu/iommu-sva.c
+++ b/drivers/iommu/iommu-sva.c
@@ -559,3 +559,22 @@ int iommu_sva_get_pasid_generic(struct iommu_sva *handle)
 	return pasid;
 }
 EXPORT_SYMBOL_GPL(iommu_sva_get_pasid_generic);
+
+/* ioasid wants a void * argument */
+static bool __mmget_not_zero(void *mm)
+{
+	return mmget_not_zero(mm);
+}
+
+/**
+ * iommu_sva_find() - Find mm associated to the given PASID
+ * @pasid: Process Address Space ID assigned to the mm
+ *
+ * Returns the mm corresponding to this PASID, or an error if not found. A
+ * reference to the mm is taken, and must be released with mmput().
+ */
+struct mm_struct *iommu_sva_find(int pasid)
+{
+	return ioasid_find(&shared_pasid, pasid, __mmget_not_zero);
+}
+EXPORT_SYMBOL_GPL(iommu_sva_find);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e7bc47ba24f8..e52a8731e7a9 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1091,6 +1091,15 @@ void iommu_debugfs_setup(void);
 static inline void iommu_debugfs_setup(void) {}
 #endif
 
+#ifdef CONFIG_IOMMU_SVA
+extern struct mm_struct *iommu_sva_find(int pasid);
+#else /* !CONFIG_IOMMU_SVA */
+static inline struct mm_struct *iommu_sva_find(int pasid)
+{
+	return NULL;
+}
+#endif /* !CONFIG_IOMMU_SVA */
+
 #ifdef CONFIG_IOMMU_PAGE_FAULT
 extern int iommu_queue_iopf(struct iommu_fault *fault, void *cookie);
 
-- 
2.25.0

