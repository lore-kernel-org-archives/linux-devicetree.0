Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFD1C28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A4582078C
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bZZ0sEhP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbgEFWRG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 18:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730012AbgEFWRE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 18:17:04 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1845C061A41
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 15:17:03 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g12so4490846wmh.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 15:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C7wyn7pTmnqlyc+rUBJSxE06sG0HtgEW0OKPvR8Tsxw=;
        b=bZZ0sEhPZuBxlzODOJ2aTuq+FhFpV1ia8MKgxHjrFxQTgPgb1/IiJIyk1VfFMd2Ao8
         JStJv+kED03Cu503MsnaEP34m51mBXV4YQbVJiHLMvcCQKquwqOsjSofBO0Liyd3A4IY
         KUDyuKelz3pjodgMWdFuCNVUhCKcslha7bMryR02eLZmMMZPsDcj2Hlchq4iuHQIz4a7
         uag3vtq1iN4X4HqD27GUp5nfxxx1m+YPzrlKF/ctbn7Xt8O4yEgRYgh1unTzD7KEkNEJ
         Yldo4q4P5P+OMg/2mRv/7h5wk7G0IMeTM6p7A9/t63pRICb3yB2myHnMx6We0WKuWFmv
         DqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C7wyn7pTmnqlyc+rUBJSxE06sG0HtgEW0OKPvR8Tsxw=;
        b=bulFhY1EYyUeV5kxmDgiytCjs5MnQVDB0GEhTj67CGZA6W3lAAI9A3NiPgyWiPsTzH
         LSLoQvGI/apOgLlWAbOvbhCjOgxYp6H/8tWj9l1RLYojUbQQndaJPypZcT0eZYpCbuG9
         j9eiJLn7+3Sob/7SYrEai9vbZLo8ubPx74GipJ27Bu3w5SRJuTHKtNLJRxS+rvxBWmQH
         AZPvfU7U8yDMEM2p8gqHY3Dww6jegm6gtLTFi7/kN2tsA8lSBDzjIKDGNhrkaD8NEhU/
         LSig4oNS4ndtNN5/dbi8nh4VDVTrLttSEyQxHvXwN+ITRQzv5VGb4icQ5SxbtIrh/hSQ
         7Klw==
X-Gm-Message-State: AGi0PuarCe6BDxvP3btssQctT1MzZ8tGvalV3S4DgwiztuqCWdfKBRR5
        KIM91BNbXK06zT3HpkCFCX8Sug==
X-Google-Smtp-Source: APiQypITq7crxLJkVn/RbrWEv9v+jnCVErJ0W6XgCWccZZtRNqqXQPGqAMhjaj6LCy08zERmAi+p4Q==
X-Received: by 2002:a1c:4b16:: with SMTP id y22mr6789413wma.170.1588803422609;
        Wed, 06 May 2020 15:17:02 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id f5sm4760671wrp.70.2020.05.06.15.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 15:17:02 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: meson: gxl: add acodec support
Date:   Thu,  7 May 2020 00:16:50 +0200
Message-Id: <20200506221656.477379-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200506221656.477379-1-jbrunet@baylibre.com>
References: <20200506221656.477379-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the internal audio DAC to the gxl SoC DT

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 44c0371f63ca..fc59c8534c0f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -54,6 +54,17 @@ dwc3: usb@c9000000 {
 			};
 		};
 
+		acodec: audio-controller@c8832000 {
+			compatible = "amlogic,t9015";
+			reg = <0x0 0xc8832000 0x0 0x14>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "ACODEC";
+			clocks = <&clkc CLKID_ACODEC>;
+			clock-names = "pclk";
+			resets = <&reset RESET_ACODEC>;
+			status = "disabled";
+		};
+
 		crypto: crypto@c883e000 {
 			compatible = "amlogic,gxl-crypto";
 			reg = <0x0 0xc883e000 0x0 0x36>;
-- 
2.25.4

