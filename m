Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9398C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 09:47:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3A7820739
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 09:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgFQJrK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 05:47:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgFQJrJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 05:47:09 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id B830B2A3882
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, robh+dt@kernel.org, airlied@linux.ie
Subject: [PATCH v4 4/4] drm/bridge: tfp410: Fix setup and hold time calculation
Date:   Wed, 17 Jun 2020 11:46:33 +0200
Message-Id: <20200617094633.19663-5-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200617094633.19663-1-ricardo.canuelo@collabora.com>
References: <20200617094633.19663-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This fixes a bug in the calculation of the setup and hold times based on
the deskew configuration.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index dfde811f3411..21d99b4ea0c9 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -278,8 +278,8 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 	if (deskew > 7)
 		return -EINVAL;
 
-	timings->setup_time_ps = min(0, 1200 - 350 * ((s32)deskew - 4));
-	timings->hold_time_ps = min(0, 1300 + 350 * ((s32)deskew - 4));
+	timings->setup_time_ps = 1200 - 350 * ((s32)deskew - 4);
+	timings->hold_time_ps = max(0, 1300 + 350 * ((s32)deskew - 4));
 
 	return 0;
 }
-- 
2.18.0

