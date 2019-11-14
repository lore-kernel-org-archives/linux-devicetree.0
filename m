Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CD7C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 09:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4069520709
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 09:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZgDFJ/1F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKNJkJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 04:40:09 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44442 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfKNJkJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 04:40:09 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE9e3dj060084;
        Thu, 14 Nov 2019 03:40:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573724403;
        bh=J6WQnf08jE29+k+Z+wJAETstTtd+Nns4dCt3g2mlorQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZgDFJ/1FAIgtMzS2ZkkBB7p7Jgt3v9Zi7UxXT1n8awaNOoR4mVwQyGsGxu1A7NOPR
         T10TvQrJNXQiOtUuCRLCN78Drs/2GLyePdmlKZuau89wEN8ZNwTvRn0O/zy53RQ0mT
         FkFFuaH0WB1M4raYRUDgrFDxSqPMqW1XgUbCGl8I=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAE9e2XD035592
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 03:40:03 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 03:40:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 03:40:02 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE9dtjp085959;
        Thu, 14 Nov 2019 03:40:00 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel timings
Date:   Thu, 14 Nov 2019 11:39:49 +0200
Message-ID: <20191114093950.4101-3-tomi.valkeinen@ti.com>
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

panel-simple now handled panel osd070t1718-19ts, and we no longer need
the panel timings in the DT file. So remove them.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts  | 16 ----------------
 arch/arm/boot/dts/am43x-epos-evm.dts | 16 ----------------
 2 files changed, 32 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index 811c8cae315b..040403049cea 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -91,22 +91,6 @@
 
 		backlight = <&lcd_bl>;
 
-		panel-timing {
-			clock-frequency = <33000000>;
-			hactive = <800>;
-			vactive = <480>;
-			hfront-porch = <210>;
-			hback-porch = <16>;
-			hsync-len = <30>;
-			vback-porch = <10>;
-			vfront-porch = <22>;
-			vsync-len = <13>;
-			hsync-active = <0>;
-			vsync-active = <0>;
-			de-active = <1>;
-			pixelclk-active = <1>;
-		};
-
 		port {
 			lcd_in: endpoint {
 				remote-endpoint = <&dpi_out>;
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index 078cb473fa7d..330fce060e8b 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -47,22 +47,6 @@
 
 		backlight = <&lcd_bl>;
 
-		panel-timing {
-			clock-frequency = <33000000>;
-			hactive = <800>;
-			vactive = <480>;
-			hfront-porch = <210>;
-			hback-porch = <16>;
-			hsync-len = <30>;
-			vback-porch = <10>;
-			vfront-porch = <22>;
-			vsync-len = <13>;
-			hsync-active = <0>;
-			vsync-active = <0>;
-			de-active = <1>;
-			pixelclk-active = <1>;
-		};
-
 		port {
 			lcd_in: endpoint {
 				remote-endpoint = <&dpi_out>;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

