Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF18FC433ED
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 18:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D60D0207D3
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 18:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HkelvqOK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgESSBy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 14:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728290AbgESSBx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 14:01:53 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F18CC08C5C0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 11:01:53 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id 50so367351wrc.11
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 11:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tdr2nbJDVREjEd6opf3N1PUExNDbBuhp6Y6q/Aa2PEk=;
        b=HkelvqOK2ASLLh8prk/cDS5hZTdQU9xrr2V3ZxvDu0Sq7ohsTnzBnIMz0gnehYydrd
         QbNe0r28o6KsNU4c8jG6/OECzBTt1dgbKqKBO3Hy9R096LEbCLBtm5fJCXyPcoLUqC7z
         nJYdYMckvaByveD0Pss3OR0UJ2rAqvk1aa9NiHwQWgUQzWYyPlH/WdC5rnr0FA7nXTHT
         wUy4E18JFZwuckNo0n2C9EJ91f2GqeXNIr2Vo1ubIjolcQVPov+bsWVCo6uVm3u+gguw
         ifDXz+1XuUSPfCuU2aV4GnReJ1qkGO0jRWJcKZ8SusFCa4UK2engyDtkMxBFLorw/oqX
         3ZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tdr2nbJDVREjEd6opf3N1PUExNDbBuhp6Y6q/Aa2PEk=;
        b=rHmAGDa676Hjkw6E0ESO4ttlc1hoGZtoYvxdTQK4LhcIHiyRbeY+ETdEH0GTOdAC3V
         203yaw52X9RgCV7BQe73EehK6ykvtqFFExjXTKq03U8sJZAPf1m1F0+miCE8bVfyVmux
         6DwV4xoR/jiXlpMuwZ5Io8oVuIFpODONsCYdaJnoi/1ylrg4Kpp2US29sBL40GC/yQ2B
         aUzf5x+uPaDUscfj5qx9SoieMhl2gwUqS2Cc2Q21kLVKT9u7WuKKgIk+Br1YYcdPopn6
         GpHs73DApHRZp6zkL+VQVzerxFO12qx+G+ZHpkaEhUMRGzVHgQZiMVt1YrMtbjY2UdbO
         rgvg==
X-Gm-Message-State: AOAM530C9++DA6KgvZlK0DtPE/NUw1I4m86Gg7vuwnkgpLychvoHYWOp
        M+CBEQF0RmCC0QIyqJJy9h2Uug==
X-Google-Smtp-Source: ABdhPJynWLyIUGdI5MUqsN8GOzUd3ADLnVQan+95nD7CN0va9fcQVLO9UHUTvmOnyfYBlYSmz6uVWQ==
X-Received: by 2002:adf:c508:: with SMTP id q8mr125580wrf.4.1589911312245;
        Tue, 19 May 2020 11:01:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:226e:c200:c43b:ef78:d083:b355])
        by smtp.gmail.com with ESMTPSA id 1sm510496wmz.13.2020.05.19.11.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 11:01:51 -0700 (PDT)
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
        Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v7 09/24] arm64: cpufeature: Export symbol read_sanitised_ftr_reg()
Date:   Tue, 19 May 2020 19:54:47 +0200
Message-Id: <20200519175502.2504091-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519175502.2504091-1-jean-philippe@linaro.org>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SMMUv3 driver would like to read the MMFR0 PARANGE field in order to
share CPU page tables with devices. Allow the driver to be built as
module by exporting the read_sanitized_ftr_reg() cpufeature symbol.

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9fac745aa7bb..5f6adbf4ae89 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -841,6 +841,7 @@ u64 read_sanitised_ftr_reg(u32 id)
 	BUG_ON(!regp);
 	return regp->sys_val;
 }
+EXPORT_SYMBOL_GPL(read_sanitised_ftr_reg);
 
 #define read_sysreg_case(r)	\
 	case r:		return read_sysreg_s(r)
-- 
2.26.2

