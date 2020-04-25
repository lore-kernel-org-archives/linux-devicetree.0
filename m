Return-Path: <SRS0=EFsK=6J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965BFC55191
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 10:53:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76FE620714
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 10:53:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndE2hgyr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgDYKxR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Apr 2020 06:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgDYKxQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sat, 25 Apr 2020 06:53:16 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C67C09B04A
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2020 03:53:16 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id l11so9826414lfc.5
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2020 03:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IzeTE2texRYxCKXCZDxJOHxqLljr3m6azTZmuvsDOFY=;
        b=ndE2hgyrPoT2LposSqa9JUZsunhxGC8oGlG0vJC1LW3/3wZL/hS5coXVfEl3Z+JdML
         7a8DH9qUh9ScOzFETxr3QmCjz4zOS29kqgg6t8fX2tWjVkKKgfsicZKL+MzNEM05EEd8
         y971eCIYtbpTJ+0+bElGwCMc3RMheY04604jB2qHTVyWDGjet5lZNQ2f67csx/JWDnYF
         19JD7NHzswCk+VLys2BUBRUbNZ7602GmPrFI50HSu7L1iBaeBPBrtgS2KHWBB3F4Ox2I
         hrlGFQmS23v9ocUAgdjRgXwRsAga+5cF8CNE4xkHBfGrV8M4pUY2YMEFNTbgnOS0AqKK
         QC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=IzeTE2texRYxCKXCZDxJOHxqLljr3m6azTZmuvsDOFY=;
        b=Gr5a+JCxJIQvhDYGxzN1eHREnQmZJcR20QXrkg+aFiNVwmtRB5gDcNL+xtv20qCwvx
         sfejYRqWb0S7iSPLv7zm04vdEtGJCqhaJZhFISICTmQ+LtEnVMWMX421TwEtsM7au4IF
         y5Cuyz1o6xtG4wRKBofr02kcqSESjOu8CLaOegGrH3E1pjKOTQqD8Cx2K7KxY1iE8pa7
         lTImkKldOCPqIPCYCwRqd8D059t5+Onixao/Aw1pinncyr7vm/WLalWmsCN3iTxij2yn
         pTB4nAg/o4VDuem5KAsCn1LNu+SHeo3rTpiWbBPEUAicvnh8u+1McgDfBW7R7so0bTIw
         UvIQ==
X-Gm-Message-State: AGi0PuYKj20WOd6JSvTV6X0TQZ6O6XTqzgD+SDYfm90MhurykH0H5Oug
        P7ikS8yyD/9NdJ0Gdlw0m3IRbo4X
X-Google-Smtp-Source: APiQypJ9a4dFVTSMVyKxixde7SHbhXM7ShiO32VId+Brak+fonYbdBRd5c5j/YITjT1T68ysHHLInA==
X-Received: by 2002:a19:550a:: with SMTP id n10mr9316127lfe.143.1587811994698;
        Sat, 25 Apr 2020 03:53:14 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id c4sm6501805lfg.82.2020.04.25.03.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 03:53:14 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 1/2] tools/dt-extract-example: support examples with root node
Date:   Sat, 25 Apr 2020 12:52:54 +0200
Message-Id: <20200425105255.1064-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200425105255.1064-1-sam@ravnborg.org>
References: <20200425105255.1064-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Examples are prefixed with boiler plate in the normal case.
In the rare case a root node is required this boiler plate shall not be
used.

Example with root node:

    / {
        chosen {
            ...;
        }
    }

Teach the script to recognize that the example starts with a root node
and avoid the boiler plate in such cases.
The root node is recognized using a simple regular expression search.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 tools/dt-extract-example | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/dt-extract-example b/tools/dt-extract-example
index 99e59c3..0e933e4 100755
--- a/tools/dt-extract-example
+++ b/tools/dt-extract-example
@@ -4,6 +4,7 @@
 # Copyright 2019 Arm Ltd.
 
 import os
+import re
 import sys
 import ruamel.yaml
 import argparse
@@ -17,11 +18,14 @@ example_template = """
 {example}
 
     }};
+}};
 """
 
 example_header = """
 /dts-v1/;
 /plugin/; // silence any missing phandle references
+"""
+example_start = """
 /{
     compatible = "foo";
     model = "foo";
@@ -49,7 +53,15 @@ if __name__ == "__main__":
 
     if 'examples' in binding.keys():
         for idx,ex in enumerate(binding['examples']):
-            ex = '        '.join(ex.splitlines(True))
-            print(example_template.format(example=ex,example_num=idx))
+            # Check if example contains a root node "/{"
+            root_node = re.search('^/\s*{', ex)
 
-    print("\n};")
+            if not root_node:
+                print(example_start)
+                ex = '        '.join(ex.splitlines(True))
+                print(example_template.format(example=ex,example_num=idx))
+            else:
+                print(ex)
+    else:
+        print(example_start)
+        print("\n};")
-- 
2.20.1

