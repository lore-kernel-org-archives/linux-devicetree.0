Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D312FC47255
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 14:40:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3F102074A
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 14:40:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="To4rDTgB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgD3OkT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 10:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727025AbgD3OkT (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 10:40:19 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72815C035494
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 07:40:17 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u16so2203141wmc.5
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JE1ADcc++3Vo3M85Nsq6iA6oMNESnLaCpD2Oim3Sh4w=;
        b=To4rDTgBB0L+90TpdlToDyTHhOTZj6qgWdXHCq8rL1YycyE+18LW7Zf89m+U1MgVk8
         +89saYtKLC3GQTyPik+jhwX+aQBQqrNZ4WAaBc81x5L7V2vIZ7XFNEV/ge8dD5ZI3D5c
         Ky1IsNUlR6HCYrPrzPKso3RM3HEViU0cFo2w3w0DZL/QuZLpSZOx9atlH5Jsmi0Ms8Vr
         u2AWoTd5OM4H1HJBzbAVpKLc8NupQiOKgBHwOjQ95DBXB8CytUigHuiBI45tM4iuk42Y
         bxPd271XeYNTljj1NAR5ciuWUHZ4qD6eBIS0O6tVRLdGsDXU0GOH+yzvHKWV4kkY+zxV
         HwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JE1ADcc++3Vo3M85Nsq6iA6oMNESnLaCpD2Oim3Sh4w=;
        b=dtDbDGNKu5TsywLBArme4HEkDB3a2iHG+VGbWZ6QAWlxaNQ0JccVLTuhP0RIq/NkXF
         UUTnugws9PFhgb+HBRAO235R27R/4gEeh1nv4mtJo7ur62oyCw9ZhliatQZvJBIr/o6D
         YW+1GP8c7THe47tCnu5quw/JHdwVXPUsTRf8tziFDJ2lRe8HjzQL85wgBcUeCSLRx6b9
         Lr4ZfYRfY8nKJYtYGOy6y7kIfttsTUDjKTAx/WxfZ2I7/btQ9KcUYwBxJlhmztBRVKJN
         Q8QJFxAyZ8xI8Hf7L4X84+63ZRSPU1vpdbA9j+Qr6M99Yf4Vz1diuRZF9OgmRmbWiM31
         tx9Q==
X-Gm-Message-State: AGi0PubYLHQ8/8gOBjR+cfrkuf4sEqegz45sdqKBqphyShZSsUAPibDt
        eqFypsudeN2DVzmWc9kCoIsw6Q==
X-Google-Smtp-Source: APiQypLUKpU9EiJvK1iecbIeHBOlrvMyuNzM5Gu2fzf4ff9woYknhWdO7VYVk5snGgyndqBMx/wwdg==
X-Received: by 2002:a1c:7d15:: with SMTP id y21mr3195383wmc.57.1588257616098;
        Thu, 30 Apr 2020 07:40:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:226e:c200:c43b:ef78:d083:b355])
        by smtp.gmail.com with ESMTPSA id n2sm4153286wrt.33.2020.04.30.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 07:40:15 -0700 (PDT)
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
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v6 01/25] mm: Add a PASID field to mm_struct
Date:   Thu, 30 Apr 2020 16:34:00 +0200
Message-Id: <20200430143424.2787566-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430143424.2787566-1-jean-philippe@linaro.org>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some devices can tag their DMA requests with a 20-bit Process Address
Space ID (PASID), allowing them to access multiple address spaces. In
combination with recoverable I/O page faults (for example PCIe PRI),
PASID allows the IOMMU to share page tables with the MMU.

To make sure that a single PASID is allocated for each address space, as
required by Intel ENQCMD, store the PASID in the mm_struct. The IOMMU
driver is in charge of serializing modifications to the PASID field.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
For the field's validity I'm thinking invalid PASID = 0. In ioasid.h we
define INVALID_IOASID as ~0U, but I think we can now change it to 0,
since Intel is now also reserving PASID #0 for Transactions without
PASID and AMD IOMMU uses GIoV for this too.
---
 include/linux/mm_types.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 4aba6c0c2ba80..8db6472758175 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -534,6 +534,10 @@ struct mm_struct {
 		atomic_long_t hugetlb_usage;
 #endif
 		struct work_struct async_put_work;
+#ifdef CONFIG_IOMMU_SUPPORT
+		/* Address space ID used by device DMA */
+		unsigned int pasid;
+#endif
 	} __randomize_layout;
 
 	/*
-- 
2.26.2

