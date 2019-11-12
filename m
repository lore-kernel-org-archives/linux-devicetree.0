Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDD3C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 01:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E35E521925
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 01:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIa0Stzb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfKLBPg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 20:15:36 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42051 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbfKLBPg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 20:15:36 -0500
Received: by mail-pg1-f196.google.com with SMTP id q17so10659300pgt.9
        for <devicetree@vger.kernel.org>; Mon, 11 Nov 2019 17:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y0h6XVwl64mWKPaIlsuME5eexdqTqwMUk4rev+uicW8=;
        b=DIa0StzbygIcBQM8xDeiOm8dKfa9ZC9PuPgSq4N6FekM8VrgEql0H5wkhJ3/fLY8uf
         1khNPply9fgNBLox3VSuKYxvd+maHjFJVX88omsiRZHegswpACZNjWtRkFbbH/J890rs
         TphfLeEg8J88ryc0ejBnbte2tmKgOZfCdUxo8tRz40C9f8vstjWHaqwxUK9J+H94lk76
         G7Mjzlr3SDGoyk1xXBOhwADLQm6qxEzG0ROxP4chRBbta029Yz3wsguYe/tZTWNCuC4N
         ts24wOalmcKCj6Z1hhf2VD3dfb7+erXjiVpD2IoGoVXKl7sVmyGD6cGvNvvi0mI5lNrt
         QQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y0h6XVwl64mWKPaIlsuME5eexdqTqwMUk4rev+uicW8=;
        b=WqZ5k1m2dyWjitYmpPzk012VzuJZPB+mDyEG7bLzi4fWSl2qhzMPE9DA06Vk1VCxHz
         UMndwK9KXPMQl5VD3NAudO5Oc1xjEvHMXp0eQbbgKdi5d4EiFJ1DZr35OOKiJ2+LWZan
         rV4McXtwpgHS1caN6uAgcE03AszVzh2WVGFmLVidNveA2bmfRDdqVTPZNzqGvRqKBCS3
         LOoWj0lROrNmDi4cJiUHi8bnsfCsTCho4MQRrbkPAshTknZvkmczZGkfCIxM4Z0V1eRP
         a/yGI7z4+igDfX5YU93kHg82qbFA0IQ/PQ4RDGRcjWVOlSxgEateyfjq0lKpAY3RmWUY
         rZzQ==
X-Gm-Message-State: APjAAAUh6vdnSOmug2S6YXna+y75MVrzcj4Vgb3MsLlnG3n7rB0SEylA
        Z/EZQJGHYjX84NdD2EiyP0Y=
X-Google-Smtp-Source: APXvYqzU5S1gkc0MTNIlYM9b5FV6IzPPNByDYevydaoncYPERx3H9nV/gWamultUWTFXeH1jdZ7ErQ==
X-Received: by 2002:a63:f744:: with SMTP id f4mr10039839pgk.229.1573521335023;
        Mon, 11 Nov 2019 17:15:35 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id 186sm23361341pfb.99.2019.11.11.17.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:15:34 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Akash Gajjar <Akash_Gajjar@mentor.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: rockpro64: fix ES8316 i2c address
Date:   Mon, 11 Nov 2019 17:15:21 -0800
Message-Id: <20191112011521.3155504-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

According to Rockpro64 schematics [1] CE pin of ES8316 is wired
to ground, so codec address should be 0x10.

[1] http://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf

Fixes: 6860769ea771 ("arm64: dts: rockchip: add analog audio nodes on rk3399-rockpro64")
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index 7f4b2eba31d4..18bbe548839b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -477,9 +477,9 @@
 	i2c-scl-falling-time-ns = <15>;
 	status = "okay";
 
-	es8316: codec@11 {
+	es8316: codec@10 {
 		compatible = "everest,es8316";
-		reg = <0x11>;
+		reg = <0x10>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
 		#sound-dai-cells = <0>;
-- 
2.23.0

