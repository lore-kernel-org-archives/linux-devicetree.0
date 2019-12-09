Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA8EC43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 19:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B092E205ED
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 19:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gern8aRQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfLITWa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 14:22:30 -0500
Received: from mail-pj1-f73.google.com ([209.85.216.73]:42976 "EHLO
        mail-pj1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfLITWa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 14:22:30 -0500
Received: by mail-pj1-f73.google.com with SMTP id s19so8466493pjp.9
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 11:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=KvC0u7VAHQ2xfNCKqFfggoTr2hcV06Kdgwlw8hh9MO0=;
        b=Gern8aRQLFovPJ6OwOkeRDvXgezARFO0bi6QIfk1RUy/EbFz25LyASGNgBRSqXol+7
         qpTvC+VhPcgKAqxuwnowU80CYAmbtVw06RINw0Zorun5Un0CvvwCbUgI9NJDW65KUJLc
         MqlHKGs6zeJXXCzbq61BbwiGKVE0kqBRO/3q6BlvkRmt5bJ6KDCu9G3wD7vufJVwaDAy
         rVhgvFYbHKz1Fu/ht9QQZkE6NxHhy8QFo36lC2s6jrXL9sBTGfFS+B/YAhJClujiXKta
         zt429kyW1dip5uQ+El2Cb/EEEEkVR6usByu+XvS/C6TqoloJYOfnX9nOoUmsICNvTIQD
         OnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=KvC0u7VAHQ2xfNCKqFfggoTr2hcV06Kdgwlw8hh9MO0=;
        b=Lf4AFshYjTHsp/HaUjSUvPFxkBKAbLFVoQ3CDEXxw7XeW1m9d5jAFBT33Gg3NjtDJr
         OU378s9XkRkK7xos9PxJP3V5AeSuhHupHZrM71iJq0bkwUwTLj/QEcs/eA3CjESX828F
         yTbpYmcKzczIcX/jO0udxftwjInKWZR7upzWs5wkIXdanYFZOHXUCraVbpGKhh+hLCGT
         3vXRQpD2wZIDBz21G1s3L7v5GVSqG8v+fOVtdGJ0Xx+dzssS6wflyJZrxeTyur7YwI9c
         dzOkELxBcgc4UNtxTj6odA8TuJA6arL7AiYj4jrtlnGUhwevOVyfGZt0EOAuOT3ms2wy
         m5LQ==
X-Gm-Message-State: APjAAAWrevI2NNd0JXIPECYVyOO9LQqa/6ZquziMoNCOvnvONeVNgURA
        abdKyEdr4J41W/OGsK5Vz87UdVJ6IBKpc7I=
X-Google-Smtp-Source: APXvYqy0X8mnqLfEq6D6hLuFnJ9MbnQw7/eACLLFm4DrjDmsJ8rR+mjl83k64FESLF/FDyElUwdR8+I0xVP3xCI=
X-Received: by 2002:a63:4f5c:: with SMTP id p28mr19965327pgl.409.1575919349328;
 Mon, 09 Dec 2019 11:22:29 -0800 (PST)
Date:   Mon,  9 Dec 2019 11:22:21 -0800
Message-Id: <20191209192221.143379-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
Subject: [PATCH v2] of/platform: Unconditionally pause/resume sync state
 during kernel init
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     kernel test robot <lkp@intel.com>, kernel-team@android.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Commit 5e6669387e22 ("of/platform: Pause/resume sync state during init
and of_platform_populate()") paused/resumed sync state during init only
if Linux had parsed and populated a devicetree.

However, the check for that (of_have_populated_dt()) can change after
of_platform_default_populate_init() executes.  One example of this is
when devicetree unittests are enabled.  This causes an unmatched
pause/resume of sync state. To avoid this, just unconditionally
pause/resume sync state during init.

Fixes: 5e6669387e22 ("of/platform: Pause/resume sync state during init and of_platform_populate()")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Frank Rowand <frowand.list@gmail.com>
---
 drivers/of/platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index d93891a05f60..3371e4a06248 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -518,10 +518,11 @@ static int __init of_platform_default_populate_init(void)
 {
 	struct device_node *node;
 
+	device_links_supplier_sync_state_pause();
+
 	if (!of_have_populated_dt())
 		return -ENODEV;
 
-	device_links_supplier_sync_state_pause();
 	/*
 	 * Handle certain compatibles explicitly, since we don't want to create
 	 * platform_devices for every node in /reserved-memory with a
@@ -545,8 +546,7 @@ arch_initcall_sync(of_platform_default_populate_init);
 
 static int __init of_platform_sync_state_init(void)
 {
-	if (of_have_populated_dt())
-		device_links_supplier_sync_state_resume();
+	device_links_supplier_sync_state_resume();
 	return 0;
 }
 late_initcall_sync(of_platform_sync_state_init);
-- 
2.24.0.393.g34dc348eaf-goog

