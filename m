Return-Path: <SRS0=NbWy=4X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE6AC3F2DB
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 04:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92A6822B48
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 04:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k1zGsGNc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgCFEOH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 23:14:07 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38800 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbgCFEOH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 23:14:07 -0500
Received: by mail-pg1-f194.google.com with SMTP id x7so462754pgh.5
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 20:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mZHNTw4SE3kOWwVknWFPKUrQ1ZVeKTfbVBIEBgdbJEY=;
        b=k1zGsGNc2op5navHqJUmfJnlqXF2SIMxGwKXMlUCnXt9rkmSdDX6Pvp4QwBWTph7zW
         UmZDgjq/YJN+aB8K4Nr8Yjp6Ctzbra3GsGawt8s/1cy9kNUlxDtcdmKYSdzYOc2ozAwR
         z7EIT/2t6q/nL/wYBvnleCud6PBMt4qDR3dk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZHNTw4SE3kOWwVknWFPKUrQ1ZVeKTfbVBIEBgdbJEY=;
        b=VNrMzCi/muWBskbjMm782Poi5pkK5UrFRDZ6jVfShPgXRY2eb3A/Z7ATLJYPurj/be
         vF9EyMc4R8/3gis86REBoA7bYSgS/aTqaa/bDyO49TblK1jEMMKW575V5sMNaNPPw7y+
         rYvuCxUZsXzmaDzVTcmaeWpGuZxVZxUjTngwcgz4+Pl7oscLOthMesysfAuqEKH7fHWT
         h8AEGrK6a4i1SHt2BBgSGl+qR7WVhAZlkHaUTww6cwIB2RCQpPAkrjFnHoCEsA1BYV9b
         qk7GH5PAY8tIpb0UIOR4B3gwR16BDvPO8hVDXAj23dE6DNUe2OsCRx7YMw04rfnV10ZG
         bkoQ==
X-Gm-Message-State: ANhLgQ3ZMW5D/AZsPPV/bCIio2f0T7kqUlwveYTddTm5TfDVxoHzLupF
        PeXFvmJhgtAqOuTcNW3u89aKHA==
X-Google-Smtp-Source: ADFU+vs/j6aQZZ/8TpvTzBDFwv9bk8b1y/hiw7ywm2BIyvth3q+IirQdvmZj5kxzLWmMLEiAVTW8yw==
X-Received: by 2002:a63:3142:: with SMTP id x63mr1455866pgx.138.1583468045232;
        Thu, 05 Mar 2020 20:14:05 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id q97sm6295025pja.9.2020.03.05.20.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 20:14:04 -0800 (PST)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Nick Fan <nick.fan@mediatek.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org
Subject: [PATCH v5 3/4] RFC: drm/panfrost: Add mt8183-mali compatible string
Date:   Fri,  6 Mar 2020 12:13:44 +0800
Message-Id: <20200306041345.259332-4-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306041345.259332-1-drinkcat@chromium.org>
References: <20200306041345.259332-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

For testing only, the driver doesn't really work yet, AFAICT.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

v5:
 - Change power domain name from 2d to core2.
v4:
 - Add power domain names.
v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a6e162236d67fdf..ff76b29b373e105 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -667,6 +667,15 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
+static const struct panfrost_compatible mediatek_mt8183_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.supply_names = mediatek_mt8183_supplies,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+};
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
@@ -677,6 +686,8 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t830", .data = &default_data, },
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
+	{ .compatible = "mediatek,mt8183-mali",
+		.data = &mediatek_mt8183_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.25.1.481.gfbce0eb801-goog

