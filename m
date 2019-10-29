Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E10CA9EAE
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 19:18:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 769AB21721
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 19:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rDap4f8X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbfJ2TSC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 29 Oct 2019 15:18:02 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40449 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfJ2TR6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Oct 2019 15:17:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id w9so3622240wmm.5
        for <devicetree@vger.kernel.org>; Tue, 29 Oct 2019 12:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dZwbF/SbBh6c2Dy0gSgliZ/LGqu5tyPeh1FOp7sb9Kw=;
        b=rDap4f8XVs+sdZ1jZm/SNk4IDXdR6CXWr4/wcFisDwgqQZtBpFnrrc5kdBcEREmeC3
         OKcHSwCWwvEvJe0LyN8pOutiDGI5hifkUi/azcjr1/WnI+BldZ+z5UugtgMrfzvW37Qs
         U/9vUgbdhjJRB+PYg86ryT2vHQ4nqX4sskxmux0s9Prz/JglQIqK+ZNUaCl8qI6lS0Rs
         a4QssVPOvSgxy1+vl0FgUpsVKSjrcuKGxdJ1BcCSjAPE6P/1O7S/EzhDvFclwdh/vsJ1
         Qp30U5vUnFOVih1FeTW73jUO8mx5OmULlV3cvcWnBYq97U1fxms6II0djHc40TaKq5be
         6I7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dZwbF/SbBh6c2Dy0gSgliZ/LGqu5tyPeh1FOp7sb9Kw=;
        b=olnPmt5wZouNf9lJx3avoqlPTvIGRcDDIT3kzYtWmDHYJOMOo4ESLPznmoJQPwZ4nh
         8RJqH8rE+3weKriEIvzHtpXGGborfWn+5yvHte0o9mGxBp5NSLW/wIX2laDOsfo9sNih
         wVfRLWOb1LPtK9oRgME0EA1ReXvYgsL5NYaHyXNxPtBIn2mkZS3vc/hCm76ZdC+rvREN
         CrSgeXMvCCwtx8a3Akd+lKyLfLgobxprdtP+reg1Nn5HRPyfojParXV8kbP5dQwCmSMi
         lGAZbGTMCLHidIosLTAhKONHUG6WhmgWNuUCgu5UpohZ7EfTMJZYCNSSjsXhJIkRtyrE
         IspA==
X-Gm-Message-State: APjAAAVJbFkpm78kjvJW8DTtpZxxL/huE7+6IzdY/vUEBgyQeItuO02D
        G9uOx+XuPzS1z/0gHry6DcYu9w==
X-Google-Smtp-Source: APXvYqwCAE8ESCkBHAd86+tiWOgGEzPbep8K9+RZYmy0IIqwIIpbUpsQsebkXApcsDObyT5OinaPPQ==
X-Received: by 2002:a1c:7704:: with SMTP id t4mr961210wmi.4.1572376675429;
        Tue, 29 Oct 2019 12:17:55 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id v128sm5493043wmb.14.2019.10.29.12.17.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 29 Oct 2019 12:17:54 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mark.rutland@arm.com, maxime.ripard@bootlin.com,
        robh+dt@kernel.org, wens@csie.org, jernej.skrabec@siol.net
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 1/2] ARM64: dts: sun50i-h6-pine-h64: state that the DT supports the modelB
Date:   Tue, 29 Oct 2019 19:17:42 +0000
Message-Id: <1572376663-22023-2-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572376663-22023-1-git-send-email-clabbe@baylibre.com>
References: <1572376663-22023-1-git-send-email-clabbe@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The current sun50i-h6-pine-h64 DT does not specify which model (A or B)
it supports.
When this file was created, only modelA was existing, but now both model
exists and with the time, this DT drifted to support the model B since it is
the most common one.
Furtheremore, some part of the model A does not work with it like ethernet and
HDMI connector (as confirmed by Jernej on IRC).

So it is time to settle the issue, and the easiest way is to state that
this DT is for model B.
Easiest since only a small name changes is required.
Doing the opposite (stating this file is for model A) will add changes (for
ethernet an HDMI) and so, will break too many setup.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml     | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 972b1e9ee804..9a1e4992b9e9 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -594,9 +594,9 @@ properties:
           - const: pine64,pine64-plus
           - const: allwinner,sun50i-a64
 
-      - description: Pine64 PineH64
+      - description: Pine64 PineH64 model B
         items:
-          - const: pine64,pine-h64
+          - const: pine64,pine-h64-modelB
           - const: allwinner,sun50i-h6
 
       - description: Pine64 LTS
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index 30102daf83cc..f9070d9e6c43 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -10,8 +10,8 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Pine H64";
-	compatible = "pine64,pine-h64", "allwinner,sun50i-h6";
+	model = "Pine H64 model B";
+	compatible = "pine64,pine-h64-modelB", "allwinner,sun50i-h6";
 
 	aliases {
 		ethernet0 = &emac;
-- 
2.21.0

