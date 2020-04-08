Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82ABBC2BA1B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50C132075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvFfKCEW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730172AbgDHTvo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:44 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36706 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgDHTvo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:44 -0400
Received: by mail-lj1-f195.google.com with SMTP id b1so9036034ljp.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CHVjRzMuuU310GbyJK/QLhuR1wLfy8v28XEG79WdtmY=;
        b=IvFfKCEWvxdkNAYPSEVha/dK8zD5QE0gDPK02BSmFJKlvn8XlaQ0htmZgD4gBw83c8
         3DTIjAB5biJaExkgbj2gj9kWsGPNvCIOWYW3mp5UG01Vp5dUfXxn7cYKc9nuaUNuk/Yv
         2IVcoh7hAko20Oyh5udG1nh37+n+iQXHNJH6Q3g8HK76c7uK3Mt1EEg9MkZtEwbVyjaP
         U9WYdYFfGd/Z8nQUPyVs7yi/yDAry7UJYeWYpEbu2mjZT+wTqVoqRI9A18FJYfAFTACD
         b/xzV8uEepea49dQhA/I7NPeN9+dcPnrN+5mz49nApt6Pjcr7xoR+lB81T7CTk31R5Ar
         nAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CHVjRzMuuU310GbyJK/QLhuR1wLfy8v28XEG79WdtmY=;
        b=DMb4l65PrpCBePlbgcgJhujN2H8gF64Ks8z/bVDmW9yH8nWV0GtjJOevDpFVw05cgy
         4qeKWT7GKJC5DpUzaiTzllQNkp68o9ugyFKFaDq8T3aJYdBAvss8ifRgwiDxSEP4pguz
         3P9/FeG5iI5DjYiwqSNCoKZHQPvmkork/wVbdU21us5idgir4LvcjLPIiXf4ywHG412X
         RPvasY7VMH9bnA4DfbdjZTNvpzUx+baGqlWBZeJrRt5MOseaTLs5g9ZL/jzNo89O8rye
         WXjwmATzjh5j9ev5bCw7e09XD+5Z6wmGOer6cVD4m1M6laSrQ0HUa/v1fM/stGMCurnK
         +ttw==
X-Gm-Message-State: AGi0PubGLBYnH+cQCqlGGQ0C55jVltgv7WC0ahm4newX93uFeb3VCXLE
        3sIeKYM89SdnwaPbjmR1ZrU=
X-Google-Smtp-Source: APiQypJ91Q004ZE4tYA8kCFhDwIemmIQEr19HuL+SR8e46lWnuO2JTTvQhsVGrNkjq1rTlBhv1izXw==
X-Received: by 2002:a2e:b611:: with SMTP id r17mr6172730ljn.62.1586375502082;
        Wed, 08 Apr 2020 12:51:42 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:40 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 02/36] dt-bindings: display: look for dsi* nodes in dsi-controller
Date:   Wed,  8 Apr 2020 21:50:35 +0200
Message-Id: <20200408195109.32692-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rob wrote:

    Uhhh, it's looking for dsi-controller(@.*)? which is not the common
    case found in dts files. We should fix that to dsi(@.*)?.

See: https://lore.kernel.org/dri-devel/20200319032222.GK29911@bogus/

Fix it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/dsi-controller.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
index fd986c36c737..85b71b1fd28a 100644
--- a/Documentation/devicetree/bindings/display/dsi-controller.yaml
+++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
@@ -28,7 +28,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^dsi-controller(@.*)?$"
+    pattern: "^dsi(@.*)?$"
 
   "#address-cells":
     const: 1
@@ -76,7 +76,7 @@ patternProperties:
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    dsi-controller@a0351000 {
+    dsi@a0351000 {
         reg = <0xa0351000 0x1000>;
         #address-cells = <1>;
         #size-cells = <0>;
-- 
2.20.1

