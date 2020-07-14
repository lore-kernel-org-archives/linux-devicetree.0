Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8DCC433E8
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 07:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 075112223C
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594710803;
	bh=YiVWckYXZobeNaSRkUj8azBJxqyMKc8YEr8QUsXFDdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=p6/Auwsw8sh52VPIbgPQC7lBg9eqZqLOHdqoT7ZfCl0jr8QDKCE0JDk0uEN4biuUO
	 7fKHsb53TfvOTKFHjjpWMpwwp0cwXuKjhiDEe5c73tb8Bv9IiFSbpgLWgKZKw//9lW
	 p1Vw+rwqyH4rhFnP70BCFmRFpKqW4oxqqcxAsKVQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgGNHNV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 03:13:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:55880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbgGNHNU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Jul 2020 03:13:20 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A236422227;
        Tue, 14 Jul 2020 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594710799;
        bh=YiVWckYXZobeNaSRkUj8azBJxqyMKc8YEr8QUsXFDdg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pPUI4kqRSARdAvLmGOuFhpE0+TwvUrgdGV5zoluw7dB4jMnbpdwOyWHl6ni2MDtIU
         zibtyLk+sEY8qdNgniqRgz0jDnhq1F8gEZ5FU8cZ/255xX8zfgMyAeAwl2Mpfp/py3
         mIgoeOwFEXDJijHL+pJwF8QkP8OK82SFgkfFbUMc=
Received: by wens.tw (Postfix, from userid 1000)
        id F23B05FCE5; Tue, 14 Jul 2020 15:13:13 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Siarhei Siamashka <siarhei.siamashka@gmail.com>
Subject: [PATCH 2/5] drm/panel: simple: Set bpc from bits-per-color DT property for panel-dpi
Date:   Tue, 14 Jul 2020 15:13:02 +0800
Message-Id: <20200714071305.18492-3-wens@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714071305.18492-1-wens@kernel.org>
References: <20200714071305.18492-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Now that the device tree binding for panel-dpi has the "bits-per-color"
property, parse its value and set bpc in the panel description to the
given value. This would allow encoders to detect less-than-8-bits color
depth and employ color dithering if possible.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 13a9df44f781..0765bfa54b7a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -433,6 +433,7 @@ static int panel_dpi_probe(struct device *dev,
 
 	of_property_read_u32(np, "width-mm", &desc->size.width);
 	of_property_read_u32(np, "height-mm", &desc->size.height);
+	of_property_read_u32(np, "bits-per-color", &desc->bpc);
 
 	/* Extract bus_flags from display_timing */
 	bus_flags = 0;
-- 
2.27.0

