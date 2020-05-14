Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5F1C433E2
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 14:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C03E205CB
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 14:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgENOgh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 10:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgENOgh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 10:36:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2700C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 07:36:37 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id DE0952A2EE9
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, robh+dt@kernel.org, airlied@linux.ie,
        shawnguo@kernel.org
Subject: [PATCH v2 4/4] drm/bridge: tfp410: Fix setup and hold time calculation
Date:   Thu, 14 May 2020 16:36:12 +0200
Message-Id: <20200514143612.2094-5-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The tfp410 has a data de-skew feature that allows the user to compensate
the skew between IDCK and the pixel data and control signals.

In the driver, the setup and hold times are calculated from the de-skew
value. This retrieves the deskew value from the DT using the proper
datatype and range check as described by the binding (u32 from 0 to 7)
and fixes the calculation of the setup and hold times.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index e3eb6364c0f7..21d99b4ea0c9 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -220,7 +220,7 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 	struct device_node *ep;
 	u32 pclk_sample = 0;
 	u32 bus_width = 24;
-	s32 deskew = 0;
+	u32 deskew = 0;
 
 	/* Start with defaults. */
 	*timings = tfp410_default_timings;
@@ -274,12 +274,12 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 	}
 
 	/* Get the setup and hold time from vendor-specific properties. */
-	of_property_read_u32(dvi->dev->of_node, "ti,deskew", (u32 *)&deskew);
-	if (deskew < -4 || deskew > 3)
+	of_property_read_u32(dvi->dev->of_node, "ti,deskew", &deskew);
+	if (deskew > 7)
 		return -EINVAL;
 
-	timings->setup_time_ps = min(0, 1200 - 350 * deskew);
-	timings->hold_time_ps = min(0, 1300 + 350 * deskew);
+	timings->setup_time_ps = 1200 - 350 * ((s32)deskew - 4);
+	timings->hold_time_ps = max(0, 1300 + 350 * ((s32)deskew - 4));
 
 	return 0;
 }
-- 
2.18.0

