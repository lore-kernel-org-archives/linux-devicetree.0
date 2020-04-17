Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBECC2BB85
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 06:53:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CBE122202
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 06:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BE2nEUk+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgDQGxi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 02:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgDQGxi (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Apr 2020 02:53:38 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0828FC061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 23:53:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h9so1736118wrc.8
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K/0zoHrBlMR3DZlg98Em/9230jK4Ec4IG04PFP4xQ44=;
        b=BE2nEUk+WZiH1EJpZ9tC2vWtZqW87Kk/w06Raq2RF+GmPOtYQJXVFKix2TS3F8ygwD
         PwAxRr5bWf3KrV02zm6qOLjEaHPd4Hd+QYfiYalZRMWcr5HyNyR5sBDwrln1CLPiXnJv
         T+KQ7HNH3mU/e9lTYIc4Bv76cBy84puEFS7U8h5sZXk5N6PexuqCe/3gAP0nUzIrwXDJ
         fRssq44e1gUef/eVcsj24F77JR8C432FuwuI+vkZs8ADEkwb16ZodJB0eBRT983dK0ud
         pGUEv4MOsKX8KmrL19wnaqgi5v2TtlvpFHYHabVudUTiMOgcF/1SzSUvIBKdcGTSiuz4
         4UKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K/0zoHrBlMR3DZlg98Em/9230jK4Ec4IG04PFP4xQ44=;
        b=ML0p1ILWNzehklpr4wtda/6pUyqdW7moHsM8c1lhtViPT/DEX+X26kpUxq18iKGymt
         mhYDfuUUf9WrzKsShiNwlK//fTP0ZmXdyYP2481exnzvYHsNjkSLwIRHRZqEKHiIrT5D
         Cq58fECwI7gsWFjm37W1KQHaic+saqqh/IFNV1IVPmCw/RSA0iFXP4GSPjPnQ3bLRgKR
         YFiD9bBXALQk6pmno9NGAo7egOCt+ivXb1qh/cRrdVvsQhat0CIb9Ko0KYteNzAYKrAV
         SLru/1hcOHV3cc0+nsYy4QK42Zy5KwL9JsI2YRpC0AplZiqE6k+xmzGIH7LDdHdlHeRj
         +viQ==
X-Gm-Message-State: AGi0PuZm1bH0KMYXZnYzt+lz2PiAt56bZPWrPeGNfbfjQMAzKsXfH2YI
        ouIwHVKh7ols2V4lubVLvdI=
X-Google-Smtp-Source: APiQypIl5Ir0ioY2kZc0ZIdoCByjDBHyG6eBTWsNyaJmVZYmdVnIvz3yrByACmf7pUwLWKne+1AZ6Q==
X-Received: by 2002:a5d:54d0:: with SMTP id x16mr2157112wrv.86.1587106416571;
        Thu, 16 Apr 2020 23:53:36 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id o18sm4236593wrp.23.2020.04.16.23.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 23:53:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: panel: Document some missing compatible strings
Date:   Fri, 17 Apr 2020 08:53:28 +0200
Message-Id: <20200417065328.1578603-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add missing compatible strings for the Panasonic and Chunghwa panels
found on NVIDIA Dalmore and Cardhu boards.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index b2e8742fd6af..88ac75333a5e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -29,6 +29,8 @@ properties:
       # compatible must be listed in alphabetical order, ordered by compatible.
       # The description in the comment is mandatory for each compatible.
 
+        # Panasonic 10" WUXGA TFT LCD panel
+      - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
 
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 393ffc6acbba..6c21650664e2 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -82,6 +82,8 @@ properties:
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
       - chunghwa,claa101wa01a
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
+      - chunghwa,claa101wb01
+        # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
       - chunghwa,claa101wb03
         # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
       - dataimage,scf0700c48ggu18
-- 
2.24.1

