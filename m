Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88542C54E4A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 21:35:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44B4520CC7
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 21:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JEPOGcmw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgEGVfb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 17:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbgEGVfa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 17:35:30 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF54DC05BD0B
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 14:35:29 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id l25so3389336pgc.5
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 14:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XfNEDCRiXjCC8oOylpb9JNhfA9+c9hrQufk7O01EutI=;
        b=JEPOGcmwFBfW5QCKms1+maouE+hSH796fyxNeSs6NafNDFXUhutuNYMqtyu+Cz4ftE
         smDDleCiYarIBTBNcvs9qhyaX4KxL7re6xdgs706c6CBvnOPokM8Q5Hjxqfd+u70iMzN
         L4Nfj73BfoYxzl3kVdWZnth1x62n3HdcVf5uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XfNEDCRiXjCC8oOylpb9JNhfA9+c9hrQufk7O01EutI=;
        b=cJgUKsc5mj3h2XpGFRMyAyUOY666jS+obdAcna1kt5SEAHCQYFC1wiV43E4lfI5/zn
         04o7P3oH7vgTHy+Xfn7CODKSWVSllcFZvYMdA8XohqbxSXBDzG7OOPrwKWndgQ9igJVM
         d9MddOtYsF9A0B2GJYswxyY3A1nNABMWcRX10sytPsdTvWB4hlbqSgL8PEcWvdOQ28iW
         58B6R5M4Qe1+eyRkM59pAIl8yGIoQe3wCH+UYY0hcm5BVtaP72JT1Do10GBxrTV2KjL0
         4qq/fOoYIoY9Rfg0QtP+OqImACjLA/ZTbR2x6uYmAiG50eRTmNjhbQKjVVya6Nu0PtWM
         16hw==
X-Gm-Message-State: AGi0PuZGD6O1yHw0DiTcXEK60lkW61J5VAMDcW2l4IIL1VvpdwsS781w
        cgSKBEFn7EZJm4Mqzr4l8p9W5A==
X-Google-Smtp-Source: APiQypIN4LGb4WwjVAsqDkdk6/Lm8XZyQnvUfoNsrt2XHG4HD0F4xJ4m0Ae8nle3ctmT2+GxbHwNUA==
X-Received: by 2002:a63:741e:: with SMTP id p30mr13075429pgc.433.1588887329409;
        Thu, 07 May 2020 14:35:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i10sm5884860pfa.166.2020.05.07.14.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 14:35:28 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, jernej.skrabec@siol.net,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] dt-bindings: display: Add hpd-gpios to panel-common bindings
Date:   Thu,  7 May 2020 14:34:56 -0700
Message-Id: <20200507143354.v5.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507213500.241695-1-dianders@chromium.org>
References: <20200507213500.241695-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In the cases where there is no connector in a system there's no great
place to put "hpd-gpios".  As per discussion [1] the best place to put
it is in the panel.  Add this to the device tree bindings.

[1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2

 .../devicetree/bindings/display/panel/panel-common.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index ed051ba12084..e9a04a3a4f5f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -96,6 +96,12 @@ properties:
       (hot plug detect) signal, but the signal isn't hooked up so we should
       hardcode the max delay from the panel spec when powering up the panel.
 
+  hpd-gpios:
+    maxItems: 1
+    description:
+      If Hot Plug Detect (HPD) is connected to a GPIO in the system rather
+      than a dedicated HPD pin the pin can be specified here.
+
   # Control I/Os
 
   # Many display panels can be controlled through pins driven by GPIOs. The nature
-- 
2.26.2.645.ge9eca65c58-goog

