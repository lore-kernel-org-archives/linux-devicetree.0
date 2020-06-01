Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BD5C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8CB52074B
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuZo+MfX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgFAIdX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 04:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgFAIdW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 04:33:22 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B52BC061A0E
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 01:33:22 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b6so7106097ljj.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 01:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+oFQSuYqfFPB7zIFX+5U9cF5ft8QrZdDEwK+mQD33PY=;
        b=DuZo+MfXyHC9GlzR/2yFM+WN4fjb/p/JJgHRkGSxIXF2//7KcZ0KxMGSCBpQSdmouq
         wt/sLOvdPpfjh/O7oqRNkABPei59VkkP819v0HYI4XfXZBF2ZaYOpSukqH+N/iu3Zkl4
         HLzygHv2ySEJLU6DEYh7bqKbMnWr7Y9+JsOC/tJDuVvTJHZH26X97Aa7aXIyBSap/xa4
         orXT5/AJZ+kIapVS5cZTLONUb7LOo49ykVsbOvsm2LvkVTfvxV1hG5y4bWUd2caO0v8s
         TYCucqG2cq1Pu/3xP1STUqNP8PkVv9oA35E+iN19WG6i1w+FOwRpqmGJVRR4Irm7xSn4
         Bnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=+oFQSuYqfFPB7zIFX+5U9cF5ft8QrZdDEwK+mQD33PY=;
        b=sdtx4l+8wMsWo3yEqVV9XW21J2vIzauG7fsODFQIYgLSzJYkX1DNodCIOEI0rMnrwO
         ZbvOkmVf2LSxkU+Wzw2KQrL5vUufEAUuAAfOIXRGdhvHIUoqSeITp0kYgCpAcYfl5Bh/
         13AQkG2wtZuCRJq22bRkCoSRyyKI2iu0+0VBVMlstTOlTRuOvcIlM6abbOXiObdBy2G3
         86NRtvGMuJBVssIch03FxH7Rx2ENPDFWXmCDndKi1j6JXoeIWyFk/H1UoQVS1x79Akw2
         IB29h0FuKSKW40UhVPqPj7dQJqb9hV+43xau1rAKAknRu3Z/+ojlNT3VEQeKIhqkL5o+
         MsYA==
X-Gm-Message-State: AOAM531EBvOdo89E+s5keiZHOdQIWle2HJSg8QwH1fl5xRUAljXvRY+p
        JYkAyD+BI11rcTbfxtTOz28=
X-Google-Smtp-Source: ABdhPJySVAKpBlLW/smaV5zLyUIVQ4gmwmnleI9Ks/S59fIsYMXrMMpJcniENECe+9KE/vbPdiu6XQ==
X-Received: by 2002:a2e:81d1:: with SMTP id s17mr10542649ljg.91.1591000400787;
        Mon, 01 Jun 2020 01:33:20 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
        by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 01:33:20 -0700 (PDT)
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
Subject: [PATCH v1 6/6] drm: panel-simple: add LOGIC Technologies panels
Date:   Mon,  1 Jun 2020 10:33:09 +0200
Message-Id: <20200601083309.712606-7-sam@ravnborg.org>
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

Add support for the following panels from LOGIC Technologies, Inc:
- LTTD800480070-L2RT
- LTTD800480070-L6WH-RT

The LTTD800480 L2RT is discontinued, but it may be used
by existing products.

Signed-off-by: Søren Andersen <san@skov.dk>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Søren Andersen <san@skov.dk>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 70 ++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 25c96639631f..70d54164b1ae 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2428,6 +2428,70 @@ static const struct panel_desc logictechno_lt170410_2whc = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode logictechno_lttd800480070_l2rt_mode = {
+	.clock = 33000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 112,
+	.hsync_end = 800 + 112 + 3,
+	.htotal = 800 + 112 + 3 + 85,
+	.vdisplay = 480,
+	.vsync_start = 480 + 38,
+	.vsync_end = 480 + 38 + 3,
+	.vtotal = 480 + 38 + 3 + 29,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc logictechno_lttd800480070_l2rt = {
+	.modes = &logictechno_lttd800480070_l2rt_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.delay = {
+		.prepare = 45,
+		.enable = 100,
+		.disable = 100,
+		.unprepare = 45
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
+static const struct drm_display_mode logictechno_lttd800480070_l6wh_rt_mode = {
+	.clock = 33000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 154,
+	.hsync_end = 800 + 154 + 3,
+	.htotal = 800 + 154 + 3 + 43,
+	.vdisplay = 480,
+	.vsync_start = 480 + 47,
+	.vsync_end = 480 + 47 + 3,
+	.vtotal = 480 + 47 + 3 + 20,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc logictechno_lttd800480070_l6wh_rt = {
+	.modes = &logictechno_lttd800480070_l6wh_rt_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.delay = {
+		.prepare = 45,
+		.enable = 100,
+		.disable = 100,
+		.unprepare = 45
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
 	.clock = 30400,
 	.hdisplay = 800,
@@ -3841,6 +3905,12 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "logictechno,lt170410-2whc",
 		.data = &logictechno_lt170410_2whc,
+	}, {
+		.compatible = "logictechno,lttd800480070-l2rt",
+		.data = &logictechno_lttd800480070_l2rt,
+	}, {
+		.compatible = "logictechno,lttd800480070-l6wh-rt",
+		.data = &logictechno_lttd800480070_l6wh_rt,
 	}, {
 		.compatible = "mitsubishi,aa070mc01-ca1",
 		.data = &mitsubishi_aa070mc01,
-- 
2.25.1

