Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26428C47255
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 14:40:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF4A22074A
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 14:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKQPK0H1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgD3Okb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 10:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728018AbgD3Oka (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 10:40:30 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C762C035495
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 07:40:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o27so1917161wra.12
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A4g2MUm95A8vqce0Clcy1vClGPiS8qWrRsLIZv825ks=;
        b=UKQPK0H1AfjHhmhias/B6F2uiehuVlmX9uNQaTC/eIERhp1uuCi3NjwqhMPvCkYml9
         TIP9tvDR/dd3/TIlW2XWQ9gEVMVrtKdJT4954SMiKdXJEwvUnGnxLZwZRpAvuVXa/Ryh
         v29bboFRz/NIzieeGHUX/Sk/+LvKRwsY05+gk91gLlfOzc045XTpFNkh1es/T/4EtJdH
         K+ywTD6nGF2EKYFqtcMFpAGKYNV240R+oPuUDDPMjrg7MUM4q5Dl5i/6c8rytMXYUtMM
         bSDsli4HaKlobXA6aKDQb6ZXjkvfqhFvnunxbJ0H35R1n/m6stCpgd2aoqFiyTW3n7x5
         lCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A4g2MUm95A8vqce0Clcy1vClGPiS8qWrRsLIZv825ks=;
        b=gNbm8Jh+KIGpnbde1GsWmlqnyhlcMWh4onRxqxcJ/s/9NtXijwshOjvzAfzH8RltF7
         ym2nqTGEy27sbZwxMh2yEgbOeWR94M9hDyeN88xwUASrAiNUK1NYvQTX7x0Eqb6odmi0
         tj6WAH5rbpvVtWT8bWu91FpEb3VleRxMGTBUP9tTkaJMuYAs/MOIdM97FOxPWd25TQCm
         g/IMhoS9ukVAASwxjKG7RooC8QDsz8C1PnOSZSRjQOBUY1I6/JHkRfmWQyveC5m9uWbS
         APZnP9hbEHCjy8J3qovYICatZ7iYIbxoV+mkcUVFdZOTvXFf0NhVPmz2MODC1Hm2LqEO
         1eEw==
X-Gm-Message-State: AGi0PubX0ZXq+GexM5MNSzKea0V+MFF56jKAf8WqTu6oLIUYfexgojcg
        iMK6IJnhBMIfSX1ld3s+UEA18w==
X-Google-Smtp-Source: APiQypISpfemZuOHOoY/XW6qkuY6DwYhB+l4cJZx0Y+98tF9fBGdV2EJ4CVYyTjwpT8nIv4VWOpAig==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr4170605wrw.353.1588257628116;
        Thu, 30 Apr 2020 07:40:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:226e:c200:c43b:ef78:d083:b355])
        by smtp.gmail.com with ESMTPSA id n2sm4153286wrt.33.2020.04.30.07.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 07:40:27 -0700 (PDT)
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
Subject: [PATCH v6 08/25] iommu/io-pgtable-arm: Move some definitions to a header
Date:   Thu, 30 Apr 2020 16:34:07 +0200
Message-Id: <20200430143424.2787566-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430143424.2787566-1-jean-philippe@linaro.org>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Extract some of the most generic TCR defines, so they can be reused by
the page table sharing code.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v5->v6: Update MAINTAINERS
---
 drivers/iommu/io-pgtable-arm.h | 30 ++++++++++++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c | 27 ++-------------------------
 MAINTAINERS                    |  3 +--
 3 files changed, 33 insertions(+), 27 deletions(-)
 create mode 100644 drivers/iommu/io-pgtable-arm.h

diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
new file mode 100644
index 0000000000000..ba7cfdf7afa03
--- /dev/null
+++ b/drivers/iommu/io-pgtable-arm.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef IO_PGTABLE_ARM_H_
+#define IO_PGTABLE_ARM_H_
+
+#define ARM_LPAE_TCR_TG0_4K		0
+#define ARM_LPAE_TCR_TG0_64K		1
+#define ARM_LPAE_TCR_TG0_16K		2
+
+#define ARM_LPAE_TCR_TG1_16K		1
+#define ARM_LPAE_TCR_TG1_4K		2
+#define ARM_LPAE_TCR_TG1_64K		3
+
+#define ARM_LPAE_TCR_SH_NS		0
+#define ARM_LPAE_TCR_SH_OS		2
+#define ARM_LPAE_TCR_SH_IS		3
+
+#define ARM_LPAE_TCR_RGN_NC		0
+#define ARM_LPAE_TCR_RGN_WBWA		1
+#define ARM_LPAE_TCR_RGN_WT		2
+#define ARM_LPAE_TCR_RGN_WB		3
+
+#define ARM_LPAE_TCR_PS_32_BIT		0x0ULL
+#define ARM_LPAE_TCR_PS_36_BIT		0x1ULL
+#define ARM_LPAE_TCR_PS_40_BIT		0x2ULL
+#define ARM_LPAE_TCR_PS_42_BIT		0x3ULL
+#define ARM_LPAE_TCR_PS_44_BIT		0x4ULL
+#define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
+#define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
+
+#endif /* IO_PGTABLE_ARM_H_ */
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 04fbd4bf0ff9f..f71a2eade04ab 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -20,6 +20,8 @@
 
 #include <asm/barrier.h>
 
+#include "io-pgtable-arm.h"
+
 #define ARM_LPAE_MAX_ADDR_BITS		52
 #define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
 #define ARM_LPAE_MAX_LEVELS		4
@@ -100,23 +102,6 @@
 #define ARM_LPAE_PTE_MEMATTR_DEV	(((arm_lpae_iopte)0x1) << 2)
 
 /* Register bits */
-#define ARM_LPAE_TCR_TG0_4K		0
-#define ARM_LPAE_TCR_TG0_64K		1
-#define ARM_LPAE_TCR_TG0_16K		2
-
-#define ARM_LPAE_TCR_TG1_16K		1
-#define ARM_LPAE_TCR_TG1_4K		2
-#define ARM_LPAE_TCR_TG1_64K		3
-
-#define ARM_LPAE_TCR_SH_NS		0
-#define ARM_LPAE_TCR_SH_OS		2
-#define ARM_LPAE_TCR_SH_IS		3
-
-#define ARM_LPAE_TCR_RGN_NC		0
-#define ARM_LPAE_TCR_RGN_WBWA		1
-#define ARM_LPAE_TCR_RGN_WT		2
-#define ARM_LPAE_TCR_RGN_WB		3
-
 #define ARM_LPAE_VTCR_SL0_MASK		0x3
 
 #define ARM_LPAE_TCR_T0SZ_SHIFT		0
@@ -124,14 +109,6 @@
 #define ARM_LPAE_VTCR_PS_SHIFT		16
 #define ARM_LPAE_VTCR_PS_MASK		0x7
 
-#define ARM_LPAE_TCR_PS_32_BIT		0x0ULL
-#define ARM_LPAE_TCR_PS_36_BIT		0x1ULL
-#define ARM_LPAE_TCR_PS_40_BIT		0x2ULL
-#define ARM_LPAE_TCR_PS_42_BIT		0x3ULL
-#define ARM_LPAE_TCR_PS_44_BIT		0x4ULL
-#define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
-#define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
-
 #define ARM_LPAE_MAIR_ATTR_SHIFT(n)	((n) << 3)
 #define ARM_LPAE_MAIR_ATTR_MASK		0xff
 #define ARM_LPAE_MAIR_ATTR_DEVICE	0x04
diff --git a/MAINTAINERS b/MAINTAINERS
index 26f281d9f32a4..c637d38764594 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1463,8 +1463,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/iommu/arm,smmu*
 F:	drivers/iommu/arm-smmu*
-F:	drivers/iommu/io-pgtable-arm-v7s.c
-F:	drivers/iommu/io-pgtable-arm.c
+F:	drivers/iommu/io-pgtable-arm*
 
 ARM SUB-ARCHITECTURES
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.26.2

