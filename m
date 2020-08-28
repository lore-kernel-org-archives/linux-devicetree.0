Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086B9C433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 15:49:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCCB820872
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 15:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObOhJQlc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgH1Pt3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 11:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728039AbgH1PtS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 11:49:18 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC4DC061264
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 08:49:18 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v12so1814440ljc.10
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RzO/u82bhYkbGzYXqTgJ4HBSdRoIsJl4r3uZiLJLve4=;
        b=ObOhJQlcC2wrUZvz/Sa5WdH6CBtF1FirWagTSTjFA478ShCAfENPUBhWqBwSJsc7ph
         IBfCh4/UZVho2Zy0Z3a1Ww1HT3KpaWJU3MEY4WqznZRbdzfWbICAeWy+KNWiHrRHPx1l
         YBjp6QEYudGlvTQA9AibpmhCWGp4MqDic+eza712jiI5N1uvoL7ailsyn3MzRDNP7M8i
         SqxIJmTrT2GFx/o612QaG180NBIlYD9O1g7C/5+1gOwkIFi12ZHsYnmPQRB3aMHbEYcf
         MoGwDAmqwtpRS0kMdgka8hW2RReAgMVkokjZH3spi6HxzxoQPdQHJd+Nqgeg7dvyQhQw
         TEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RzO/u82bhYkbGzYXqTgJ4HBSdRoIsJl4r3uZiLJLve4=;
        b=V1OMQmGdQ4upvLov1UHib7i5Q5o0iW4krmO6vkur2PIvqsX9AES+P0yr79eSUCl8PB
         h0pRuQiaRHymK0AZsgtXUJD06V+AJo1cnZ8+i75udkgBQ2pDqRcDDJfnWmxvdmENTML1
         kgZeNJz1JgnldoJVLgn8NE+EeTtr+KakTlcv+9mdScuzzxo44bIi8luK8kJWbFeNe+v4
         GPzGUlb+8v2S/IEXl4DFbiZ30Vx4Cfd3h2mu+dG9ZsHM0A4mpTwrpI/4j9pB3yJfhXWi
         MdjFjpjGMO0k1GgGBqAsT9nuSgxhgV/PsIir68tanqKKmfuU92S6as1xqPFoBME9jfNA
         JS/w==
X-Gm-Message-State: AOAM533jzdyzGACYXbUTvtqXcXivYcQ60It9zhEtpXIV+eObHrjAaKQ0
        K1NAG1E0pec5tY8rZQae5ymUcnlVDRGyCw==
X-Google-Smtp-Source: ABdhPJxzFZT3xAeu/O5lodHhBa/sAIGF7iAxnNo9eQnh4WtgUBokeiPOTTMFNBe7D17Jmxr/83YieA==
X-Received: by 2002:a2e:910d:: with SMTP id m13mr1266060ljg.240.1598629755378;
        Fri, 28 Aug 2020 08:49:15 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
        by smtp.gmail.com with ESMTPSA id r16sm270215ljd.71.2020.08.28.08.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 08:49:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/3] dt-bindings: display: bridge: Add documentation for LT9611UXC
Date:   Fri, 28 Aug 2020 18:49:04 +0300
Message-Id: <20200828154906.1662611-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
References: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Lontium LT9611UXC is a DSI to HDMI bridge which supports 2 DSI ports
and I2S port as input and one HDMI port as output. The LT9611UXC chip is
handled by a separate driver, but the bindings used are fully compatible
with the LT9611 chip, so let's reuse the lt9611.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/display/bridge/lontium,lt9611.yaml   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index d60208359234..7a1c89b995e2 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9611 2 Port MIPI to HDMI Bridge
+title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
 
 maintainers:
   - Vinod Koul <vkoul@kernel.org>
 
 description: |
-  The LT9611 is a bridge device which converts DSI to HDMI
+  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
 
 properties:
   compatible:
     enum:
       - lontium,lt9611
+      - lontium,lt9611uxc
 
   reg:
     maxItems: 1
-- 
2.28.0

