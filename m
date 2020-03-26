Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4A4C2D0E5
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:00:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 617632076A
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oBUu203t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgCZRAM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 13:00:12 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40247 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgCZRAL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 13:00:11 -0400
Received: by mail-wr1-f68.google.com with SMTP id u10so8714647wro.7
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 10:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KH7vfyD8OR+w3xEkJPXyaCwSs0SNGzK6N2bTA161o2Y=;
        b=oBUu203t7RmFgHaWPKfqDoFNZ7qHA8FaJ57IhhRltK+4P7FX4lRZ1KagibzgXmPiS1
         pAbe2ZIo/zd9GzYffqMYqUMCJjGL6Q+W8I4zCSJas0CYRTMQtw8aU3MVv6EbToUzoYnL
         g0x5K1Q2Echb5hvO70B2wRozqQKt5CeRQu3+D81P84GVEL+rFlnRyZF/CCnf5UBvzdZW
         YSsFQo7Jdm3hP0jc/+t2AF1FxDCySn7eFeEGXWZD5mtm8YeKAUvJP3S7YVO0vqdfyGzm
         l575fST3wy2MLaHF072JL8P9brrFrMR8mV38T19U7FpTLFUJPVgsRQSwsBuUfm/hToZz
         mEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KH7vfyD8OR+w3xEkJPXyaCwSs0SNGzK6N2bTA161o2Y=;
        b=YLbY6C1EjgWsktlf3XT1JQNQ1QIpoJ1OtcE5s5p8xIS6qbruHoBPI6e8lmL8D/wxM+
         poG3eKN6X1o/nMLeXCQtOspJhtS0REb9PnDYyjtM23tF6pdm0gPSHqMKN/72VxLLWF/1
         DFKipPfTILT2FehBr+zy+PweAv9l0LxAMfP+rReU9zdxArjo/BhNLRBI/HEAdzctCyPj
         vfhTCjOvcFKD+z3pUl4pYhwMV7zpiWZE2kWCpxuxO1s3p50oh20/wvHzBukks/D4vnzO
         xAYRGOMyjP5L7Qz/Mzm3IguoiM41i9P+SpkS+aWnC+Emb4vbcU6dugQ8Hl5aS7fcRtBU
         RLhA==
X-Gm-Message-State: ANhLgQ2eTqkYH68EIlA3Y+tQuTq+ikvgf9Ra50q0aoB67DQ1OlLmwcvv
        Kf79WziZIINry8WImAryaXv2Tw==
X-Google-Smtp-Source: ADFU+vt3O1mUzxJ83ShJE2FwW+mMD0UGCyJFszSd3W0wU5qTnctfhV6RSdjpu+iyF10tx1Nl+pEApQ==
X-Received: by 2002:adf:bbca:: with SMTP id z10mr10326561wrg.34.1585242009350;
        Thu, 26 Mar 2020 10:00:09 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id r15sm4609823wra.19.2020.03.26.10.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 10:00:08 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/5] arm64: dts: meson-gxbb-kii-pro: fix board compatible
Date:   Thu, 26 Mar 2020 17:59:57 +0100
Message-Id: <20200326165958.19274-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326165958.19274-1-narmstrong@baylibre.com>
References: <20200326165958.19274-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Remove the uneeded "amlogic,p201", "amlogic,s905" in the board compatible list.

It fixes:
meson-gxbb-kii-pro.dt.yaml: /: compatible: ['videostrong,kii-pro', 'amlogic,p201', 'amlogic,s905', 'amlogic,meson-gxbb'] is not valid under any of the given schemas

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 6c9cc45fb417..e8394a8269ee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -11,7 +11,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 / {
-	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
+	compatible = "videostrong,kii-pro", "amlogic,meson-gxbb";
 	model = "Videostrong KII Pro";
 
 	leds {
-- 
2.22.0

