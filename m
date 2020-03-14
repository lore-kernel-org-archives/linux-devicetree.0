Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5F6C0044D
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 02:22:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F39C02071C
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 02:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeZgAO11"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgCOCWC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 14 Mar 2020 22:22:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35734 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgCOCWC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 14 Mar 2020 22:22:02 -0400
Received: by mail-lf1-f67.google.com with SMTP id 5so3964224lfr.2
        for <devicetree@vger.kernel.org>; Sat, 14 Mar 2020 19:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4J2rgtw2eg/k9wTAwL2QWWPRrjouBROxRXix47qXXA=;
        b=eeZgAO11rjVHokvwfCwtvNYv1RnJFDSvsZAI8b10ImlXxVkVm3jvuEKwTasfF+VfrJ
         jU8/y/JQD20cGXpk+pKPplmXiRYW44YNPwQPGQsKhnVPknMPzsLtitvFooALy9SZj37u
         WjipD5nFDcXtUwKPsCiVQNVijmuDtQ0a92gmdW9kSc9f0FYnVsBAG0A2edWw70WjVxyN
         9pVx6hPNAcsJCFEaE7qnuM0TUoL0rdaqWrBkLYGBI+EXgwaCP7D++7Mm81U+Wn3l2/Wy
         0i4DJnpYdpWV/t8QCh4jkOtfO6JzpnktmspxnuHujd951KVtCUG2d7Ix2M4SHHC5X6XS
         UVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=s4J2rgtw2eg/k9wTAwL2QWWPRrjouBROxRXix47qXXA=;
        b=KZQgArnfLMww+id+tR04sVie0bFanmPdil1WRW9gQYYk3UhzI6S/6fhQvP0jMTp40s
         hKjkxXdQp6HQzGSkv0H84HBYMeZ9eMZropQ3Cgs9CrGoqR3IIHhiHH9tEX9pOTL9szT2
         OGLXws2oJbUG8YO5tty+5/gh3XO68U8YpYfdE2KPUoEv4ms4Sldt9cX6v6tCWT5DDY7j
         2B+RdaAZmTiRpUhjAW1xBzKxy7L29fVg+KXKV2CZhrsFWCRsfdYuCPRN8C4YlqheK50k
         y4IxKHNDzDqmFSJ7IFkOol+GPXFwTiTNx95qrcMV23BE3Qps8WhYELAuZm6p/3PfiTXp
         s80Q==
X-Gm-Message-State: ANhLgQ0OnZ7IEpJl/NO9toOAsKqtlV1zO2hYrdHmlq4fAPAc1n9ouGVT
        /29f9DRW4Sjmb+tWVbC9khc8GJ8G
X-Google-Smtp-Source: ADFU+vtrVcONFH7pz/7NWnIu9V/AlfW3A2RKEfrD4+SRdas3uaHOlK6KWEbm4MJiqWyDE6iRUsRPKg==
X-Received: by 2002:a2e:2e11:: with SMTP id u17mr11366418lju.90.1584199858438;
        Sat, 14 Mar 2020 08:30:58 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id n200sm15650418lfa.50.2020.03.14.08.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2020 08:30:58 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 2/3] drm/panel-simple: drop use of data-mapping property
Date:   Sat, 14 Mar 2020 16:30:46 +0100
Message-Id: <20200314153047.2486-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200314153047.2486-1-sam@ravnborg.org>
References: <20200314153047.2486-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The "data-mapping" property may not be the best way to describe the
interface between panels and display interfaces.
Drop use of in the panel-simple driver, so we have time to find
the right way to describe this interface.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0ce81b1f36af..3ad828eaefe1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -361,7 +361,6 @@ static int panel_dpi_probe(struct device *dev,
 	struct panel_desc *desc;
 	unsigned int bus_flags;
 	struct videomode vm;
-	const char *mapping;
 	int ret;
 
 	np = dev->of_node;
@@ -386,16 +385,6 @@ static int panel_dpi_probe(struct device *dev,
 	of_property_read_u32(np, "width-mm", &desc->size.width);
 	of_property_read_u32(np, "height-mm", &desc->size.height);
 
-	of_property_read_string(np, "data-mapping", &mapping);
-	if (!strcmp(mapping, "rgb24"))
-		desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-	else if (!strcmp(mapping, "rgb565"))
-		desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
-	else if (!strcmp(mapping, "bgr666"))
-		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
-	else if (!strcmp(mapping, "lvds666"))
-		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
-
 	/* Extract bus_flags from display_timing */
 	bus_flags = 0;
 	vm.flags = timing->flags;
-- 
2.20.1

