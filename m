Return-Path: <SRS0=Z42x=52=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F5BC2BA2B
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 08:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4EC40206F7
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 08:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mI4YDsRw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgDJIcW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 04:32:22 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44042 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgDJIcV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Apr 2020 04:32:21 -0400
Received: by mail-pl1-f194.google.com with SMTP id h11so449664plr.11
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2020 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=azwLK/8evjxZTAFR/APBM9i2m7fC4tyoIBQXzhuORRI=;
        b=mI4YDsRwzftm/e7+yrQjJmusiRQT1L9mOvqB6xVm9I7P/sVQNz/bqC1BvTfgIY4/J+
         ZKrXBGgw2Mw5OBBt1A7jFNNpwtZofRjfPiQgugA9egtqoL25eCavGD/hUb0Ljkw8G+2c
         LSwE5fgJbRA7IOFd4+ObyLdDWkY+7/BzFWdFqQjXUB7DzpWGvo2Sbmzmla4lgm7YRNQ+
         CAZUQEEn062/z1u7VuAyPUdUZBHqvaQ6mVuz++q7rImD6QOQMFwF7M5EfLNmc6iYmHim
         Vqr5pSlN9cpiAfJdAmUJsiScy/89mxRiYawauzQYDY3thExX2OYWkiOhyxKC5gf4n2Gr
         79rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=azwLK/8evjxZTAFR/APBM9i2m7fC4tyoIBQXzhuORRI=;
        b=VPILxeE3pCuLx9/fL9jlKxK8lpNnb1Zy1hk3W9hziR7YKPdj9JZPmXQzKz8a31P/QC
         wVsz75TY1gJHjH8YlVmj5hweSLs1v1crjUup+9jhZxsQIai3T5qd/k6v5EAB3+mIYrGM
         LvCvtUdhJz4HgJzXdY+fRQir3S8HvF6eWp20NdsHAR+W+BVyPcGB4ZAGdyAj5rJKk0L0
         BLMAZpFXfd5+zKqH6HAVbB3O547tN4zfSnDeQjaNhIaIqOzU5bBAm1ao7y5w62sgsJjB
         3g7+NEaYjplNtVVWIsv5KMf1ojk6vbx3VwsgnWB2d1sJYflPmQkf1SzCx+5USoClu3d8
         mTFg==
X-Gm-Message-State: AGi0PuZ8y4fHcV0K1Mzy/KUZK7716/Ho4WOYAdeTEQdAo84F8RSrzYsq
        yFGG5w5fJ+oT2MyLVBQQ0eFLht0JYN0=
X-Google-Smtp-Source: APiQypJkzeSUcrjaRCmU24+j0VNpteFUtI9d2Wu2Y2T6WrvIHgHuwnFUk1Xc85+XGlFPF39+yycLqw==
X-Received: by 2002:a17:90a:1681:: with SMTP id o1mr4182714pja.55.1586507541084;
        Fri, 10 Apr 2020 01:32:21 -0700 (PDT)
Received: from wyqt-MI.mioffice.cn ([43.224.245.180])
        by smtp.gmail.com with ESMTPSA id a13sm1182475pfc.26.2020.04.10.01.32.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2020 01:32:20 -0700 (PDT)
From:   tangjianqiang <wyqt1985@gmail.com>
X-Google-Original-From: tangjianqiang <tangjianqiang@xiaomi.com>
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Tang Jianqiang <wyqt1985@gmail.com>,
        tangjianqiang <tangjianqiang@xiaomi.com>
Subject: [PATCH] of: fix the warnings from command line.
Date:   Fri, 10 Apr 2020 16:32:04 +0800
Message-Id: <1586507524-3987-1-git-send-email-tangjianqiang@xiaomi.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Gerrit will complain with this warnings:
ERROR: (foo*) should be (foo *)

Signed-off-by: tangjianqiang <tangjianqiang@xiaomi.com>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 2cdf64d..8a8e07a 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1078,7 +1078,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 #endif
 #endif /* CONFIG_CMDLINE */
 
-	pr_debug("Command line is: %s\n", (char*)data);
+	pr_debug("Command line is: %s\n", (char *)data);
 
 	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
 	if (rng_seed && l > 0) {
-- 
2.7.4

