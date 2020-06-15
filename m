Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC64C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 15:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B89D207D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 15:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="KP+q9r6w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730621AbgFOP5G (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 11:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728747AbgFOP5G (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Jun 2020 11:57:06 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7A4C05BD43
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 08:57:05 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id y6so6640048edi.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 08:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=NHaBYm0HpUC5pJAiBssI0OfOeAxVdPNnUnHk40KAAsc=;
        b=KP+q9r6wzxs115bW0eMO2DohNX9rCw9Cz4L039hlJAUT198/dXwcydVZzJwZJXJ7wm
         QUUt9OzMq5qF3M+yLH0VLDEdVUWZ7XDUA9+5k6MEpA4Ae6vtsRRD2G+4DOmZRF7HoWSu
         83rRIvgCtZWqtdxwftkJ9OZolun50c6HE11yJLcHQ3Zm2FubVLhYJYl6hc1m5IxAa7tC
         T0CoTc/3/EaLRrYmFRA36uz+m5W0tTBv7i5Xd/jCoNMPzFGu8h1EFG/X1UmJRJsifykY
         fI9U3kmPtNpBFDMtTu8kpdqphXiIb9bQ2LtSmHeWKeqmu3uXY+16/mBfvSqAbJ81svg8
         rtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NHaBYm0HpUC5pJAiBssI0OfOeAxVdPNnUnHk40KAAsc=;
        b=re9R2+78enj58asOyoegQNUxUA2Ccf22FisrdzAXFrT9aT1D7SDsyZh6KVGk2S6FTp
         j+UiU4bKN8D5vkm4ibjtqz+dkSmFFtYtUtYh8WQoppxlPNOYYFKFdBOBNDVPZS8l0JiM
         KkX8aN9iIkSuzNduheWKUsvyTxqwbQznbEZQd6jc3lSYlTvwU8jz+wGrPZ5RKNIBVsJd
         sBFImXp1ywVnXHYzkkG+NmSQhEQUhxTZsB5tVSSz4a1+E/s1r2MvBMwCaV3owAFsYCTS
         sM3yVzAvQCBqquKnVdnrGeKo9q8YTkjdz85pyc/SCkuQvR+3WHNO7JOZZZIYClCbytjY
         YPcQ==
X-Gm-Message-State: AOAM5300YO0GlbDa+8OhionOxZHiZ0L9Ysq3kJ1a2f3xZRp/Gg3AGzEc
        OH82iFsFsjG/SoioTcQFeJy+tg==
X-Google-Smtp-Source: ABdhPJxPbRyHb8slg10OWgowR1NCGZM8LSZmuqbvmqwmfYwk0/4rLig9+OIHBgsKHonWujzdykRUXg==
X-Received: by 2002:aa7:c68b:: with SMTP id n11mr24565337edq.278.1592236623548;
        Mon, 15 Jun 2020 08:57:03 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id g25sm8543025edq.34.2020.06.15.08.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 08:57:02 -0700 (PDT)
Date:   Mon, 15 Jun 2020 17:57:01 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH V2] ARM: dts: am5729: beaglebone-ai: fix rgmii phy-mode  
Message-ID: <20200615155701.GA3845236@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Since commit cd28d1d6e52e ("net: phy: at803x: Disable phy delay for
RGMII mode") the networking is broken on the BeagleBone AI which has
the AR8035 PHY for Gigabit Ethernet [0].  The fix is to switch from
phy-mode = "rgmii" to phy-mode = "rgmii-rxid".

Note: Grygorii made a similar DT fix for other AM57xx boards with a
different phy in commit 820f8a870f65 ("ARM: dts: am57xx: fix networking
on boards with ksz9031 phy").

[0] https://git.io/Jf7PX

Fixes: 520557d4854b ("ARM: dts: am5729: beaglebone-ai: adding device tree")
Cc: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
V2:
- fix formatting of commit reference
- add Review-by: from Grygorii

 arch/arm/boot/dts/am5729-beagleboneai.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
index 9877d7709d41..4c51c6b05e64 100644
--- a/arch/arm/boot/dts/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
@@ -505,7 +505,7 @@ &mac {
 
 &cpsw_emac0 {
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-rxid";
 };
 
 &ocp {
-- 
2.25.1

