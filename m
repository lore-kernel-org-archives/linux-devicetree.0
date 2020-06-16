Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8443C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:18:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6A7620B80
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="vVwdSymK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbgFPMRV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 08:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgFPMRR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 08:17:17 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37532C08C5C3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:17 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id h22so1493601pjf.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G9xOHne2zIdrUjfESWBnXW0No6K6w+tqmOd2DceQ1ag=;
        b=vVwdSymKu72sq4RCvUQabFC7yM4l3p4X/ndVICxDX1VNQCFAJO+UsygZD4b0YIPG2f
         1wbTpsJeuzP0Hu63LbbXIyH5mQMTWsFtoBTrv5dILeXsG1qougQOzVTTHJU8BI5IlxUf
         v0qxjbIjDGv6l/ewXU0Tk2tBv4f3LFS9ZLlDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G9xOHne2zIdrUjfESWBnXW0No6K6w+tqmOd2DceQ1ag=;
        b=a8Bd00V5zya077fGeS9d7YrwWd9EPGMfwuaydAlzy9ljdyBR6UzLvQYhRDwljOG0Zf
         8SDEoOZ236r4rOhR1TkONCAAFGyV/EyvGT0mQpy9ZoL2+IrHq8p2xd/tooiKofhEjMml
         3De6MF33YCymAbkbUs5mQH1OzapcGL8LmKiANaC4u+o0k/k1zW+z9YJqQ3OGmTC81OS7
         x8JpC4aETbApmfvBbIilbtoyk95ZIBnP4A1dMOzT4Q/d2I6zCikQC/9PxiR931/7CzCF
         Iw2HDUXBMffmgMTOcgZMU5ksLk9NIUSKj+w3lDq/oJ4dvMKhO1Se8kxtbSPIbJEMexOR
         DRWw==
X-Gm-Message-State: AOAM533VbkM2ZoIqPNUdMGoEl+bAQx4p0k/B4ZKbpjg0YnwJjchyIB2c
        3HmTT9RZSDAu2hgLnIoz6Sh1BjU+dC0=
X-Google-Smtp-Source: ABdhPJwI/fPYMP20WdWnNJgrtyVxLXkzPa5mk+7lTJLw+H3YRP46fxdZKBkxp6hwOt1VYmsV8cVduQ==
X-Received: by 2002:a17:90a:e007:: with SMTP id u7mr2537564pjy.208.1592309836718;
        Tue, 16 Jun 2020 05:17:16 -0700 (PDT)
Received: from shiro.work (p1285116-ipngn200805sizuokaden.shizuoka.ocn.ne.jp. [114.171.61.116])
        by smtp.googlemail.com with ESMTPSA id f23sm2360703pja.8.2020.06.16.05.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:17:16 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v4 03/12] dt-bindings: vendor-prefixes: Add 70mai vendor prefix
Date:   Tue, 16 Jun 2020 21:15:16 +0900
Message-Id: <20200616121525.1409790-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200616121525.1409790-1-daniel@0x0f.com>
References: <20200612130032.3905240-2-daniel@0x0f.com>
 <20200616121525.1409790-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add prefix for 70mai Co., Ltd

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba5bd3b0ed9a..53cd050668e6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -23,6 +23,8 @@ patternProperties:
   "^(simple-audio-card|simple-graph-card|st-plgpio|st-spics|ts),.*": true
 
   # Keep list in alphabetical order.
+  "^70mai,.*":
+    description: 70mai Co., Ltd.
   "^abilis,.*":
     description: Abilis Systems
   "^abracon,.*":
-- 
2.27.0.rc0

