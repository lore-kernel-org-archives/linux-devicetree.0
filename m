Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B54CA9066
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 14:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E90C720757
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 14:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ond7VfsZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbgD3Okt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 10:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728307AbgD3Okt (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 10:40:49 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979A9C08E859
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 07:40:48 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e26so2151043wmk.5
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S8Zr7dUhZQI4HWh04x7nsOmPtJZbUwXznxGwACU1UQI=;
        b=Ond7VfsZgmGD/BrByxf9wz0efWlE1iwXffnfpfQfxt1hg9QT9Xs5mqM2Rr/FizdA+e
         IWEBTJhCC4xfsNHrlhEGfHF9LwPrU4ybRmBqXvtCSAgzt+kjb8RoWZdz70Mg491WTSOe
         epwnq/qI820d8QDoeGKyaC2M9DH6QVrxTbYbk7wjnrLB0OisjPj7hQm/Iz0c1B5TAdEy
         ik9JR0/fhw2dfKLEjNH/AByP8RBN8Rk7hu0iTumPKK6WIizh0K1GhVzR4dxhvfJc9gJo
         ci1084DYu6K879DUlLLGSCP2fM9vSK7OyOiumE/wAKaIBFk1KrHnIPzL9xfVwpktSlDF
         GFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S8Zr7dUhZQI4HWh04x7nsOmPtJZbUwXznxGwACU1UQI=;
        b=J8IWzXmxV1O4nKkpzfEZYwOC4hRBjCVN52G4o5JBUc9W7tWmsRC7NpHNW407/w2Fko
         k5djIaHxZYOKS18OVIByFKPmLHdbWysrKhU+YsidpGaVsEwkWO+6NNmn8UGGpOxH4kRm
         oPXAbdH+0GxzCMPmP912OWrUaYuqmnNv+cpi1gGU58G2EVAr9MK6HcFrVcpOOJqAaqpN
         0uXWzwlATAbtp8rRfNnIRjYSPfGdUAGR8g4WUpxbzFpD0gI4P7qNpiV7+/VcYjBLQAoK
         ZipdZknGATTMDmazryCasAlEO1hTYAu5jur3S3bZW+vGDjlfSYGyKk5uVaC+tqVnxNq2
         mtPw==
X-Gm-Message-State: AGi0PuaPl2nBAvep4bhB3HHmj4VdSHkse7EbTeaFFm1PQiLaigKRjhNU
        RdWE1Pyx75lII2XTXbuKiKAOZA==
X-Google-Smtp-Source: APiQypJa6BmZ0czrxG/gUnFompMSHFZ8UIvLo+IeAtRqA371so/Ns388yHVshP+vFCzW1022DPCjrw==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr3126384wmc.146.1588257647382;
        Thu, 30 Apr 2020 07:40:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:226e:c200:c43b:ef78:d083:b355])
        by smtp.gmail.com with ESMTPSA id n2sm4153286wrt.33.2020.04.30.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 07:40:46 -0700 (PDT)
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
Subject: [PATCH v6 24/25] PCI/ATS: Export PRI functions
Date:   Thu, 30 Apr 2020 16:34:23 +0200
Message-Id: <20200430143424.2787566-25-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430143424.2787566-1-jean-philippe@linaro.org>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SMMUv3 driver uses pci_{enable,disable}_pri() and related
functions. Export those functions to allow the driver to be built as a
module.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/pci/ats.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index bbfd0d42b8b97..fc8fc6fc8bd55 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -197,6 +197,7 @@ void pci_pri_init(struct pci_dev *pdev)
 	if (status & PCI_PRI_STATUS_PASID)
 		pdev->pasid_required = 1;
 }
+EXPORT_SYMBOL_GPL(pci_pri_init);
 
 /**
  * pci_enable_pri - Enable PRI capability
@@ -243,6 +244,7 @@ int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pci_enable_pri);
 
 /**
  * pci_disable_pri - Disable PRI capability
@@ -322,6 +324,7 @@ int pci_reset_pri(struct pci_dev *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pci_reset_pri);
 
 /**
  * pci_prg_resp_pasid_required - Return PRG Response PASID Required bit
@@ -337,6 +340,7 @@ int pci_prg_resp_pasid_required(struct pci_dev *pdev)
 
 	return pdev->pasid_required;
 }
+EXPORT_SYMBOL_GPL(pci_prg_resp_pasid_required);
 #endif /* CONFIG_PCI_PRI */
 
 #ifdef CONFIG_PCI_PASID
-- 
2.26.2

