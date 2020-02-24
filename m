Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31637C352A5
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 019E42084E
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDRHKweD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgBXSYn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 13:24:43 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39207 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727922AbgBXSYm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 13:24:42 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so2768772wrn.6
        for <devicetree@vger.kernel.org>; Mon, 24 Feb 2020 10:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fiWmOcLAVe+tVXhcsvVE1DFO1O4ryIgAcLdwqW0ca+M=;
        b=pDRHKweDnlBKRULwy0ik0zwEBtEv1j2cgrRKvimaQC6F87phqKiS6hoWHYe79Woxaq
         dvU2Y+udalR1IWc9MZSMY0Zs5f9NdIHxKJhYe9t+iiuM18v5G9IPkB7YyVsl1xvn6G0k
         Lyx8J36rm2ynK9P22EeAO7k6RYA6roW1f6WRVmaqmmlmQjHQxIyE4MBbDQS/EJmu3I3p
         Qd3S4xWYoA2d1rHcA8AWP0OW4En+tWRi+9rXYw9g503nUnZih/bJ/n2/yoE090xj2LJU
         H5r4hDx2HFNGusqI0S9/YfyB+pnbzKC6Jhc3+KlEeOqTYu+SoSFgOQm1PAsvdd7NVhoF
         WL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fiWmOcLAVe+tVXhcsvVE1DFO1O4ryIgAcLdwqW0ca+M=;
        b=ObC9Qq3keOAr4RrS7xilXOJu8ww2m51wv9SWjbt3/82tDheSG5eYq7S5xU6D0r3MuR
         3aDXp9JuCnSKIGiUHYD6B3PIooA4Cix6yZ9/m6J1sHeNwHykezZfKSA9DUmCVzv8ZItm
         02lISJdJSbxszr/+DNelulfSl8vZyLoXp2xGUTqMP4jvTzofPsreNiaSWTTrOzwmkadz
         nwLiRRavju1GqWW0dGm1ka06cwKvbjmczss7BIJLVhPkjuqBGD4ayszob5uN8tVgXSPA
         HJBfMq8SoAa098nG/ZNmZV8l1J2OyjduETYCuO5VfWq+p/JE0mMzjXLnfWsoVnP19raM
         cH3Q==
X-Gm-Message-State: APjAAAW4U5FKl+UBEe1WIJ+irt0rsTmdBGLnPXpz93eRnTzF2q6keWXG
        ECksKx/Ft2mCJV8ERfAIy5/2UA==
X-Google-Smtp-Source: APXvYqz8CuJxubqS6SRPcAebK5WrAwOgc3vNvNYTHpZ8VXVrF/jAhnwu+rN8D9EGJiHbmYtTOasOQA==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr65031300wru.87.1582568680476;
        Mon, 24 Feb 2020 10:24:40 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id n3sm304255wmc.27.2020.02.24.10.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 10:24:40 -0800 (PST)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org
Cc:     joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com,
        catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
        kevin.tian@intel.com, baolu.lu@linux.intel.com,
        Jonathan.Cameron@huawei.com, jacob.jun.pan@linux.intel.com,
        christian.koenig@amd.com, yi.l.liu@intel.com,
        zhangfei.gao@linaro.org
Subject: [PATCH v4 10/26] arm64: cpufeature: Export symbol read_sanitised_ftr_reg()
Date:   Mon, 24 Feb 2020 19:23:45 +0100
Message-Id: <20200224182401.353359-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224182401.353359-1-jean-philippe@linaro.org>
References: <20200224182401.353359-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SMMUv3 driver would like to read the MMFR0 PARANGE field in order to
share CPU page tables with devices. Allow the driver to be built as
module by exporting the read_sanitized_ftr_reg() cpufeature symbol.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 0b6715625cf6..a96d2fb12e4d 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -838,6 +838,7 @@ u64 read_sanitised_ftr_reg(u32 id)
 	BUG_ON(!regp);
 	return regp->sys_val;
 }
+EXPORT_SYMBOL_GPL(read_sanitised_ftr_reg);
 
 #define read_sysreg_case(r)	\
 	case r:		return read_sysreg_s(r)
-- 
2.25.0

