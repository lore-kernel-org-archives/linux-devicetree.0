Return-Path: <SRS0=dVBB=5N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0973C2D0EC
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 18:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD3D82071B
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 18:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI9p6o+c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgC1Sxg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 28 Mar 2020 14:53:36 -0400
Received: from mail-qv1-f67.google.com ([209.85.219.67]:37301 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgC1Sxg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 28 Mar 2020 14:53:36 -0400
Received: by mail-qv1-f67.google.com with SMTP id n1so6765959qvz.4;
        Sat, 28 Mar 2020 11:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8fZWkFLO2sdKGPoR0hBsKxWxQxeZoxepub1q+Ci3nAA=;
        b=AI9p6o+cnqSxNRxmf6L3z6B/1I+4CDVnYL8jgoTuoubtpLJoJrXIFQifwKMz4ylkJR
         bDleVs1qAi8BYRXw3WCaKldWwiftfgrArw9hwBhshPwuCilqtgNcxG88dONHZEV4Zhel
         DD0wPxn9YEePT/XBP11UlcKQhQRz+Q+3eO88NCZqB6ZzRhgmW41Ve7aQmwv9QPYyhLKT
         rhE6Vf5G3MOv3igNpb4r0Ca87fjMjPGskqUg1uhGQpsWA1mFT/0WgY1qPxJXFE8BW8Su
         k1G7jKHLLqynoH+LG89l83NTslq365WITs66WR1jN+VZU17PnRBOALYygivSyDa5K/uL
         f/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8fZWkFLO2sdKGPoR0hBsKxWxQxeZoxepub1q+Ci3nAA=;
        b=R6l1uqNb+s8U1oVbJIEWk9qG9IIQy4Vi6HHLNOnLh7vGk6hApff+lH8Y4LiOZo3Tep
         4Q3IUW1pAt2gpptjkyAV/T3TsuPjM4y+iqi3IxD7Onh07zb9EvLi/HahT7ni/a88qceO
         RJikdK9smcZWPyIX+ZBN3MLOTdT4nWUuH7BJzw34Ju30hE7B0ypYwpabfKbcQ0Q342n4
         7c0W9+uHboPfhN/CNYbtXFycYvYtzIMU7BHXXigYfZWyWd5OxN9Fl4LMniPvkAnOEPEH
         Lt8oj1IVKt3cPzfWn1rAN4YA7EPJt1m7Xf/07f9gME3Wm3Yj6pYrktFCRlsxHyHEn7Ax
         Ul1g==
X-Gm-Message-State: ANhLgQ0yeqmcH7kinOkBZeM12r8uHIkMgXoVlTtkS5meu6cA8eQiH+lq
        n462w6B5TBsYKUyHRTBzNjc=
X-Google-Smtp-Source: ADFU+vvnRLp25ZCtGB/wiMAgJwBvO+p9cke13vjfMhM8k00ftPbd+dXxnlUZDhFcxOhhIbibeGm6wg==
X-Received: by 2002:ad4:4ba5:: with SMTP id i5mr5064377qvw.181.1585421613295;
        Sat, 28 Mar 2020 11:53:33 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id 31sm6708136qta.56.2020.03.28.11.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 11:53:32 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] dt-bindings: clock: syscon-icst: Remove unneeded unit name
Date:   Sat, 28 Mar 2020 15:53:26 -0300
Message-Id: <20200328185326.17948-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following warnings are seen with 'make dt_binding_check':

Documentation/devicetree/bindings/clock/arm,syscon-icst.example.dts:17.16-24.11: Warning (unit_address_vs_reg): /example-0/clock@00: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/clock/arm,syscon-icst.example.dts:17.16-24.11: Warning (unit_address_format): /example-0/clock@00: unit name should not have leading 0s

Fix them by removing the unneeded clock unit name.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Removed 'dac' from the Subject

 Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
index de9a465096db..444aeea27db8 100644
--- a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
+++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
@@ -91,7 +91,7 @@ required:
 
 examples:
   - |
-    vco1: clock@00 {
+    vco1: clock {
       compatible = "arm,impd1-vco1";
       #clock-cells = <0>;
       lock-offset = <0x08>;
-- 
2.17.1

