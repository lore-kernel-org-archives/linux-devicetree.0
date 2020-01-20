Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A900C3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 11:39:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5127921D7D
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 11:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0ssDQns"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgATLjO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 06:39:14 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33898 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgATLjO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 06:39:14 -0500
Received: by mail-pf1-f193.google.com with SMTP id i6so15733096pfc.1;
        Mon, 20 Jan 2020 03:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=+XEXJGrBheE6BdBTJzx3qe6Qc7GaDGnAyEcE/RLU0BI=;
        b=H0ssDQnsDQY4APLdfTjfPfoEMhmXbXe/Flvdd5S13rRoxe3TUfv2qn19P++FcDICfn
         vSIMVpUDMdicWq30eo9wI752LN2xESqyawIu7OEhJ9NewVUR8ah6zff2WP3nFf/4sSGB
         mC+YsD5rQMnIt8LeHpBQ9vveOVnWOt/ujjuSS66tONjvo8mNoqbSBduyJRM5060SxQ95
         aoJhHB7xAV4ugGPu9kyI/f+jwUzlpVho7LL1A63WV1TfuYlr3XSZiDEE5yHz1jEnq8vw
         i9Kb/01LlD/qh9KWIDDW893o/mQR3/gUAZhEdn8LIy3HkY9f9SQ6TJcpfbxhBn2QrrQD
         09Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=+XEXJGrBheE6BdBTJzx3qe6Qc7GaDGnAyEcE/RLU0BI=;
        b=fAQYx7r58h3mcc5CrWc5AbFV7QnbWPdihO8n62PTIKy/R4c/2jPQtIpu4uf3s7By9D
         HQ9G4D/LaGLkVmgnacMYB8FFwTrw+lgC9jH9RefRMirIbYAuv9gKMVdj1QZ4zCcqZqtd
         R6Z+k02YBASFp9ZQb0djp0yxXovUMg206xjvOODiNB7SYEllJElYgEFbXZL4ng2LFd4S
         pqqoPrzPCEJ82tfrb557mbiOFVKskVbOunXxsfdT38MdV83GlIHirzAZRqoSHWr+wEbm
         rOeprHSUCBd6BgbtPrvLmvdhX/v2SBBCSswJ9IvMvjODq1WmSRzjDQPjHM9ClNCroi1m
         USOw==
X-Gm-Message-State: APjAAAVMlRFVp7mFcfpXna/ztqJkNKNc5D6Vk+XW6LUPNwRQBRduGUnB
        7aBG2wR8X/dY6yS+a3UGXY0=
X-Google-Smtp-Source: APXvYqzNejdO0h3HwbmR6Ea4/+c25eJuV/M/VrMxzmJOnQOWdGpQbKcXUy2bDptfP0V1U6/CDnFJIA==
X-Received: by 2002:a63:a54d:: with SMTP id r13mr59335330pgu.138.1579520353887;
        Mon, 20 Jan 2020 03:39:13 -0800 (PST)
Received: from localhost ([43.224.245.181])
        by smtp.gmail.com with ESMTPSA id v9sm2419142pja.26.2020.01.20.03.39.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 03:39:13 -0800 (PST)
From:   lijiazi <jqqlijiazi@gmail.com>
X-Google-Original-From: lijiazi <lijiazi@xiaomi.com>
To:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        lijiazi <lijiazi@xiaomi.com>
Subject: [PATCH v3 3/3] lib/vsprintf: add two device node flags
Date:   Mon, 20 Jan 2020 19:38:29 +0800
Message-Id: <49e5a1c51283b3ea829dc7a04028121764cf5961.1579423564.git.lijiazi@xiaomi.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
References: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
In-Reply-To: <2d432e67cab2eb51f36f5b2e904a185ef48df6e0.1579423564.git.lijiazi@xiaomi.com>
References: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com> <2d432e67cab2eb51f36f5b2e904a185ef48df6e0.1579423564.git.lijiazi@xiaomi.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add two device node flags, and use OF_DEVICE_NODE_FLAG_MAX instead
of sizeof("xxxx").

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: lijiazi <lijiazi@xiaomi.com>
---
Changes in v3:
 - check the flag in the same way as before.
 - split v2 to 3 patches.
---
 lib/vsprintf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 7c488a1..b73e584 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1937,7 +1937,7 @@ static noinline_for_stack
 char *device_node_string(char *buf, char *end, struct device_node *dn,
 			 struct printf_spec spec, const char *fmt)
 {
-	char tbuf[sizeof("xxxx") + 1];
+	char tbuf[OF_DEVICE_NODE_FLAG_MAX + 1];
 	const char *p;
 	int ret;
 	char *buf_start = buf;
@@ -2001,7 +2001,9 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
 			tbuf[1] = of_node_check_flag(dn, OF_DETACHED) ? 'd' : '-';
 			tbuf[2] = of_node_check_flag(dn, OF_POPULATED) ? 'P' : '-';
 			tbuf[3] = of_node_check_flag(dn, OF_POPULATED_BUS) ? 'B' : '-';
-			tbuf[4] = 0;
+			tbuf[4] = of_node_check_flag(dn, OF_OVERLAY) ? 'O' : '-';
+			tbuf[5] = of_node_check_flag(dn, OF_OVERLAY_FREE_CSET) ? 'F' : '-';
+			tbuf[OF_DEVICE_NODE_FLAG_MAX] = 0;
 			buf = string_nocheck(buf, end, tbuf, str_spec);
 			break;
 		case 'c':	/* major compatible string */
-- 
2.7.4

