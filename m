Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1896FC00454
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 23:10:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8003214AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 23:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oKrnK8js"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfLKXKh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 18:10:37 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36164 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfLKXKh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 18:10:37 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so179124wma.1
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 15:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Q8etfoWT2jfX9dgh2kmChcjY+MdQxMMNc40Nuy8WnTw=;
        b=oKrnK8jsvjw9hggytMGAMmAm5cCCGkE3Zx41qkQAyVEOEBmkO4NIzFJkr4cOvuPzfu
         I/cZeCo4WrjXbN0laLHRrHQ+DhAh16/pZKIQlwtZ3L9rrCYGj02qr/MOiWXzee2OfL5N
         h0XoemUMWYERuAXDmCWzRrx5WDa6pUxQearo4lIm5ZvfWQOfvqhagGVxMHpVWXaFtdoF
         9olObx/q502WqaG7k3Vd5rjf+SlU64zeiYowU82PZKXp0w4wxyjCxRsM7TwtPMoPBxEn
         Xs5+x1kiorkavfTX8aeVe6GgWI5ebN35iUiQV7nEzjpMmA/Y5GExqgymcjiGeRz64AkC
         aMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q8etfoWT2jfX9dgh2kmChcjY+MdQxMMNc40Nuy8WnTw=;
        b=rXMl0pxB8aRF+6ThkU5Om9K0sUp7P1F7fg9ZJd6BWPmSpD4fIF4D2BBd1s+4uo5DzE
         gY8DVq/QQ2ZxPPuvbmPCAZeC2LZSotAq5pgcYUBDoC3kaHzigLTtJUhaTBWvxxUIDHCu
         QdyxAQu+F8FG/cfoRcdJS+SGq0Ae5iiy8KwIplpb3chcG6hX2OjHajaytXux9z9RTFb1
         j85XU9ErwR+0sd6bhukG31cJduucAe3pm2BFyqtvrU40gKrhanHoMlt5X3ByGttA/NAH
         DifAocTrdPLz8Ix19WGn3E5aoc/KOlkCY9gfiwM/t0MR3u1DHOdkUMCxNepEEPSVU89l
         Gi6A==
X-Gm-Message-State: APjAAAU1z4ob8yJtYZdRpvncLPQrFKKGHaQS15aszy5+AslxBlERD4D1
        /s6kDB83X23DmVUllTGBkh7QYg==
X-Google-Smtp-Source: APXvYqyXa84y4FCNbZFfCVpDWSt4YUn3KRWuC/KoOT8Ly1Pui9wTvG+4l53/UD7U6GQg1XXcqyhmQQ==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr2676045wmj.169.1576105835264;
        Wed, 11 Dec 2019 15:10:35 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:140f:3f8d:647c:49b0])
        by smtp.gmail.com with ESMTPSA id d67sm3931285wmd.13.2019.12.11.15.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 15:10:34 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        robh+dt@kernel.org, liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org
Subject: [PATCH v6 15/15] Update MAINTAINERS to add reviewer for CoreSight.
Date:   Wed, 11 Dec 2019 23:10:31 +0000
Message-Id: <20191211231031.5688-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Added myself as a designated reviewer for the CoreSight infrastructure
at the request of Mathieu Poirier.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77f5d28fa84b..3051a3765955 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1642,6 +1642,7 @@ F:	arch/arm/mach-ep93xx/micro9.c
 ARM/CORESIGHT FRAMEWORK AND DRIVERS
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
+R:	Mike Leach <mike.leach@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
-- 
2.17.1

