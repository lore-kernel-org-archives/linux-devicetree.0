Return-Path: <SRS0=YnW7=6Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177D1C47254
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 May 2020 14:36:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA0AC20661
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 May 2020 14:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="W0ua+z3q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgEBOgB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 2 May 2020 10:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbgEBOgA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 2 May 2020 10:36:00 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0107C061A0C
        for <devicetree@vger.kernel.org>; Sat,  2 May 2020 07:36:00 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id o10so10250549qtr.6
        for <devicetree@vger.kernel.org>; Sat, 02 May 2020 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IPyNHVVyHLyQpURoLpqQbXZduedH4Z3FiYavEkbXDU0=;
        b=W0ua+z3qodfjH8mNMFohUOyq6XfU39BCqqUT59CTEY1EHC+LHiS7GlASBwh+H2IH9s
         2IC4JrwGjVUlx/6UgkYVfy1vk4XrS4qzBDuP+t4CxQk2gJlUfudUNMRRU7+b5W+kc/H+
         WIRO6jJSAuaFM1VVX6VcgK7rBg1LC4Vn6ROo+3jWGD8iPpIA//srcLLR5p2ntTWTEIU2
         9/JWDcd30vYt/V8uu8HnyXhsr1J2hPVJ+T0HT0gXGGOLuV+WyXfp6Mr8SyCpgiMkpUJQ
         BMT68fzcjmhqKeMnSMjQ+b9PLyuvF8qZ7ZG8JzvRciIR0nW0ha6xuzinNC4IIdSfEQFb
         226A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IPyNHVVyHLyQpURoLpqQbXZduedH4Z3FiYavEkbXDU0=;
        b=UmY3W+EvVQ3Ej/BJEpIkeyqt6hQqZ9/gjwlo2pMkRs7xV7rmxm8uvRwE1SCcw9Iajw
         qRdkTr6VDx0epmmrn2BDECbsphlUQ+3PBeQHaiNmBs26Gjm8VIK0RStJH4iAE74EJtHn
         ylB1LeAFO0GwOR1qGfUmdGwq8jYNhiJWXSWp+I9K/9sr+vtjenBVpkNS9nWJnOaF0Dsr
         20EDr+mrtTCHT3aCBiIZwJwvWiZUOwrKCdpaMikuGpzaEzwG77TNqlu2Lteg+y9Wu5TZ
         QTMoaLjWBg8oShKsDIVHvoeyUtXzn+lToETdAuyDkMPMAXrWSIxZ8LlOO21PDSAn96Om
         5YUQ==
X-Gm-Message-State: AGi0PubbMQGEsSFkEwhXGMGAYXL49oyIp6U7br4HDJPf8c5Qaa9ltouY
        slyhHRhrTV7EzK+ochrMFGu2pg==
X-Google-Smtp-Source: APiQypJAnLEJO/qPhCLxoWn1pu2kWSnStZo6855NP1gLhjkO5F2uxkIKFszahl1VCYL2h5gim3RCSA==
X-Received: by 2002:ac8:46d0:: with SMTP id h16mr9056781qto.242.1588430159945;
        Sat, 02 May 2020 07:35:59 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id d23sm5156894qkj.26.2020.05.02.07.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 07:35:59 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        linux-kernel@vger.kernel.org, pmladek@suse.com,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 1/3] printk: honor the max_reason field in kmsg_dumper
Date:   Sat,  2 May 2020 10:35:53 -0400
Message-Id: <20200502143555.543636-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200502143555.543636-1-pasha.tatashin@soleen.com>
References: <20200502143555.543636-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

kmsg_dump() allows to dump kmesg buffer for various system events: oops,
panic, reboot, etc. It provides an interface to register a callback call
for clients, and in that callback interface there is a field "max_reason"
which gets ignored unless always_kmsg_dump is passed as kernel parameter.

Allow clients to decide max_reason, and keep the current behavior when
max_reason is not set.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kmsg_dump.h |  1 +
 kernel/printk/printk.c    | 16 +++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 2e7a1e032c71..c0d703b7ce38 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -28,6 +28,7 @@ enum kmsg_dump_reason {
 	KMSG_DUMP_RESTART,
 	KMSG_DUMP_HALT,
 	KMSG_DUMP_POWEROFF,
+	KMSG_DUMP_MAX = KMSG_DUMP_POWEROFF
 };
 
 /**
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9a9b6156270b..04c1e9a9b139 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3085,6 +3085,8 @@ EXPORT_SYMBOL(printk_timed_ratelimit);
 
 static DEFINE_SPINLOCK(dump_list_lock);
 static LIST_HEAD(dump_list);
+static bool always_kmsg_dump;
+module_param_named(always_kmsg_dump, always_kmsg_dump, bool, S_IRUGO | S_IWUSR);
 
 /**
  * kmsg_dump_register - register a kernel log dumper.
@@ -3106,6 +3108,12 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
 	spin_lock_irqsave(&dump_list_lock, flags);
 	/* Don't allow registering multiple times */
 	if (!dumper->registered) {
+		if (!dumper->max_reason) {
+			if (always_kmsg_dump)
+				dumper->max_reason = KMSG_DUMP_MAX;
+			else
+				dumper->max_reason = KMSG_DUMP_OOPS;
+		}
 		dumper->registered = 1;
 		list_add_tail_rcu(&dumper->list, &dump_list);
 		err = 0;
@@ -3141,9 +3149,6 @@ int kmsg_dump_unregister(struct kmsg_dumper *dumper)
 }
 EXPORT_SYMBOL_GPL(kmsg_dump_unregister);
 
-static bool always_kmsg_dump;
-module_param_named(always_kmsg_dump, always_kmsg_dump, bool, S_IRUGO | S_IWUSR);
-
 /**
  * kmsg_dump - dump kernel log to kernel message dumpers.
  * @reason: the reason (oops, panic etc) for dumping
@@ -3157,12 +3162,9 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 	struct kmsg_dumper *dumper;
 	unsigned long flags;
 
-	if ((reason > KMSG_DUMP_OOPS) && !always_kmsg_dump)
-		return;
-
 	rcu_read_lock();
 	list_for_each_entry_rcu(dumper, &dump_list, list) {
-		if (dumper->max_reason && reason > dumper->max_reason)
+		if (reason > dumper->max_reason)
 			continue;
 
 		/* initialize iterator with data about the stored records */
-- 
2.25.1

