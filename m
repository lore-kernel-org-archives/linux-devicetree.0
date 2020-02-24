Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFB0C38BEA
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:25:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85E2F2084E
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AaB0/woq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgBXSZA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 13:25:00 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36115 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728078AbgBXSY7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 13:24:59 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so358051wma.1
        for <devicetree@vger.kernel.org>; Mon, 24 Feb 2020 10:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L4b0/E9FteCzWtJ3m41x7utj4DLNM6J+Wsoo7xEmR/M=;
        b=AaB0/woqy++LPMkoIBZ+m4G2UZnpMtnZvwcO6++TMOA9EU96huOkx2S0UskmT4cEpU
         xMrifrssPWkaFWKgEl2sH4pudtTv9O5xP8UA1tGUign2rkYDTr5uz/QuiZzooFCt1UtE
         rFYtkQKLo4kgyRbPCGQdQ0RkTH5WIdikmyUEt5mlxrO2m5pQuEYSi3SrHoKPrs6ir6C0
         h1xnyNfpSIa1Ci4ubWuYL1OusT1Jg5137L60+g+2IYH6Io8VN2+J8l0BSyTJWIJ6meQH
         bVi7Q64CjqZ4FvWJAUKwwHkRMFvfOpZv/R9jAdlHM31BS2Lo6e6itFaGlBgY5e1Zdzw/
         2HxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L4b0/E9FteCzWtJ3m41x7utj4DLNM6J+Wsoo7xEmR/M=;
        b=tItwxFRaL20tqesZ+z655mv+n+VO5rp1pAuCBSLCEmxKqWVFU6HmOaUrNn6cpSbNTW
         GNsP/xC7JVNNZtXnmj+KQObyDzgAa6HGONQwY2L5yOtGNxLO9VG3cMZRurMdA0bxiEje
         2CUOhm0JR2FAYBSS0Wi3ZtKmi2irSu/Mkp8oK7PPNesvy3Hw8uslItuCBk3Ay78TvCAQ
         iikcdyjrVkb3S5A8Gq+w1G0zB4tk/lpdVaRwHbAfWI8mCLZHqivHxP6ORozxKAa3/Fm0
         pYgqA0op+xoXMCnDbnqsQjJTsnQopLCyk1xDZ5lLCcrFClxgYxXOHI9QDhjKkq0aZ+56
         tSPg==
X-Gm-Message-State: APjAAAV+Iyv1smheLIEkBF9cifQMgCuSQwllfO3Kc80vKk/ly4GUbd9o
        epkQP6IWY9YPq3hQeoHYZxf3KQ==
X-Google-Smtp-Source: APXvYqx6ypZ/kM3sOzy1vTskWfaUURVJkjgEhRCiqvXYI27Ek63kaa7GG0Ur7iiefNgxz5pwggvx6A==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr296154wmj.61.1582568697369;
        Mon, 24 Feb 2020 10:24:57 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id n3sm304255wmc.27.2020.02.24.10.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 10:24:56 -0800 (PST)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org
Cc:     joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com,
        catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
        kevin.tian@intel.com, baolu.lu@linux.intel.com,
        Jonathan.Cameron@huawei.com, jacob.jun.pan@linux.intel.com,
        christian.koenig@amd.com, yi.l.liu@intel.com,
        zhangfei.gao@linaro.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v4 25/26] PCI/ATS: Export symbols of PRI functions
Date:   Mon, 24 Feb 2020 19:24:00 +0100
Message-Id: <20200224182401.353359-26-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224182401.353359-1-jean-philippe@linaro.org>
References: <20200224182401.353359-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SMMUv3 driver uses pci_{enable,disable}_pri() and related
functions. Export those functions to allow the driver to be built as a
module.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/pci/ats.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index bbfd0d42b8b9..fc8fc6fc8bd5 100644
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
2.25.0

