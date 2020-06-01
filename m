Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEB3C433E3
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE8552074B
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWvgi00R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgFAIdW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 04:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgFAIdU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 04:33:20 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE3CC08C5CA
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 01:33:20 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w15so3415162lfe.11
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TwIdJUbQRxeqgtfvfIoF0Z04UMl01JB2vKoyScmExkg=;
        b=cWvgi00RcFiHrv8DMigp7mhttjy/GxX1b+1+aUakQwMf0Gj0QkzZHpTXM6xL7Ya/NO
         p1Lk8Jn+tayq731Hx/VVy48CozlRtRpPToJHNmmxY6yD5QxaNR62nrubajaORG7a9bK/
         TtpCQUJhiAFbmC97Pc/q1yVyCf4FOioozKy8hoCrLURJ2/qz2OfWtufoZ0tEPNGEQI0p
         ayV6wHLzNY3QLtBHC4b5vxlpX9IvEwu/a9fMDsgCAuJ3vI58HJ2AQo5iPwddcOW88QRh
         ln9Na41BlaQJegNLkKXLJwK0gN4CoC0eWPP1fBptj4w1tmuBDN3102mDyos7OMtZm//r
         Elfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=TwIdJUbQRxeqgtfvfIoF0Z04UMl01JB2vKoyScmExkg=;
        b=YkjKong9GuZPmhq7a1eL1qOXIPvdpoi1a04FGUC9o2h0eDPBaBw5FeHRa/6uwezXWO
         7H7/zz5sKu2RUW/AncXKhns2OsJiJNfcSvwqIkIdxg4JZb9lu17s5Dk5dbtjChcOSeb1
         XuitFSeWnqgu7oCk5jpw+s7EKT8q7v/zJnCxcdrXJQYYmRzWIhkAxKzKT4SQAK02GxVK
         oaE6bG3IYZeLbhbyIY557oNMACcEomqfZifpHAXYIbGekTCyDx24KJBeRMBOEs6gIBkU
         +3BYNY56ocS3fKCpMgL2gVo1vW4MbNRwWN/4VyR8SM1qutKi+mch0ZOfwkfdG+pWn7lT
         S4fg==
X-Gm-Message-State: AOAM530r4Mjm5OqTb2C2DQ0kK7i5ZhXilryhkQAbbUWBRmng3pyFSPZg
        0RH4FIEoLGQyUG6sEivrq0Q=
X-Google-Smtp-Source: ABdhPJw1TnIeYLkuBYxj66EjSh8MTVLLPvYHyksj6de8G3CqLKAXHsCGGH66LzgSdD1ort9SjcODWQ==
X-Received: by 2002:a05:6512:3214:: with SMTP id d20mr10856801lfe.203.1591000398752;
        Mon, 01 Jun 2020 01:33:18 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
        by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 01:33:18 -0700 (PDT)
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
Subject: [PATCH v1 4/6] drm: panel-simple: add Hitachi 3.5" QVGA panel
Date:   Mon,  1 Jun 2020 10:33:07 +0200
Message-Id: <20200601083309.712606-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601083309.712606-1-sam@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This panel is used on evaluation boards for Atmel at91sam9261 and
at91sam6263.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8624bb80108c..25c96639631f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1813,6 +1813,32 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode hitachi_tx09d71vm1cca_mode = {
+	.clock = 4965000,
+	.hdisplay = 240,
+	.hsync_start = 240 + 0,
+	.hsync_end = 240 + 0 + 5,
+	.htotal = 240 + 0 + 5 + 1,
+	.vdisplay = 320,
+	.vsync_start = 320 + 0,
+	.vsync_end = 320 + 0 + 1,
+	.vtotal = 320 + 0 + 1 + 1,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc hitachi_tx09d71vm1cca = {
+	.modes = &hitachi_tx09d71vm1cca_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 54,
+		.height = 72,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode hitachi_tx23d38vm0caa_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -3737,6 +3763,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "hannstar,hsd100pxn1",
 		.data = &hannstar_hsd100pxn1,
+	}, {
+		.compatible = "hit,tx09d71vm1cca",
+		.data = &hitachi_tx09d71vm1cca,
 	}, {
 		.compatible = "hit,tx23d38vm0caa",
 		.data = &hitachi_tx23d38vm0caa
-- 
2.25.1

