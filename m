Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF01C47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 15:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A7D420736
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 15:05:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPKzgpl3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730128AbgEKPFH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 11:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728090AbgEKPFH (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 May 2020 11:05:07 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5920DC061A0C
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 08:05:07 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a7so7937490pju.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Ihuf7frb146tYEK8HG0xGK1ErUJGbIsIWcyrfSF6Hdo=;
        b=ZPKzgpl3pT9jy6kyIPt/XjKgPouRFLhdel90rozXGL93vNMmJabHabpuvXUhmL6eoI
         QoB43KnX02epvjmWQTYoXco2CjmOeSmNgECOYiH0VU4z3XAFYsKPdXdtzcnT9MtTUzoK
         FzAyhUTKvDnhbUuv/m2sEZJKA0sq2rZJOD+vuBu9MXMmxL2ryc7qaBNCENH7dCTrVRgU
         OQOoKjPiCWubAKtgbNoF9affc5IVYXDoda2GSqsYLjJbGkHfBHur1ZhdYaXi0WrlMLYY
         1PHFZetHmcyMG+P3w34PDR9GwZ206DZZzjbBvRLmEL/sJ3susz/h2nfqABSBtMztjinO
         wX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ihuf7frb146tYEK8HG0xGK1ErUJGbIsIWcyrfSF6Hdo=;
        b=Lh2EQ7j8M3cJKwl4ZR64zMZz6XYilovOVUOCSbeaCKiGkCVLWoe3HU2rH2zxYsn542
         a8yDbJsyXj6BKuiDQviHIzisgfOGDz/QY6AuxLxb7ljINNIPDBDXiO6oNCZYmc8JVdaL
         lIVtd2gqMpPxGTsgh0O5naXynnkETIAvHMutfIho3OX0wTKEosWCtqg7EnusvEs3J03e
         dnoTcMxiB0UN7zFkSvGP1/t8r1aBN7ZKUQRcdJuJhyeb1l6b8YURloOMzUT1iosA5zhP
         AyI/LTU9lHRsrDGhRlDaB+5P5Vz+jEIOlwG1XOG15udIIT6iyKjYYUnTt1a9q+mVuqwj
         Wt1Q==
X-Gm-Message-State: AGi0PuYnBQeWm6rbL6Nys7ZhDW2rjxLGLfuK4hY+PrO2/Zijsi1fRUkT
        BhTwgC/w7GmKqaGt5D1IpaQ=
X-Google-Smtp-Source: APiQypKrebweybPanlhUHTouzsIflvpNdK0IXCls7WXBwT+Kfihw26PQYUQFiG/gwxAKil5rbrX9/g==
X-Received: by 2002:a17:902:968a:: with SMTP id n10mr16334033plp.259.1589209506831;
        Mon, 11 May 2020 08:05:06 -0700 (PDT)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 19sm10084933pjl.52.2020.05.11.08.05.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 11 May 2020 08:05:05 -0700 (PDT)
From:   qiwuchen55@gmail.com
To:     robh+dt@kernel.org, frowand.list@gmail.com
Cc:     devicetree@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] drivers/of: keep description of function consistent with function name
Date:   Mon, 11 May 2020 23:04:57 +0800
Message-Id: <1589209497-13945-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Currently, there are some descriptions of function not
consistent with function name, fixing them will make
the code more readable.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/of/fdt.c             |  2 +-
 drivers/of/of_reserved_mem.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 2cdf64d..a86392a 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -471,7 +471,7 @@ void *of_fdt_unflatten_tree(const unsigned long *blob,
 static u32 of_fdt_crc32;
 
 /**
- * res_mem_reserve_reg() - reserve all memory described in 'reg' property
+ * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
  */
 static int __init __reserved_mem_reserve_reg(unsigned long node,
 					     const char *uname)
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 1a84bc0..6f6fea3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -46,7 +46,7 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 }
 
 /**
- * res_mem_save_node() - save fdt node for second pass initialization
+ * fdt_reserved_mem_save_node() - save fdt node for second pass initialization
  */
 void __init fdt_reserved_mem_save_node(unsigned long node, const char *uname,
 				      phys_addr_t base, phys_addr_t size)
@@ -68,8 +68,8 @@ void __init fdt_reserved_mem_save_node(unsigned long node, const char *uname,
 }
 
 /**
- * res_mem_alloc_size() - allocate reserved memory described by 'size', 'align'
- *			  and 'alloc-ranges' properties
+ * __reserved_mem_alloc_size() - allocate reserved memory described by
+ *	'size', 'align'  and 'alloc-ranges' properties.
  */
 static int __init __reserved_mem_alloc_size(unsigned long node,
 	const char *uname, phys_addr_t *res_base, phys_addr_t *res_size)
@@ -165,7 +165,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 	__used __section(__reservedmem_of_table_end);
 
 /**
- * res_mem_init_node() - call region specific reserved memory init code
+ * __reserved_mem_init_node() - call region specific reserved memory init code
  */
 static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
 {
@@ -232,7 +232,7 @@ static void __init __rmem_check_for_overlap(void)
 }
 
 /**
- * fdt_init_reserved_mem - allocate and init all saved reserved memory regions
+ * fdt_init_reserved_mem() - allocate and init all saved reserved memory regions
  */
 void __init fdt_init_reserved_mem(void)
 {
-- 
1.9.1

