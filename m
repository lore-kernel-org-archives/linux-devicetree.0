Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1523C47247
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 15:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C099C206B9
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 15:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="T00n5b+o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730685AbgEEPpP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 11:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730681AbgEEPpP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 11:45:15 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB645C061A0F
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 08:45:14 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id i68so2316131qtb.5
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F+4SVdWRlFJxnpjgzasS5JspfSz6j1yd8grF/PAppTQ=;
        b=T00n5b+oSujUoVq9Z+LR8fGuvltBcys+J/cMjZ43GxX17HfOte90BRwC0yFHgeloy3
         g33W9r3kpjfiEzl6XkZ6QbPSadqWfexzoHSKY5+3OTIIydoF6N3C9+fABrvRoK76orMY
         dzMuRaIvGNLq6U7Q9x1esMQo+HwKM6Hr7KP75s1/W8mVOZXgh27RBt/sZQS+xOJobww/
         Ge6yNUjO90b+9imM+W9uQnEJ93L5bAcmHgIyZrDT2kBnh21vlzD2pDW7VYBMGqrHvWkL
         +eBsdRU8EL/Qu0ygBSlcxtVhubdqfa/Y5ngJc7GolQwHiRiPdPJCmTLZE3FOvoKebrGm
         4nOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F+4SVdWRlFJxnpjgzasS5JspfSz6j1yd8grF/PAppTQ=;
        b=VWBN0rB4UrMi1cJYEl/VRNJkgI7pNce8H1KbRrK7A4DgZWbAhk1dpezYoqo93Xd65z
         U7nDiFYiG211btdAxmfLHMdsaxMMKIy+XEdtUTL748WnqNX+6zG3S1XSYIw2gegLlT85
         2dBjEzAwELnMgyU7HCXq3uqO/eaiiJXk8m/win7nCS1Y7FQyGkBmwvbPThJbWtd9ogOz
         JUB7c/nx2ojoky3OB0SpwAixXJXXaTFzLpMojhCShmOfQpxePQ8wwZ0jUtQHtZKpZKZV
         fkKW3wxtSFhhjnDZ0liQbwL6mH/yxrxQRppjLzjhSUdLbylJ6IF1K9ZVy5ZK1vDMfEWT
         zJUg==
X-Gm-Message-State: AGi0PuYZCnPpco3fgSjqkz9VuvRLtpoFC6VXYdbzQx/cH1WdwmHaCLxx
        /iO0K/nX6Vvx+/lLaLgFfwRfRg==
X-Google-Smtp-Source: APiQypIYfkAPNj3MZ2vxjqvBSwGBRWN0NaGzZ5h6LwCTvoMZorwTkHaSbpnD+l7igUu8/0J3u8897w==
X-Received: by 2002:ac8:6f03:: with SMTP id g3mr3220891qtv.10.1588693514106;
        Tue, 05 May 2020 08:45:14 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id x7sm2122407qkx.36.2020.05.05.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 08:45:13 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        linux-kernel@vger.kernel.org, pmladek@suse.com,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] printk: honor the max_reason field in kmsg_dumper
Date:   Tue,  5 May 2020 11:45:06 -0400
Message-Id: <20200505154510.93506-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200505154510.93506-1-pasha.tatashin@soleen.com>
References: <20200505154510.93506-1-pasha.tatashin@soleen.com>
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
 kernel/printk/printk.c    | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 2e7a1e032c71..cfc042066be7 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -28,6 +28,7 @@ enum kmsg_dump_reason {
 	KMSG_DUMP_RESTART,
 	KMSG_DUMP_HALT,
 	KMSG_DUMP_POWEROFF,
+	KMSG_DUMP_MAX
 };
 
 /**
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9a9b6156270b..1aab69a8a2bf 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3157,12 +3157,19 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 	struct kmsg_dumper *dumper;
 	unsigned long flags;
 
-	if ((reason > KMSG_DUMP_OOPS) && !always_kmsg_dump)
-		return;
-
 	rcu_read_lock();
 	list_for_each_entry_rcu(dumper, &dump_list, list) {
-		if (dumper->max_reason && reason > dumper->max_reason)
+		enum kmsg_dump_reason cur_reason = dumper->max_reason;
+
+		/*
+		 * If client has not provided a specific max_reason, default
+		 * to KMSG_DUMP_OOPS, unless always_kmsg_dump was set.
+		 */
+		if (cur_reason == KMSG_DUMP_UNDEF) {
+			cur_reason = always_kmsg_dump ? KMSG_DUMP_MAX :
+							KMSG_DUMP_OOPS;
+		}
+		if (reason > cur_reason)
 			continue;
 
 		/* initialize iterator with data about the stored records */
-- 
2.25.1

