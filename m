Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF11C54FD2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 17:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6120206A2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 17:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQc1HJyS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391553AbgDNRE5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 13:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391609AbgDNREy (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 13:04:54 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A05BC061A0F
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 10:04:53 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y24so14907135wma.4
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vE2itLZu3hqvC4LzqU2NUCFx+9C8ab/nGgmunlfocw4=;
        b=GQc1HJySAIFGl4e9JGBFURgN/vl21Fb+oCGY0ghVUDlr5r96ZmZmw/X83yVkMwCMvt
         DVAASgUR/v3/ZKBKl9O60CQVrNvn4oMMVLsH3g9JXWg+IeYIxVCppffgWVDw7kFLs+SL
         qL185/o63pqZqsBw6EgV8XD0/UHJpB1qI+n6vwa7Qv2mwO4fdLqiqOvJiR2hZWZH7Me1
         eoakZAu9sIB1oOiShcxlx+56zauDP7aBZBVxrI01fRfnSKCQXLcXyLhFUPuBdcSxvOTp
         gidl1cZtbaXu5tx9otKpXSBohIzzToXZC0tS5fggLOAxV0+H42kV0oHqDEtXsMF2hNlm
         qwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vE2itLZu3hqvC4LzqU2NUCFx+9C8ab/nGgmunlfocw4=;
        b=hMWX12E/Hf5/xgEvldFGFOrnKGD2Cce/6nUQIGpMleY5aIXpkg8wNV2koivuqHrccD
         h+5r++ek/jjPC16AaqRoPv+/LUYGdpBLHzsUGKmU2002PoZY12pPnSyI9bvfWDxMcjOh
         1U8NRawg8k1IeSNBK+CIoO80b1Azn0p6UrEUdUYe1SHrd55UNvDpwHhBOD33yGjQlCse
         Y6MRAeH5TjsAnRQgQhqRqzWLfsJjC/pCaz5FEdr8hF7sfetpbXuJ2dN1qbz5FfScrdHK
         2MVUyX9Dao5v/HV01t6hgjftlM8WFxG/jg9MHaUGYfCE2wzogfoLRpgA3Q5n9m4B8HDn
         K6uw==
X-Gm-Message-State: AGi0PuZAj+i6OguNTLPuWXr+XgkLPDqGud9ptvMkefQPeityjyyuWGVC
        /M4VnlyXKp1+FBqAyzqBFnTPSw==
X-Google-Smtp-Source: APiQypIBMdNPHOZOhnCMJH0FJPJY2Rdi+r/VG4B2wmIYz2z44PksUMUJ1Q8ZKmB8ryyXqmfTYJG52Q==
X-Received: by 2002:a1c:3c08:: with SMTP id j8mr814017wma.30.1586883892098;
        Tue, 14 Apr 2020 10:04:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id x18sm19549147wrs.11.2020.04.14.10.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:04:51 -0700 (PDT)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org
Cc:     joro@8bytes.org, catalin.marinas@arm.com, will@kernel.org,
        robin.murphy@arm.com, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, Jonathan.Cameron@huawei.com,
        jacob.jun.pan@linux.intel.com, christian.koenig@amd.com,
        zhangfei.gao@linaro.org, jgg@ziepe.ca, xuzaibo@huawei.com,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v5 24/25] PCI/ATS: Export PRI functions
Date:   Tue, 14 Apr 2020 19:02:52 +0200
Message-Id: <20200414170252.714402-25-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414170252.714402-1-jean-philippe@linaro.org>
References: <20200414170252.714402-1-jean-philippe@linaro.org>
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
2.26.0

