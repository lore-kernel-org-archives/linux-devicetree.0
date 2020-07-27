Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB35CC433E5
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 07:41:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B340E2072E
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 07:41:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V47joEy7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgG0Hlg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 03:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgG0Hlg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 03:41:36 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1293C0619D2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 00:41:35 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id lw1so883779pjb.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=02L+nV06/zwmICNroTjg7mYMa/wTXN2VrRKBLAVM2dw=;
        b=V47joEy77meF+oSYORGjxuLpKGaeEr7xnIXCBWjrzNaPfWMvv2QRB45d0IROIpCTOO
         80nbmPjwyX5jPTo6BZfOxXcEMWPaVYTXVfJo+azQjZsMxvxNXq3LCe12uRk/2m8Ifli5
         2PJ9EDDRyYjJ9BIe+vMXLuW3oWZVdsOwml30I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=02L+nV06/zwmICNroTjg7mYMa/wTXN2VrRKBLAVM2dw=;
        b=PnmTb1wpGQH48T+naXWS9lZNTuNG/cQDaVtxX3N13ra66ba3xfyOHR6NNJieaPh2Ku
         T7xSK5ExFlPuDFaUOwzimF+IFzZBKbfkp5jjEiPWp/PLr6UuUOWJI4QT4FEm85qtCRr3
         NQcc3r8mlBsPmN5fwVn+wk00wfgCqaflz3LCykRb2AIEYZjaeMBkH2xybXC/SRLiqn3p
         nyhDoloMNByvgwHwoPSRdAKJzfNfZ/GAYEWpYxKjQKI5NM2x2sZS5l507lmQqVoICFJV
         Q91QpSE+N4MABNX7Hlq95b7bNrC2QUZpnUdp61BCvTw0TX9pJpCNahAmAOQGoQM9mLmV
         oG2g==
X-Gm-Message-State: AOAM532dfbBKr6S1W20JI3yPmwvoTy8hip1Zo8YFnBPgtPZV3zrPx1gP
        1b4lm5btRiuwBSYnby/ZPTxY7g==
X-Google-Smtp-Source: ABdhPJzuZ7ICmuF4ozEQuv167siP20VYHysSz7yu/BjNoHfuX0QIrN7rkJ7u6etQwGM3gpJ79LyGpA==
X-Received: by 2002:a17:90a:204:: with SMTP id c4mr16807174pjc.165.1595835695486;
        Mon, 27 Jul 2020 00:41:35 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
        by smtp.gmail.com with ESMTPSA id f2sm13966544pfb.184.2020.07.27.00.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 00:41:34 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8173: elm: Fix nor_flash node property
Date:   Mon, 27 Jul 2020 15:41:24 +0800
Message-Id: <20200727074124.3779237-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

bus-width and non-removable is not used by the driver.
max-frequency should be spi-max-frequency for flash node.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Reported-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a5a12b2599a4..01522dd10603 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -431,12 +431,11 @@ &nor_flash {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&nor_gpio1_pins>;
-	bus-width = <8>;
-	max-frequency = <50000000>;
-	non-removable;
+
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		spi-max-frequency = <50000000>;
 	};
 };
 
-- 
2.28.0.rc0.142.g3c755180ce-goog

