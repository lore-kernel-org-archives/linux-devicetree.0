Return-Path: <SRS0=YnW7=6Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76482C3A5A9
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 May 2020 14:36:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52D3C20661
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 May 2020 14:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="KMrV8fTy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgEBOgG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 2 May 2020 10:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbgEBOgD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 2 May 2020 10:36:03 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5745CC061A41
        for <devicetree@vger.kernel.org>; Sat,  2 May 2020 07:36:03 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id g26so6392595qtv.13
        for <devicetree@vger.kernel.org>; Sat, 02 May 2020 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ljJmnQCUTZKPRkc0zs6SnR4s+mWgVYVr0Il67ALvBck=;
        b=KMrV8fTyUSAF37A6JdVe1gDVy63q7jWb9y1cI1PiI/6crlu/z5GxuvVsMtuIwUEgBh
         +sH6xCm4NF/g8elxz/jnoaABo9S/HPhcvCvfn8IfrrVXnfwadZ5ioZrf/HvX8SVbX9fk
         2h95oqNpTWTqKRHKz6gZrbG4wS6N1SIrNVduoLjj+tgncaVNMjYwEIJgISZ+T9YwGX6U
         2+G5Ouj/47IBYu6SfCNtWEGOcdz/S6ouUx9nxw7dsc2gBbXVk7N3fKBe+wI5EdYJNb2J
         mfOYAaSkM4fEuOTBON+mSyl5Alh3qaK6HJMxmNGC6W7WGY1V2OP7iNitZ6WcUyz9RnYz
         NzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ljJmnQCUTZKPRkc0zs6SnR4s+mWgVYVr0Il67ALvBck=;
        b=ZC7mGEzNVTyHVmZyV9Gqd5TB8R2rhfdDPWgkdu5ZGBdKwT1rxVxhoFn1XDrmlUd2OF
         0GvsJ/1n8YyeyqP9wZVdRzfKNOvAdjrBjGysPHEF+sRdReTH8OvY0IsC5H3lLf/f2dLm
         J5FBJ7uX3jEjO2iKTK/Fh7KZIL0D/p1MUBzzh87MuwIFBSwnwY7GAlgwcf6zzVp2LbOL
         cehyv0jKnaSfjO3NMV73AupZTeu5uKYyQ3+GMNBJzpAkQn9ExTSa/BluClSifVQueawe
         huged7cAyPQuuoSZEZ5FOYZtP9yFAiTc0ZA533DvUGClUGj5Xy+EQ0bKLKvKl0HXXhjb
         R4LQ==
X-Gm-Message-State: AGi0Pub3VUb28yca43JJGUWBI4hqd2I7caNNrXXM2HlpL3ZwjgL04oKU
        mxOXBTN9novAhyECg83f7mqGXA==
X-Google-Smtp-Source: APiQypJsdzd7UoCXyqKPKkBoiyY2XwbdCQVwJbs8WR+2Fs1/U7R9YUFdfdTS75S/PQ+/ZdI49zT2eA==
X-Received: by 2002:ac8:1b70:: with SMTP id p45mr8980083qtk.258.1588430162583;
        Sat, 02 May 2020 07:36:02 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id d23sm5156894qkj.26.2020.05.02.07.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 07:36:02 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        linux-kernel@vger.kernel.org, pmladek@suse.com,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] ramoops: add dump_all optional field to ramoops DT node
Date:   Sat,  2 May 2020 10:35:55 -0400
Message-Id: <20200502143555.543636-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200502143555.543636-1-pasha.tatashin@soleen.com>
References: <20200502143555.543636-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Currently, it is possible to dump kmesges for panic, or oops.
With dump_all it is possible to dump messages for kmesg_dump events,
for example reboot, halt, shutdown, kexec.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/devicetree/bindings/reserved-memory/ramoops.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
index 0eba562fe5c6..3ce424c9ad4c 100644
--- a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
@@ -47,5 +47,8 @@ Optional properties:
 
 - no-dump-oops: if present, only dump panics (defaults to panics and oops)
 
+- dump-all: if present, dump kernel messages during all kmesg dump events.
+  Reasons are specified in include/linux/kmsg_dump.h KMSG_DUMP_*
+
 - flags: if present, pass ramoops behavioral flags (defaults to 0,
   see include/linux/pstore_ram.h RAMOOPS_FLAG_* for flag values).
-- 
2.25.1

