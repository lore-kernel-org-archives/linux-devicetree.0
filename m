Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73ACDC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 11:25:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C0E2207F9
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 11:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="DdsJMtoq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgETLZr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 07:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbgETLZp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 07:25:45 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B54C08C5C4
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 04:25:44 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r3so852990wrn.11
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 04:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLB08H4ZIlTMzvj5hInDPm3tTNq7mk/XtYoMNSk6v2w=;
        b=DdsJMtoqD2XEe5pqI+7G1yIhCDJBpTVeqCCKfVUu9GfPyImPik8Xq5o3U5HJwOACo8
         VWicYw4xbBqY4JRDT15bYRlQtEa9idFjml9PKxfc1KOPVYBrehTeDtfV7xR4uWrq0RwR
         1iOZS4oIUEVFcgABFOUhiz64uD3cYjHVLDkIsBT9FyWb2CFLTlcm1JIskeVmIExaQI96
         LvEfFDjUugzJCn5oqI6+tXVc3sm2FQ+nrAFJAlGSaV9hNP1XedyZqGy+5ij+S9sC5o31
         8xOcTFLGbqcqq4S+14hx7O/aecbVf8cluflwtMquahckiUUAXdMjFYXVhVWaAfC+SRi4
         m5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLB08H4ZIlTMzvj5hInDPm3tTNq7mk/XtYoMNSk6v2w=;
        b=His5bl868Y+6yzPcvyq6+vCfvOOKABblu3TS5U+oriC2Oa0iTcFrcK2aW0EG9WA5Q1
         3+bnM3w7X+nGVx10DHv+cOlOd7sBUwkDalfHXzeHxRDg5GhLVS9B82DESFJdHCoDoYph
         cAdLebAFvdf85EBUdYuFh5CrviptQd0kgb0swetQsYZUL2Thcv0SjTDqwL1/jvBQqmnh
         OBastyTX5C1of8Wa04MVrg4grdW0g4oxNMaPQyOZKU8yyza/Rxc1GiRXLT0NU2/ynD2a
         zfxH2mVUwR1BX+e+fiKUdHUkiJzTnR/7oLSV0MagBEWGOCJat19oQfJugsNfiVf/xs8c
         uEgw==
X-Gm-Message-State: AOAM5332yO98FC9sfMVjG4i242xn58YVua+fMYQtYieiLvdkQoCsRl68
        ZLupcNKhhM0dLemEf7M83UKrWA==
X-Google-Smtp-Source: ABdhPJwwJBc3w2VmTMgfqTJSthEm43N5ws6r6wVEpUxxUeDaTlLFPSxSxxtCGl4iIm9ZRdTzPJlx+g==
X-Received: by 2002:a05:6000:1c5:: with SMTP id t5mr4071173wrx.229.1589973943577;
        Wed, 20 May 2020 04:25:43 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id v22sm2729265wml.21.2020.05.20.04.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 04:25:43 -0700 (PDT)
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
Subject: [PATCH v4 08/11] ARM64: dts: mediatek: add the ethernet node to mt8516.dtsi
Date:   Wed, 20 May 2020 13:25:20 +0200
Message-Id: <20200520112523.30995-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520112523.30995-1-brgl@bgdev.pl>
References: <20200520112523.30995-1-brgl@bgdev.pl>
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

