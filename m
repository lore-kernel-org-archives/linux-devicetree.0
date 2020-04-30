Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA92CA9060
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 14:40:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBFA02074A
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 14:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y8F2CAh6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgD3Oks (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 10:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728307AbgD3Okr (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 10:40:47 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8EFC035495
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 07:40:47 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u16so2205726wmc.5
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=62jj6X1LyxzprUaI/fsrszNvC/iCvzNFlzOxzXxMTmE=;
        b=y8F2CAh6V2jZZ6B8MaXX8bNU3xhjF6A6xftgKRo5JNfOivZ4u0mxU5xIR4pAdncRts
         6l7bUbk1qPf11fVOJF5ftAX+YvaRJ8cXFwCudw6bxApeZPCZrXZtaaHXtPfThk5Jco3K
         a/O5NV8b14TR6O3KF9WIkjjfc/Gcv12HGrAm6m8EO0m1BeQXzRMZnOhib6MYqbtHBwsT
         sErFA6eMmDmS52FVu+QrR1ltOzaQfn2PJ62g8elC51l52AIXrpu8StMl/Go2TPf2eTs+
         JpTwIf91IA6+h7AHE7yatTK0354lTEslYrLGPhBE1Hb4pA4bdkCtICpgF+meBh7cqw9n
         5sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=62jj6X1LyxzprUaI/fsrszNvC/iCvzNFlzOxzXxMTmE=;
        b=KwX3tpglApY4OznC5skMxP0Tgza53fjRm8Z3jZ1VSvAhtRqj0KL/sibxDmTZFswHFl
         MIbrU5xBcrqjrBd8VfWXFOxCMCDhCOf5dK8HJdYfCVzT8Ijud1vpSKQITsa3n4OBlw25
         KCsGkgBK5OU5nnnz3W4EEc7Tawuivux45eMUyn8L6epUTM40FlvAjmoG0zfhM1Papc53
         XC4m8467BR2fOb0yGcgbqmubqSUfdXXlx6fmXBy+fKCq2EwLf+trui8UPcG1OQzQup+O
         F73QbHU4GbsEOcJ9xBEIn51urOtkSWmlgi3aGIOLp1j+9h6O7fexD1Bsbowd9AjGQP4C
         RO3Q==
X-Gm-Message-State: AGi0PuZFwGWeYd0LJpgzdXn088ZOQPQ8FGHXNu4IIcG1FqqnhDsOxpNx
        8U+ZJRFbGyVmgBOWyTv3pQxx7Q==
X-Google-Smtp-Source: APiQypKtLi1Ei7GLEgyORO8pAsx6cVgJjSvoyoPjqzURXKE3LoS9Wil8gnTZulxN2y2v3ecbYlihTA==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr3533862wmc.83.1588257646202;
        Thu, 30 Apr 2020 07:40:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:226e:c200:c43b:ef78:d083:b355])
        by smtp.gmail.com with ESMTPSA id n2sm4153286wrt.33.2020.04.30.07.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 07:40:45 -0700 (PDT)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org
Cc:     joro@8bytes.org, catalin.marinas@arm.com, will@kernel.org,
        robin.murphy@arm.com, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, Jonathan.Cameron@huawei.com,
        jacob.jun.pan@linux.intel.com, christian.koenig@amd.com,
        felix.kuehling@amd.com, zhangfei.gao@linaro.org, jgg@ziepe.ca,
        xuzaibo@huawei.com, fenghua.yu@intel.com, hch@infradead.org,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v6 23/25] PCI/ATS: Add PRI stubs
Date:   Thu, 30 Apr 2020 16:34:22 +0200
Message-Id: <20200430143424.2787566-24-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430143424.2787566-1-jean-philippe@linaro.org>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SMMUv3 driver, which can be built without CONFIG_PCI, will soon gain
support for PRI.  Partially revert commit c6e9aefbf9db ("PCI/ATS: Remove
unused PRI and PASID stubs") to re-introduce the PRI stubs, and avoid
adding more #ifdefs to the SMMU driver.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/linux/pci-ats.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
index f75c307f346de..e9e266df9b37c 100644
--- a/include/linux/pci-ats.h
+++ b/include/linux/pci-ats.h
@@ -28,6 +28,14 @@ int pci_enable_pri(struct pci_dev *pdev, u32 reqs);
 void pci_disable_pri(struct pci_dev *pdev);
 int pci_reset_pri(struct pci_dev *pdev);
 int pci_prg_resp_pasid_required(struct pci_dev *pdev);
+#else /* CONFIG_PCI_PRI */
+static inline int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
+{ return -ENODEV; }
+static inline void pci_disable_pri(struct pci_dev *pdev) { }
+static inline int pci_reset_pri(struct pci_dev *pdev)
+{ return -ENODEV; }
+static inline int pci_prg_resp_pasid_required(struct pci_dev *pdev)
+{ return 0; }
 #endif /* CONFIG_PCI_PRI */
 
 #ifdef CONFIG_PCI_PASID
-- 
2.26.2

