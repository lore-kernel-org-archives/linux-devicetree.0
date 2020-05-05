Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE27C4725A
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 15:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 401302085B
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 15:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="cczj7UwF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbgEEPpd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 11:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730695AbgEEPpR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 11:45:17 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D576C061A0F
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 08:45:16 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id g185so2735303qke.7
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lLfGQdqFMPUzVPvaSstChPdTkWTfxzSBzkaUwWkOF9M=;
        b=cczj7UwFD1mCMdDfMAXJ/38Ds0Ze5+lK4Q6bzE/3IQlKFMk1rHMnOCNc8AsIDC9WJu
         6bO3K1gLfcoqVrau36MNNjzgeneWfilFCFbYAfiSfvWistTAQoiTOJtdlL5i6+Ig0rnG
         GN0UzdCAx3eT/B1LP5jzYupMUWF3wXXP/sZu8QKBBS514jzQUOpWSJtdD2BGOawmw+UT
         LvR5cf4Pe3jE+cusB3x2uxAJcE3UQ1dI3ohxViK7AsgENn3sqlq+eTjoupwBR7p6D3oS
         3ZUifXJJVwnRLab6Hxu+RAx0qD3DDlLxvGErceh0b1/BSg/7jGGh7/DLU0/VxG2hoDOD
         Z6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLfGQdqFMPUzVPvaSstChPdTkWTfxzSBzkaUwWkOF9M=;
        b=fW6utz2Z7ZhXGZ/3iciMogaaQK4NxAfppgzbfb3tdTirgqJWc5t88FTX22GgiwVeTu
         KaihzkMlFYA9vMXBul7ho5a8ZPh9Yez9RCoanq8KELpTGF6khOyr8YCO9XFdAbXXeC2e
         0nVIVLmxkWcgT6naFs3Z0/KJko3x9CuiV8ANjApJXcuoJW4BuAG5mNbVzNKUzSNf7EcJ
         NtrA4/k2SbYtgLC3oY2jGhIF5+Kn2s5C/IDbscj49wBBZ+0hZFeipiYRNIj3C8CfHEaG
         hOidmcfpeadkPIoZznjtuSUFOuDQ+/rob0vT+fjuM5W6cw9cCig6MBkSTTRtKNYiRM84
         RU5A==
X-Gm-Message-State: AGi0PuYbL01KXYIsLJ5PTOg9sJmgwo7K7OIlzvo3WlthBUjRgiQG3p/1
        glgUMHuHw4RZFn6n1t5mpZmnqw==
X-Google-Smtp-Source: APiQypIOFXJGyg9UafreFIFeAppzDzDB/7jIORZ/D4iGYlJfYpvYbw7v6WT0a0Xa5lJKXoQ1+Zynog==
X-Received: by 2002:a05:620a:2042:: with SMTP id d2mr3998565qka.295.1588693515647;
        Tue, 05 May 2020 08:45:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id x7sm2122407qkx.36.2020.05.05.08.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 08:45:14 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        linux-kernel@vger.kernel.org, pmladek@suse.com,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/5] pstore/platform: pass max_reason to kmesg dump
Date:   Tue,  5 May 2020 11:45:07 -0400
Message-Id: <20200505154510.93506-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200505154510.93506-1-pasha.tatashin@soleen.com>
References: <20200505154510.93506-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a new field to pstore_info that passes information about kmesg dump
maximum reason.

This allows a finer control of what kmesg dumps are stored on pstore
device.

Those clients that do not explicitly set this field (keep it equal to 0),
get the default behavior: dump only Oops and Panics, and dump everything
if printk.always_kmsg_dump is provided.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 fs/pstore/platform.c   | 4 +++-
 include/linux/pstore.h | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 408277ee3cdb..75bf8a43f92a 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -602,8 +602,10 @@ int pstore_register(struct pstore_info *psi)
 	if (pstore_is_mounted())
 		pstore_get_records(0);
 
-	if (psi->flags & PSTORE_FLAGS_DMESG)
+	if (psi->flags & PSTORE_FLAGS_DMESG) {
+		pstore_dumper.max_reason = psinfo->max_reason;
 		pstore_register_kmsg();
+	}
 	if (psi->flags & PSTORE_FLAGS_CONSOLE)
 		pstore_register_console();
 	if (psi->flags & PSTORE_FLAGS_FTRACE)
diff --git a/include/linux/pstore.h b/include/linux/pstore.h
index e779441e6d26..45ae424bfeb5 100644
--- a/include/linux/pstore.h
+++ b/include/linux/pstore.h
@@ -97,6 +97,8 @@ struct pstore_record {
  * @read_mutex:	serializes @open, @read, @close, and @erase callbacks
  * @flags:	bitfield of frontends the backend can accept writes for
  * @data:	backend-private pointer passed back during callbacks
+ * @max_reason: Used when PSTORE_FLAGS_DMESG is set. Contains the
+ *              kmsg_dump_reason enum value.
  *
  * Callbacks:
  *
@@ -180,6 +182,7 @@ struct pstore_info {
 
 	int		flags;
 	void		*data;
+	int		max_reason;
 
 	int		(*open)(struct pstore_info *psi);
 	int		(*close)(struct pstore_info *psi);
-- 
2.25.1

