Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87227C433E5
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 662BE207D0
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmLMBRLP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgFAIdW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 04:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727957AbgFAIdV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 04:33:21 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309F7C08C5C0
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 01:33:18 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z13so7066699ljn.7
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/kLQcKKjC8Y9Z0GEOnV9EPdgB2M7ivV6RG54qq29vMQ=;
        b=DmLMBRLPEz91iPHytYStoDFHmdTez2DBjv6owsNsvgAVHR8MicRpy6m0/h4vxVThvM
         BZf9sy3R4fs31LFZuWX2ffmkXuaX0auYuWXbpCBdg8gJHoUKIPEE5ADgHd0mgmGXq61l
         OMjD2O9Hu4jv1nXyB2ldiIyzNUNZpqGAEihFlBaiH7/P6zE/QSoeLqzs4F7XJzJXyOPw
         /Udh0rbVRyOjo6ZAy//BJ9Fyopjv0Mng/wtHsmnf8pkoRp+I3MlhSEyEN2+PAWr1I/E/
         ktVMCEDE4q+hnmE5zwVmJRJBdRgLx047X03Gt5Dl74tbB//CsDVr9nXPHCOjO2Pa0CC/
         n1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=/kLQcKKjC8Y9Z0GEOnV9EPdgB2M7ivV6RG54qq29vMQ=;
        b=oe2g82j7VERljERFaBv8o7hsYhQjZCt0tnoJvQ6s45f7qjbWnOg87CvFzAYGevfDmG
         D5Tg/EYxZANK/Iw167ErXociAttHCB+xUDvqWxckxZStBU0kkZKFepXdJHxJbuA5xzgw
         qBq4H/PF1VbqvJ16TC+0e0UpysvJbcLAPeiIEvA0w85V/TekoVNZH4lVvGZQ535sLsKs
         cVboDzPuWKduFMuPRhnaH9U742Z/PJNVP6hfrPmKS/cg8aYHsHTPsR9SxOd2qSikiEk2
         +xAIjL9qJHQwWFcNCm+i012+Bp7IJj77AaisglcqDBquhW2VFIIJD7HFzeiFNEtqKRM6
         +Lyw==
X-Gm-Message-State: AOAM530guQgPwnk77bWyP6XHBTc1ASENKLMWHPBRdi820d5NaH0lpYAV
        DyYhmlFTr0opZPwpsqpEhMA=
X-Google-Smtp-Source: ABdhPJyJi+HROJJQQrz0+okTxyGvznRAyt8fJgTSPYmXkqYKGtpWoRY8SrNpBruLwP4jEgvZmkMq6w==
X-Received: by 2002:a2e:7d17:: with SMTP id y23mr10003521ljc.105.1591000396671;
        Mon, 01 Jun 2020 01:33:16 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
        by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 01:33:16 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v1 2/6] drm: panel-simple: add Seiko 70WVW2T 7" simple panel
Date:   Mon,  1 Jun 2020 10:33:05 +0200
Message-Id: <20200601083309.712606-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601083309.712606-1-sam@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Seiko 70WVW2T is a discontinued product, but may be used somewhere.
Tested on a proprietary product.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Søren Andersen <san@skov.dk>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b067f66cea0e..8624bb80108c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3194,6 +3194,31 @@ static const struct panel_desc shelly_sca07010_bfn_lnn = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct drm_display_mode sii_70wvw2t_mode = {
+	.clock = 33000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 256,
+	.hsync_end = 800 + 256 + 0,
+	.htotal = 800 + 256 + 0 + 0,
+	.vdisplay = 480,
+	.vsync_start = 480 + 0,
+	.vsync_end = 480 + 0 + 0,
+	.vtotal = 480 + 0 + 0 + 45,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc sii_70wvw2t = {
+	.modes = &sii_70wvw2t_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode starry_kr070pe2t_mode = {
 	.clock = 33000,
 	.hdisplay = 800,
@@ -3877,6 +3902,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "shelly,sca07010-bfn-lnn",
 		.data = &shelly_sca07010_bfn_lnn,
+	}, {
+		.compatible = "sii,70wvw2t",
+		.data = &sii_70wvw2t,
 	}, {
 		.compatible = "starry,kr070pe2t",
 		.data = &starry_kr070pe2t,
-- 
2.25.1

