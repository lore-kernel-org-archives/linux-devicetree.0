Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2515C83000
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 14:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7888020757
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 14:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GdxqERSg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgD3Okd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 10:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728189AbgD3Okc (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 10:40:32 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FAEC035494
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 07:40:31 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i10so7209456wrv.10
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jRLktX4Fv4UiegcQ1XKfrXB/TH8/LTOUgoi8xC3haZQ=;
        b=GdxqERSg6Wq+QjSLrDklObgdKsWyrI/p2A6U4BFEZlyPUG/0SIcCQinPURmpCcRIjv
         3f5gJe4XY/u6yERJf9AwN+ZPq2bItwT/fSCgvMu08smasfLjOjOJxGrn+O0ElEcXqAXt
         3mpjlsAkdnOtr7eBUEquFjghsowytMyHCnwJbMdBG1W0oE7FrywpRTw78nLWSLKbfC7S
         +MhVK+j71pwZaHQOdr2Gde0ZOYTVwaFzIBka+fFjE+PTE5NEpEV43oSc/LN4IXGD6VD0
         4/CBaxt0Jike33CwfczPG3OxP+5W0s6u1z+Du0kqJEI8+0UBC180s6/Oj/dEyXpErCLG
         4rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jRLktX4Fv4UiegcQ1XKfrXB/TH8/LTOUgoi8xC3haZQ=;
        b=qZLXcBUmo/1Fpq8kfE325yAfpDmWZUtwIhNsvw9nLeroNSr3d2mbUK33p3jhx9T3pt
         JUeVqkIOeM2DcvabbH8xuOkgPxlrCdRB8b1J5VveIB/Tff+dus5MgsVy4ruC90hFaJiZ
         hZvGBYuUAG5ceTZ+thEHkKmSxgnIgMK/Mstodwqc11FHXjvIHrENw3UFl5tJldFSoYcp
         d52KXjULQi5qFksct+FgGfZhmeByx7nzR0diyD1+1c8ucR21Y5NMY82seGjx1nUXKwQi
         C2v5FfGsyQk+sjk913vBBkANLlQhvPd3hx6QfG6UE8ZN/2l9pqQBF7O3behNSH5hZjhm
         tmFg==
X-Gm-Message-State: AGi0PuYRl6y9nS1fsgt+mpbaFcy41xGbTtQwK3HWq+a/ThAKjY/ab5n+
        9/f4Km2SJCeYMEsiMDjawSXuxw==
X-Google-Smtp-Source: APiQypKGnRA3rC4LIOfEdPstuV2izIDoWxEDRt3yJJdFAFTW4qtuKV91hxDhmiqWADguGvwulI61dQ==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr4210723wrt.407.1588257630518;
        Thu, 30 Apr 2020 07:40:30 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:226e:c200:c43b:ef78:d083:b355])
        by smtp.gmail.com with ESMTPSA id n2sm4153286wrt.33.2020.04.30.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 07:40:30 -0700 (PDT)
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
Subject: [PATCH v6 10/25] arm64: cpufeature: Export symbol read_sanitised_ftr_reg()
Date:   Thu, 30 Apr 2020 16:34:09 +0200
Message-Id: <20200430143424.2787566-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430143424.2787566-1-jean-philippe@linaro.org>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SMMUv3 driver would like to read the MMFR0 PARANGE field in order to
share CPU page tables with devices. Allow the driver to be built as
module by exporting the read_sanitized_ftr_reg() cpufeature symbol.

Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9fac745aa7bb2..5f6adbf4ae893 100644
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

