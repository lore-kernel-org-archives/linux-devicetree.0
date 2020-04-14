Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA705C3A5A9
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 17:04:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A4F32076A
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 17:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/x8cPL2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391330AbgDNREd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 13:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391339AbgDNREb (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 13:04:31 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA61C061A0F
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 10:04:31 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id h2so13795656wmb.4
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=erC/yZ4yqf+8sj3sT7z9RmtS2eJz/nnIlww3PMj9LNg=;
        b=Z/x8cPL2SESYSfgT7USIjcJ03j+yB0RlxWlgpL06IaYNqQQiDsvaIHSi8h1/6csvx5
         kK3IN5C+qcarpFXtn3clOaAiwcKXNvVa1EWM/usyv6coAE89GVxlq0y+++3RZEk606mS
         eK/EjQn6TUpXWOsA1a0nlNknOXuMZrhFMHmCmBAyiUyODyk/I0jtGaFPz3zFkgOjmMZf
         uD2X83kt/GQjoEZq/g3kTgLEpNi3zTYhvueIqbfhi3Y4uoytjUedxC4iTy6yeOtZC8Nv
         yQnYlRAUvzb6xUuSOOjFLyw5N5rMpXC5onjkVSQrucRWu0tMM59YEgFJOBJCzYIEWPgN
         8ZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=erC/yZ4yqf+8sj3sT7z9RmtS2eJz/nnIlww3PMj9LNg=;
        b=uCbMpxavQVKzi2JpMlIb9WKemJrrpjV/+b4np/U7j5N7Sw+tJy9HxhLcOT9CYNW3l1
         /OlyArpJfB0U9/VQ6VMERIyMHhd3QuyoU4I4FUfjQfbwhetunqoQk768d0DT4uRpYIkN
         fXshLGaVg78ltSJgLjuDYgigZ7CoaxK3OAdlM6jWkirP9FroeRX77F9Ib4fpjqqXFK5Z
         idt8Y1XP2MKGuPKUdri1eJe/dYk3GS/HMcwas4t19pw9zac7+MiFhqAHkgphjyT1bosP
         YEsgvlSXfe5CoZCQxRuxnC/BjDKeBgApV5FypTFflJVTBz5W8cbjgyaYo+wgy418dv9N
         aAJQ==
X-Gm-Message-State: AGi0PuZXlGSwVMUrVfwRCAHPYmiq1tz9U+6x5WxLUSe+6EBNzF3pVvry
        ZYN5GDY1g4pFlKH0j0xWvm9deg==
X-Google-Smtp-Source: APiQypII+WOd1DdLkhhXCc4VJ0kp8rxI4M4if6Dbn88/uuwISRQZtuLUUNyYcRkEY4LiB2fY33DLlA==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr802495wmj.100.1586883870064;
        Tue, 14 Apr 2020 10:04:30 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id x18sm19549147wrs.11.2020.04.14.10.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:04:29 -0700 (PDT)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org
Cc:     joro@8bytes.org, catalin.marinas@arm.com, will@kernel.org,
        robin.murphy@arm.com, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, Jonathan.Cameron@huawei.com,
        jacob.jun.pan@linux.intel.com, christian.koenig@amd.com,
        zhangfei.gao@linaro.org, jgg@ziepe.ca, xuzaibo@huawei.com,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v5 09/25] iommu/io-pgtable-arm: Move some definitions to a header
Date:   Tue, 14 Apr 2020 19:02:37 +0200
Message-Id: <20200414170252.714402-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414170252.714402-1-jean-philippe@linaro.org>
References: <20200414170252.714402-1-jean-philippe@linaro.org>
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
 drivers/iommu/io-pgtable-arm.h | 30 ++++++++++++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c | 27 ++-------------------------
 2 files changed, 32 insertions(+), 25 deletions(-)
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
-- 
2.26.0

