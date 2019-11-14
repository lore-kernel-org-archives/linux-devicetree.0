Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9379DC43141
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 09:40:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7059420718
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 09:40:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZJGUOmsr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfKNJkM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 04:40:12 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36038 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfKNJkL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 04:40:11 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE9e6Vt025264;
        Thu, 14 Nov 2019 03:40:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573724406;
        bh=6LTnMb6e3K2BsU0Oe3+xvKa3TV0PwdvlajoGCs2MpqU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZJGUOmsrFH7KP0vRFaPawIbdpwPkW30RqaiaDif9zf6xu5FvgCZt6uY04+pmiofzv
         /9jnD1wXaQUapSMwz9L5bOysSGmP7NCoxcOtq+ObL3Fdr8GhPVsADjUpSHOHEBcfsy
         n7+Ah5/MkrxeA3U3FmLKEt/ApbcFjRja683S1mgQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE9e6Ns123500;
        Thu, 14 Nov 2019 03:40:06 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 03:40:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 03:40:04 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE9dtjq085959;
        Thu, 14 Nov 2019 03:40:02 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 3/3] drm/panel: simple: fix osd070t1718_19ts sync drive edge
Date:   Thu, 14 Nov 2019 11:39:50 +0200
Message-ID: <20191114093950.4101-4-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114093950.4101-1-tomi.valkeinen@ti.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The panel datasheet says that the panel samples at falling edge, but
does not say anything about h/v sync signals. Testing shows that if the
sync signals are driven on falling edge, the picture on the panel will
be slightly shifted right.

Setting sync drive edge to the same as data drive edge fixes this issue.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5d487686d25c..0784536ae6af 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2397,7 +2397,8 @@ static const struct panel_desc osddisplays_osd070t1718_19ts = {
 		.height = 91,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
+		DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

