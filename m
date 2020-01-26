Return-Path: <SRS0=8cl9=3P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF12C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jan 2020 17:28:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 626FC206A2
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jan 2020 17:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km0cks6/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgAZR20 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Jan 2020 12:28:26 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:33716 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgAZR20 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Jan 2020 12:28:26 -0500
Received: by mail-pf1-f182.google.com with SMTP id n7so3768614pfn.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jan 2020 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0GNKW4dAwC2IPC8DrYUW50WkaWvnguz2WhfJNZ54dek=;
        b=Km0cks6/sFV3oiB56/yggF+aQLxIA4J9B4LIGYhNFDC+/SM1aUcyd467DaxI5nxnQn
         0REXNY5Wu0POg+RoSVoBKXKahMcS50F/psD1ddimJGtMHb/LXYv6SzkY/JnltS9aF60A
         jl98lfV6W48QShjjNaxCOZYWbzrsHn1Nz+CEz8ZWzqowdv2sbblWj/ktAY6g71vhkxNB
         XkmUmGeOmj2qUJNM0H/3BEG9q0j5h9zwIRGsyizNf6AyrhKHY8Uu7Lc0U+GJp6dc7PPy
         Rl1NvPogwnEVKPApPQJvmCb+06oMO3CFBedPyg1dvoxcBalL30F/DeSkhd4VnUkUhIC0
         NGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0GNKW4dAwC2IPC8DrYUW50WkaWvnguz2WhfJNZ54dek=;
        b=WVrQ0N0QvK0bZ/1Q8OzWlbmVJ7o2/cj/yB+kdQ9RKtfMTQgE7zkuD3OSR5P8LFBnb+
         xf5ED+QfVsni3NAbTWl9CE/l9FGgFQVQdj2z6cUt5RCYcnL+4+4+kHhlFvuYPGs/RWt/
         SmHqPU+fFcDOdvYBPb1O7/lQUhaa4Bd+AhUvWnAhDAwtPNXLSWOmvW92SrixsEYPNSai
         xgp/o7yAsvoCdq8O0dGBF4RsicvXF3gLwjviBX8FizLaoOFfErjuIj+FobQ4E2doc/dh
         cplSxZA7kXaz762oY5lFWb5Iq5DYWACNe69LLUVWQyJtApvYRpys7nsmCnDGusLCsv/D
         hEyw==
X-Gm-Message-State: APjAAAUG/IXOClZlthK14wuvZFSUWPIRAsZJPN4yFKFwMkYqO6UEGWMY
        eQgfc4a69k4byyqTsOZ05BI=
X-Google-Smtp-Source: APXvYqw1zK8liHYvmN9ODwDeELexQ9uNOrA5Ps22BtKN+oB9HLC2Jdhxr/eHcZQiIPGQ4jq/MDzGDg==
X-Received: by 2002:a63:cb48:: with SMTP id m8mr15798176pgi.128.1580059706093;
        Sun, 26 Jan 2020 09:28:26 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
        by smtp.gmail.com with ESMTPSA id e16sm12979424pgk.77.2020.01.26.09.28.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 26 Jan 2020 09:28:25 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH] dt-bindings: add vendor prefix for OzzMaker and Waveshare Electronics
Date:   Sun, 26 Jan 2020 22:57:33 +0530
Message-Id: <1580059653-11320-1-git-send-email-kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add vendor prefix for OzzMaker [1] and Waveshare Electronics [2]
Both are display manufacturers

[1] https://ozzmaker.com/about/
[2] https://www.waveshare.com/contact_us

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac4804d..dfb926d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -721,6 +721,8 @@ patternProperties:
     description: OmniVision Technologies
   "^oxsemi,.*":
     description: Oxford Semiconductor, Ltd.
+  "^ozzmaker,.*":
+    description: OzzMaker
   "^panasonic,.*":
     description: Panasonic Corporation
   "^parade,.*":
@@ -1038,6 +1040,8 @@ patternProperties:
     description: Vision Optical Technology Co., Ltd.
   "^vxt,.*":
     description: VXT Ltd
+  "^waveshare,.*":
+    description: Waveshare Electronics
   "^wd,.*":
     description: Western Digital Corp.
   "^wetek,.*":
-- 
2.7.4

