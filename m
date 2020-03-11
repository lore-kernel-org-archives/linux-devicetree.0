Return-Path: <devicetree-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 24B367D910
	for <lwn-devicetree@archive.lwn.net>; Wed, 11 Mar 2020 16:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730176AbgCKQef (ORCPT <rfc822;lwn-devicetree@archive.lwn.net>);
        Wed, 11 Mar 2020 12:34:35 -0400
Received: from hermes.aosc.io ([199.195.250.187]:58112 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730180AbgCKQef (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 12:34:35 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 2554C4C335;
        Wed, 11 Mar 2020 16:34:29 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 4/5] drm/sun4i: sun6i_mipi_dsi: fix horizontal timing calculation
Date:   Thu, 12 Mar 2020 00:33:28 +0800
Message-Id: <20200311163329.221840-5-icenowy@aosc.io>
In-Reply-To: <20200311163329.221840-1-icenowy@aosc.io>
References: <20200311163329.221840-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
        t=1583944474;
        h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
        bh=U2GxqfdymldYXpFrmpoV6T/L6VN/aPLvUF+27UYMKNM=;
        b=tIV6lwpp+xUu1yh4SMhtRjYtnNU8O1efXGjwMBU6+K4WLy9VFlS6syxUXosBQHHhVI5sXQ
        wqqe/lJ0Z0jZtgQMh+g7fgIPlImrhm2xCibz4wNeaYLAvpCZYuL5mQc6UnYyZk+jw7Rzhd
        dd7JFj4hPaMvnnyRnz+4/VYq9QYocXw=
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Archived-At: <http://archive.lwn.net:8080/devicetree/20200311163329.221840-5-icenowy@aosc.io/>
List-Archive: <http://archive.lwn.net:8080/devicetree/>
List-Post: <mailto:devicetree@vger.kernel.org>

The max() function call in horizontal timing calculation shouldn't pad a
length already subtracted with overhead to overhead, instead it should
only prevent the set timing to underflow.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 059939789730..5f2313c40328 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -555,7 +555,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 		 */
 #define HSA_PACKET_OVERHEAD	10
 		hsa = max((unsigned int)HSA_PACKET_OVERHEAD,
-			  (mode->hsync_end - mode->hsync_start) * Bpp - HSA_PACKET_OVERHEAD);
+			  (mode->hsync_end - mode->hsync_start) * Bpp) - HSA_PACKET_OVERHEAD;
 
 		/*
 		 * The backporch is set using a blanking packet (4
@@ -564,7 +564,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 		 */
 #define HBP_PACKET_OVERHEAD	6
 		hbp = max((unsigned int)HBP_PACKET_OVERHEAD,
-			  (mode->htotal - mode->hsync_end) * Bpp - HBP_PACKET_OVERHEAD);
+			  (mode->htotal - mode->hsync_end) * Bpp) - HBP_PACKET_OVERHEAD;
 
 		/*
 		 * The frontporch is set using a sync event (4 bytes)
@@ -574,7 +574,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 		 */
 #define HFP_PACKET_OVERHEAD	16
 		hfp = max((unsigned int)HFP_PACKET_OVERHEAD,
-			  (mode->hsync_start - mode->hdisplay) * Bpp - HFP_PACKET_OVERHEAD);
+			  (mode->hsync_start - mode->hdisplay) * Bpp) - HFP_PACKET_OVERHEAD;
 
 		/*
 		 * The blanking is set using a sync event (4 bytes)
@@ -583,8 +583,8 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 		 */
 #define HBLK_PACKET_OVERHEAD	10
 		hblk = max((unsigned int)HBLK_PACKET_OVERHEAD,
-			   (mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp -
-			   HBLK_PACKET_OVERHEAD);
+			   (mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp) -
+			   HBLK_PACKET_OVERHEAD;
 
 		/*
 		 * And I'm not entirely sure what vblk is about. The driver in
-- 
2.24.1

