Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB89C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 14:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6C9A2077B
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 14:40:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fvI/aRSK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfLDOkf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 09:40:35 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:32856 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbfLDOkf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 09:40:35 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4EeWcA095124;
        Wed, 4 Dec 2019 08:40:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575470432;
        bh=wCcmDKSgjXCTPwr0LgBGAxoaAwmIOSctH/Yp+FggVxY=;
        h=From:To:CC:Subject:Date;
        b=fvI/aRSKMy55a87C4cZctOqsxcdtHjKtXqgZZ/LZi+Nzvk8vyeWrZVB0yc666gIEa
         3qLCtsxN3IQ3l/zCAR9ZhaR92sMwaJvN14VtIvO3E9fJSH1BrfuARfu6h7WifM3v56
         6iPOSp1WQOJfRMZM6/5sxrmojienGW+BSQQwA+CY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4EeWAq103921
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 4 Dec 2019 08:40:32 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 08:40:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 08:40:27 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4EeOA5057127;
        Wed, 4 Dec 2019 08:40:25 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <tony@atomide.com>, <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <peter.ujfalusi@ti.com>, <bparrot@ti.com>
Subject: [PATCH] ARM: dts: am335x-icev2: Add support for OSD9616P0899-10 at i2c0
Date:   Wed, 4 Dec 2019 16:40:24 +0200
Message-ID: <20191204144024.16021-1-jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for OSD9616P0899-10 96x16 passive matrix display. The
pre-charge period parameters are taken form a OSD9616P0899-10
document, but the display works fine with the default values too.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 arch/arm/boot/dts/am335x-icev2.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-icev2.dts b/arch/arm/boot/dts/am335x-icev2.dts
index 204bccfcc110..021eb57261fe 100644
--- a/arch/arm/boot/dts/am335x-icev2.dts
+++ b/arch/arm/boot/dts/am335x-icev2.dts
@@ -287,6 +287,19 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	/* osd9616p0899-10 */
+	display@3c {
+		compatible = "solomon,ssd1306fb-i2c";
+		reg = <0x3c>;
+		solomon,height = <16>;
+		solomon,width = <96>;
+		solomon,com-seq;
+		solomon,com-invdir;
+		solomon,page-offset = <0>;
+		solomon,prechargep1 = <2>;
+		solomon,prechargep2 = <13>;
+	};
 };
 
 &spi0 {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

