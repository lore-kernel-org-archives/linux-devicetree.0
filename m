Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04ADC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 18:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7A402070A
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 18:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="odyzMQV0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgEOSol (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 14:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbgEOSok (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 14:44:40 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B07EC061A0C
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 11:44:40 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u35so1394461pgk.6
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 11:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=peJsTqjtzZlMiQ6/hlyhWPfLomD22UhRmluRyXSzAqM=;
        b=odyzMQV0MtWn4lHEcUbNe7/SQACylDgvPhRHGIoyKomvD/3z5ouRD/l5/zfv1dOmhq
         NxkCsfaFWEwbotVggUkRs8NNA3DAwjLSBkZGbpGsRpcQV4554sI0v28SCXGJLGoBiqyw
         TBsdNh4fLBiObsU7hXtjF8FcMcaOXWUzTNA3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=peJsTqjtzZlMiQ6/hlyhWPfLomD22UhRmluRyXSzAqM=;
        b=JOQgg99kfcBBQJIjL/Jf9+E/yrcHbfBlyPa2w7kdSDTQkn8nIghgy4ue0S/Xyx0D0E
         yfP9PPWgB7o+NGfC5O9VuyrvN4+2o2orVBqPRJJdp8P/cA71zNWNTE61IaS1x5fi1npx
         OjwxtwxgStlLlP/5b4ILIkPpNOJaSlKaTHaVPzH5NC+tOgKjtmjt+9ldgNgIoJNkSEoY
         5FLo3vYoZyUeyxjQEM5PRFUoV9ZSVOtiSPBaAKne32p6JESsyLuUaHt1IC7XDfbVlMV7
         jmGX/MVrz/JpKmqCctETdDKC+0+Mvdr1902bsySHfRuXgYBzcFixHXgqmvxro4+xQBXx
         3tnA==
X-Gm-Message-State: AOAM533kq4Y3gDesMY1l1OTmn78t/8I9ZGGhVbU9SJ9mc9ps+FM8Zfi8
        imbsU0JV0pLLWcEB9Tvy394DFw==
X-Google-Smtp-Source: ABdhPJwHvkUqt7aY1ys8FJyyIpV2sU/MV5A7WjetunJbfb+VaZrSZ8GTZCL7/OPgum1aJcyxju5OJg==
X-Received: by 2002:a63:7d3:: with SMTP id 202mr4282979pgh.279.1589568279879;
        Fri, 15 May 2020 11:44:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 131sm2304275pgf.49.2020.05.15.11.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 11:44:38 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 1/6] printk: Collapse shutdown types into a single dump reason
Date:   Fri, 15 May 2020 11:44:29 -0700
Message-Id: <20200515184434.8470-2-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515184434.8470-1-keescook@chromium.org>
References: <20200515184434.8470-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

To turn the KMSG_DUMP_* reasons into a more ordered list, collapse
the redundant KMSG_DUMP_(RESTART|HALT|POWEROFF) reasons into
KMSG_DUMP_SHUTDOWN. The current users already don't meaningfully
distinguish between them, so there's no need to, as discussed here:
https://lore.kernel.org/lkml/CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com/

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kernel/nvram_64.c | 4 +---
 fs/pstore/platform.c           | 8 ++------
 include/linux/kmsg_dump.h      | 4 +---
 kernel/reboot.c                | 6 +++---
 4 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index fb4f61096613..0cd1c88bfc8b 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -655,9 +655,7 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
 	int rc = -1;
 
 	switch (reason) {
-	case KMSG_DUMP_RESTART:
-	case KMSG_DUMP_HALT:
-	case KMSG_DUMP_POWEROFF:
+	case KMSG_DUMP_SHUTDOWN:
 		/* These are almost always orderly shutdowns. */
 		return;
 	case KMSG_DUMP_OOPS:
diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 072440457c08..90d74ebaa70a 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -144,12 +144,8 @@ static const char *get_reason_str(enum kmsg_dump_reason reason)
 		return "Oops";
 	case KMSG_DUMP_EMERG:
 		return "Emergency";
-	case KMSG_DUMP_RESTART:
-		return "Restart";
-	case KMSG_DUMP_HALT:
-		return "Halt";
-	case KMSG_DUMP_POWEROFF:
-		return "Poweroff";
+	case KMSG_DUMP_SHUTDOWN:
+		return "Shutdown";
 	default:
 		return "Unknown";
 	}
diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 2e7a1e032c71..3f82b5cb2d82 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -25,9 +25,7 @@ enum kmsg_dump_reason {
 	KMSG_DUMP_PANIC,
 	KMSG_DUMP_OOPS,
 	KMSG_DUMP_EMERG,
-	KMSG_DUMP_RESTART,
-	KMSG_DUMP_HALT,
-	KMSG_DUMP_POWEROFF,
+	KMSG_DUMP_SHUTDOWN,
 };
 
 /**
diff --git a/kernel/reboot.c b/kernel/reboot.c
index c4d472b7f1b4..491f1347bf43 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -250,7 +250,7 @@ void kernel_restart(char *cmd)
 		pr_emerg("Restarting system\n");
 	else
 		pr_emerg("Restarting system with command '%s'\n", cmd);
-	kmsg_dump(KMSG_DUMP_RESTART);
+	kmsg_dump(KMSG_DUMP_SHUTDOWN);
 	machine_restart(cmd);
 }
 EXPORT_SYMBOL_GPL(kernel_restart);
@@ -274,7 +274,7 @@ void kernel_halt(void)
 	migrate_to_reboot_cpu();
 	syscore_shutdown();
 	pr_emerg("System halted\n");
-	kmsg_dump(KMSG_DUMP_HALT);
+	kmsg_dump(KMSG_DUMP_SHUTDOWN);
 	machine_halt();
 }
 EXPORT_SYMBOL_GPL(kernel_halt);
@@ -292,7 +292,7 @@ void kernel_power_off(void)
 	migrate_to_reboot_cpu();
 	syscore_shutdown();
 	pr_emerg("Power down\n");
-	kmsg_dump(KMSG_DUMP_POWEROFF);
+	kmsg_dump(KMSG_DUMP_SHUTDOWN);
 	machine_power_off();
 }
 EXPORT_SYMBOL_GPL(kernel_power_off);
-- 
2.20.1

