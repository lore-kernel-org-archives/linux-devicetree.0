Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B39C433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEF08206C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHwdQmRe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgFLOUH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgFLOUG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:06 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9E0C08C5C1;
        Fri, 12 Jun 2020 07:20:05 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id j198so9296435wmj.0;
        Fri, 12 Jun 2020 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3SBlnX8CB++4asjTi2qXO82F96zMggVrXN5oDOQFuUc=;
        b=bHwdQmReuoHESd4KYAzL+hmDd3DvaRow4voPxoznNDXLWTLoMBQ3KHhH/9a0D42cnz
         gB1VFRJsiUzUR+TNnfSI2esa0ikyM8YO/lSnJqnYph+IksJx0KiktE0XzGZV6Tu8ICUG
         fUIrBCvvfNGuD0MSTnSwk1qM9uvgac8GwnfHLOntnElosHeeyGkFX55pbiBkEA7RvGQX
         XgnCqXdWdwnwJVFOJ1WMCxLCIpRtlAE+RxOlAPBGwFWHxW3eZIxsQ4d+fgkoKOSfqkKX
         ptupUShhKgrSb36XUZ1jd4rh2LZFAzMDGvHdyM6t1SpUrN8rvddzIX3awcYpk2jif1Hh
         sNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3SBlnX8CB++4asjTi2qXO82F96zMggVrXN5oDOQFuUc=;
        b=N7VqHPrx0kQ0MNxcy4Wvbw6bJCRsWN69G19VE6DtDjgWPb0b02gpDy+Gcd4qQvodoB
         Pv8AS4t/X/pAC5iGjubIf6oaLZZQM/o05S64aQrebRr2pP/WEpwMl6Kk1gOYU18++Q+s
         CSxqSy8/ioV+gT/tn6ivEJCqVBr9CBFLvHSFdf7nvtV0Zjbt5z+PX9FLRzoTuDkhphQL
         e/bBKuunqLCm7SG2bVQ2u1ZC3b3ZH7AD7rgD46THfhppZFuCknHD5w80yBUUAdCH9RMD
         s5OO296/DNc3aOiNXkwwnoUh8D4AbsukckXtrKgVu6ZvTzb1uTCSoN/RgClz9w5wLJoG
         CipQ==
X-Gm-Message-State: AOAM530f8ddxq1CktTiPR+mez18NWD1+lMpBnJF437VGiwsCMsl6SxR7
        8GScwWYsYiYaoNQSPCzaMLF99MAw
X-Google-Smtp-Source: ABdhPJz0NmexhHI4BVAr63c3c2LAvBHgRHJ25q0+MmNVXyNROpdLZyC9dHle9O28NLITSnIIupiR3A==
X-Received: by 2002:a1c:6006:: with SMTP id u6mr13599915wmb.39.1591971604004;
        Fri, 12 Jun 2020 07:20:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g187sm9724996wma.17.2020.06.12.07.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 27/38] dt-bindings: tegra: Add missing compatible strings
Date:   Fri, 12 Jun 2020 16:18:52 +0200
Message-Id: <20200612141903.2391044-28-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612141903.2391044-1-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Nyan Blaze and Nyan Big, as well as Jetson Nano (P3450-0000), Darcy
(P2894-0050-A08) and Pixel C (Smaug) were never mentioned. Add them.

While at it, also fix a typo in the compatible string for Apalis Tegra30
v1.1 evaluation board.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/arm/tegra.yaml        | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 60b38eb5c61a..043ca543be8c 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -49,7 +49,7 @@ properties:
           - const: toradex,apalis_t30
           - const: nvidia,tegra30
       - items:
-          - const: toradex,apalis_t30-eval-v1.1
+          - const: toradex,apalis_t30-v1.1-eval
           - const: toradex,apalis_t30-eval
           - const: toradex,apalis_t30-v1.1
           - const: toradex,apalis_t30
@@ -80,6 +80,33 @@ properties:
           - const: toradex,apalis-tk1-v1.2
           - const: toradex,apalis-tk1
           - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-big-rev7
+          - const: google,nyan-big-rev6
+          - const: google,nyan-big-rev5
+          - const: google,nyan-big-rev4
+          - const: google,nyan-big-rev3
+          - const: google,nyan-big-rev2
+          - const: google,nyan-big-rev1
+          - const: google,nyan-big-rev0
+          - const: google,nyan-big
+          - const: google,nyan
+          - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-blaze-rev10
+          - const: google,nyan-blaze-rev9
+          - const: google,nyan-blaze-rev8
+          - const: google,nyan-blaze-rev7
+          - const: google,nyan-blaze-rev6
+          - const: google,nyan-blaze-rev5
+          - const: google,nyan-blaze-rev4
+          - const: google,nyan-blaze-rev3
+          - const: google,nyan-blaze-rev2
+          - const: google,nyan-blaze-rev1
+          - const: google,nyan-blaze-rev0
+          - const: google,nyan-blaze
+          - const: google,nyan
+          - const: nvidia,tegra124
       - items:
           - enum:
               - nvidia,norrin
@@ -91,7 +118,22 @@ properties:
               - nvidia,p2371-0000
               - nvidia,p2371-2180
               - nvidia,p2571
-              - nvidia,p2894-0050-a08
+              - nvidia,p3450-0000
+          - const: nvidia,tegra210
+      - items:
+          - const: nvidia,p2894-0050-a08
+          - const: nvidia,darcy
+          - const: nvidia,tegra210
+      - items:
+          - const: google,smaug-rev8
+          - const: google,smaug-rev7
+          - const: google,smaug-rev6
+          - const: google,smaug-rev5
+          - const: google,smaug-rev4
+          - const: google,smaug-rev3
+          - const: google,smaug-rev2
+          - const: google,smaug-rev1
+          - const: google,smaug
           - const: nvidia,tegra210
       - items:
           - enum:
-- 
2.24.1

