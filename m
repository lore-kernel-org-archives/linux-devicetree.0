Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C664AC54E4B
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A656F20753
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JaFQGRB8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730191AbgEFWRQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 18:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730187AbgEFWRN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 18:17:13 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978BAC061A41
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 15:17:13 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z8so4021200wrw.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 15:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0MFeWzPc1RUZtMsyR+QF2WWvfCyhWcmegLUYlhF9UuM=;
        b=JaFQGRB8TMety2Bpfl3x2Tww4yDno+k5vXFpcIGmmEwgw0PHZIuvG2a85Vs71Sfjt2
         zChciYcyifEARUUlEOlqF4kUuBrfTcx0uvVh9zmIDd8qawpW46L1qLcPkjybPHT4ttCc
         QVU7mcHUl/EXmPYSvjpzlb/FMQ9Q+Rlji8mNY+/HzIW91xBGRpAiFJn6Uw2jBMVJtdvR
         scJNxd82CB2/Zx/dLCtXEl3Wpu4xNKAbY3Mby9XqKEf+ag8b7+INndGBnAZqOPKlnNfJ
         x/9PXQ/EtDYsSYd2WPicz/HC/yX2OXROe5/PjjKDJbkflA9hsti9adA7ZxIXmoIFqugf
         AtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0MFeWzPc1RUZtMsyR+QF2WWvfCyhWcmegLUYlhF9UuM=;
        b=YRzT1XKnrhdO0UOb/4r9kjpc/VFSk4cNpQT4WRfBoSjPMFvPeTST+2AfrLN/m4e13g
         5sn2fPlILryu0NPp+8Kk53EQATzdnMAbMeX8EpX7YYDcFvDqihW46xPm/9/ZjuS88L2I
         PVjP+6bmotPlBUINM4NtTv95pkg80egemqL84gmDhXX05vqelJldqu2oynSP7s23r5Ki
         65Eio1Rpk9kFacAhz5VU3s3usdZzkxQb+42Eg6r1p36xdkecMqJyjhD5uKCtQV8/ZN3O
         N6Omhu887t7G7nOHXiFkdcnLQi7+PuHBLA22WM2cknRr4mv3KxxSw0X0gQ9FIPVPKeb7
         dw2A==
X-Gm-Message-State: AGi0PuaqEGkM/vWVRkFBQVk5GCeNMCa8Ls5BRVVHtU9PtunnxPJQ86Qz
        axlNZl0qylg7RrSAS34TBPopVrPfEh8=
X-Google-Smtp-Source: APiQypLiZViN47s9MAPYRjk6QeZwCIgZBt9QugEWVSMLxczjeK4W2LTz5D+BLFR6byBDFaOO0xCSOA==
X-Received: by 2002:a5d:550c:: with SMTP id b12mr11132976wrv.152.1588803432274;
        Wed, 06 May 2020 15:17:12 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id f5sm4760671wrp.70.2020.05.06.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 15:17:11 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: meson: g12: add internal DAC glue
Date:   Thu,  7 May 2020 00:16:56 +0200
Message-Id: <20200506221656.477379-8-jbrunet@baylibre.com>
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

add the internal DAC glue support on the g12 and sm1 family
This glue connects the different TDM interfaces of the SoC to
the internal audio DAC codec.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index 55d39020ec72..0d14409f509c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -343,6 +343,15 @@ spdifout_b: audio-controller@680 {
 			status = "disabled";
 		};
 
+		toacodec: audio-controller@740 {
+			compatible = "amlogic,g12a-toacodec";
+			reg = <0x0 0x740 0x0 0x4>;
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "TOACODEC";
+			resets = <&clkc_audio AUD_RESET_TOACODEC>;
+			status = "disabled";
+		};
+
 		tohdmitx: audio-controller@744 {
 			compatible = "amlogic,g12a-tohdmitx";
 			reg = <0x0 0x744 0x0 0x4>;
-- 
2.25.4

