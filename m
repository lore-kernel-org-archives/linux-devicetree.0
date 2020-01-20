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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32927C3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 11:38:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08ED021D7D
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 11:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7aA0aEG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgATLi4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 06:38:56 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38043 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgATLi4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 06:38:56 -0500
Received: by mail-pf1-f193.google.com with SMTP id x185so15734116pfc.5;
        Mon, 20 Jan 2020 03:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tfDudhe4YwPhimj4OY+6xepeXHlujEddd57iBSeIvWM=;
        b=L7aA0aEGSWvZ4vQl+AgD8TDhudr23I/j/16xLLaHUZpQM+BjCKDGAqiCVqkrsal9aT
         82/nxsFSNT/DudTxnLIoS3OwGf81OEAS3OSbeoretAd4SMz2umWnQ+j/jmS41LQbpmkT
         CPEnO83inYAYniVW8YwHXUfDyLDBSwfG9oDv3hO0UIn1ouI6n0Tu1sUpvYg82rFeOJc8
         oWWhRPSCvyqvUOo6Sc+sArEPa9JsUSerNMouucSyVRCIipkIrA/i4s+q70ZflxeGOnKh
         mxxHwd2hpQZgH1p8SaTZWed7PQC0onIwQCWIQIOKm6bPP1FmwH9IfOTVZz0Pm8lNNzTr
         pD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tfDudhe4YwPhimj4OY+6xepeXHlujEddd57iBSeIvWM=;
        b=VyuOTAXHFqHvNyrti2GZ8Wj0niW8mjYwJIsRgfHICFU/fMlDMruVTiHmRIYdBeJzeo
         hrxVxvCIovl2TAciIXTRN8xE0JYcDYWpL3kMxCz2e2pnmg8ZvQjwvBxCqIC+FCuV7+Tl
         UZMtHXapQngT+ez6cNtXb67ppRJAnP28gccHl7H2yzevLs/ZmbiahGGHqk1hS933fbPW
         16kz5LuqiFFxnq7NthodCE1HVzdPR7qmUfyqpRA7FHiqFPdCc6qGi1kH+y6VrsSVKPSS
         bIW5GHy6ackuwQ9LT4uFEmqVD5r+jkQlYN5GMqLK2IGxKPa7mx5dW62WIteu6APQWNyF
         U/+Q==
X-Gm-Message-State: APjAAAWmgYuTILJf2Kz6zzPZACLRmxmbf5nRY2FIpl5yyBiyxAXwlEjL
        AEmAWZtXzKoiYnATGsMKWrs=
X-Google-Smtp-Source: APXvYqyzgW99tFhujgj0xRGN1iCXoSu4sD/5m5vssESp1Ykxk5yhA5oZh7lYTTS9gEynaRL8CfdrIQ==
X-Received: by 2002:aa7:8a99:: with SMTP id a25mr16853915pfc.42.1579520335762;
        Mon, 20 Jan 2020 03:38:55 -0800 (PST)
Received: from localhost ([43.224.245.181])
        by smtp.gmail.com with ESMTPSA id v4sm38808846pfn.181.2020.01.20.03.38.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 03:38:55 -0800 (PST)
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
Subject: [PATCH v3 1/3] lib/vsprintf: add two device node flags for %pOF
Date:   Mon, 20 Jan 2020 19:38:27 +0800
Message-Id: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add two device node flags into printk-formats.rst.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: lijiazi <lijiazi@xiaomi.com>
---
Changes in v3:
 - use tab instead of space.
 - split v2 to 3 patches.
---
 Documentation/core-api/printk-formats.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 8ebe46b1..9271f20 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -441,6 +441,8 @@ Examples::
 							d - detached
 							P - Populated
 							B - Populated bus
+							O - Overlay
+							F - Overlay free cset
 
 Passed by reference.
 
-- 
2.7.4

