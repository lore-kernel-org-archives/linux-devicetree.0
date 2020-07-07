Return-Path: <SRS0=wVrF=AS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3041C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 10:12:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BF99206F6
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 10:12:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cE0rViub"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgGGKMS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jul 2020 06:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgGGKMS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jul 2020 06:12:18 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65124C08C5DB
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 03:12:17 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so33252077wrl.8
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ox2ec9xKeqYNpU//N7D5LOrU5GweWdGDzS15Zrqp/JA=;
        b=cE0rViubzmawGs+s2bNz/HYeJLyTK9UhluVB6bOjXJ+IEJTQNmNzLxv6o7WDhR99GJ
         7O0NOspsGwaqUUZWZhOk2yYCw9Qgr6sNLKG7r0heK45wZDL45btcODXbBTjyPMAG/mwI
         x3JLFhxPnnkSuU+jLELEtwEnFdPJS23UVx8g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ox2ec9xKeqYNpU//N7D5LOrU5GweWdGDzS15Zrqp/JA=;
        b=hPvc4hi4ZlvwBonYS4I/dqBcQGSuhXCkWXgKo/vv5JABFMcK0nWwAee7L6rSPbtV9M
         /jfOCaP707Hbg30hXlND+6se65309rVIraVNL5FEYfd7PAHspv+tWXAyoGeEO10AfC1L
         +UYo11sihghrQMQ/Ol4lqDCGPluZg2RFlJaLOEC5qyLpm9gNZxs11Qm+ghtO5HW7YsOU
         sKZ/lMwkmw+keMeiZP9YC2SZqS81Rqkybn0ETCzFwnheMBpFOyR0Ip3Cm3dk3+11Gubi
         OgiKSgIfcsoDfjHdzABwcUtp/NGaUOmrN+OWiaAhTvSogzCI59ZPW06xg/SqoeM+vhYm
         kuGw==
X-Gm-Message-State: AOAM531csZTJ4dtQE2nLVq37RSDFEktlbFIJHViKxs6u1znG8Ziqw/VL
        2F5dc6b6NLiUNJJZfCYh8/uZuw==
X-Google-Smtp-Source: ABdhPJxoBYAgdDhWiramJwYkHt3jHpGiUWv4+qul7we1FmarfIbbJjwEpFAWtIooatx3TBXa8a5ikA==
X-Received: by 2002:a5d:55cb:: with SMTP id i11mr50329141wrw.28.1594116736051;
        Tue, 07 Jul 2020 03:12:16 -0700 (PDT)
Received: from panicking.lan (93-46-124-24.ip107.fastwebnet.it. [93.46.124.24])
        by smtp.gmail.com with ESMTPSA id f12sm363053wrj.48.2020.07.07.03.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 03:12:15 -0700 (PDT)
From:   Michael Trimarchi <michael@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: rockchip: Fix VBUS on rk3288-vyasa
Date:   Tue,  7 Jul 2020 12:12:14 +0200
Message-Id: <20200707101214.2301768-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Connect the voltage regulator of vbus to the otg connector.
Depending on the current mode this is enabled (in "host" mode")
or disabled (in "peripheral" mode). The regulator must be updated
if the controller is configured in "otg" mode and the status changes
between "host" and "peripheral".

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 arch/arm/boot/dts/rk3288-vyasa.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-vyasa.dts b/arch/arm/boot/dts/rk3288-vyasa.dts
index ba06e9f97ddc..5b0263b1be73 100644
--- a/arch/arm/boot/dts/rk3288-vyasa.dts
+++ b/arch/arm/boot/dts/rk3288-vyasa.dts
@@ -87,8 +87,6 @@
 		pinctrl-0 = <&otg_vbus_drv>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-		regulator-boot-on;
 		vin-supply = <&vsus_5v>;
 	};
 
@@ -405,6 +403,7 @@
 
 &usb_otg {
 	status = "okay";
+	vbus-supply = <&vusb1_5v>;
 };
 
 &vopb {
-- 
2.25.1

