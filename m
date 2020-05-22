Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4092C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 12:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5B1320878
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 12:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Sn/1CrJl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbgEVMID (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 08:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729656AbgEVMHf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 May 2020 08:07:35 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CC3C08C5C1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 05:07:34 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id n5so9593369wmd.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 05:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLB08H4ZIlTMzvj5hInDPm3tTNq7mk/XtYoMNSk6v2w=;
        b=Sn/1CrJlRf1gaXAt7BzExoLU8RuOHChRbTQLpaUrzwFYqGsov68ZYpiUu778e1h74U
         EG8H1AkAkI/Dvmx5QKB9iXaqQh4CeJTf3KZiOAOTno9BIiFgfkjQQ3V4IRkEH4GAPrLA
         maiOekJ94V3I7H6hUXcjbEOxaDc55leACFe7VuKpdTyg7O80elge/QfPQjJeWku+bhMk
         /BOFybbSX0X7y3Qvi81k2fAIAzdXkIexmNVingkHUbHWITInUkDyAjfPXgMuJPMXVerx
         QZT3djIizjK6MVClkQM2eCBMIBdSWPweS9uJyC7sYma38spotFpi6WHBHlfhEvvRmcPV
         FXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLB08H4ZIlTMzvj5hInDPm3tTNq7mk/XtYoMNSk6v2w=;
        b=aUQGtQ+RXoFEmMnqJl2tjYNOMsRzRV8G21hmmA7lo208ucvP0YVMxqj1d16VV/DdOx
         /JdJhdSQZ2NcUxpkk9httweCZmTwQxaYGXKBYieNP9g7sOh9isjrpmU/5gfcnA+zKmyk
         Ol9lKB+19jQ1jchEwaad1ZVEpd/6v3U3HjivuACG8o9E7XntXmNQy1L3VX0uj9BfQ01H
         bzZabMJz0HErGPaqH1Qxq/wm39BXRMGVkfK61KqTz96UzzQ1LHec5BS9O1hnX2uR0NcI
         r2G2Rdf1NS7pk5gqpMN1XUn5ALi/GntDcJOjOqyGLK3VSyEfibXHoPnFAN1vw8Qd/rh6
         yFbg==
X-Gm-Message-State: AOAM530GyafZU7zjejV4eljo6sXVlPk1TGVREbWXXb8R1Jb62z18WTrf
        hvQpE2U3oNoEMEIUY0R/OWmflQ==
X-Google-Smtp-Source: ABdhPJy2DwWygp0CZukF1c5MDhWbG3suEHoLEk61djOMVZnj0q+0DRdXHTp94SuAfm6DtS52JEtM4Q==
X-Received: by 2002:a1c:4857:: with SMTP id v84mr13962835wma.106.1590149252025;
        Fri, 22 May 2020 05:07:32 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id f128sm9946233wme.1.2020.05.22.05.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:07:31 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Edwin Peer <edwin.peer@broadcom.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 08/11] ARM64: dts: mediatek: add the ethernet node to mt8516.dtsi
Date:   Fri, 22 May 2020 14:06:57 +0200
Message-Id: <20200522120700.838-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200522120700.838-1-brgl@bgdev.pl>
References: <20200522120700.838-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add the Ethernet MAC node to mt8516.dtsi. This defines parameters common
to all the boards based on this SoC.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 8cedaf74ae86..89af661e7f63 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -406,6 +406,18 @@ mmc2: mmc@11170000 {
 			status = "disabled";
 		};
 
+		ethernet: ethernet@11180000 {
+			compatible = "mediatek,mt8516-eth";
+			reg = <0 0x11180000 0 0x1000>;
+			mediatek,pericfg = <&pericfg>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_RG_ETH>,
+				 <&topckgen CLK_TOP_66M_ETH>,
+				 <&topckgen CLK_TOP_133M_ETH>;
+			clock-names = "core", "reg", "trans";
+			status = "disabled";
+		};
+
 		rng: rng@1020c000 {
 			compatible = "mediatek,mt8516-rng",
 				     "mediatek,mt7623-rng";
-- 
2.25.0

