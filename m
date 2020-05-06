Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC4DC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:36:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F20020663
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbVhZ4DS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgEFKg5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 06:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728338AbgEFKg4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 06:36:56 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7D4C061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 03:36:56 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id b6so305633plz.13
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 03:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=76eHOjGHMEgzX37Faryvon4g3SALJsaVuBiR0wCzH1s=;
        b=bbVhZ4DS9wqmaRlJjokLaRu4lxF8whWuQYaW/PZ0PAm/0oD4zzJepaXvrEYmIEAVBF
         22YdCtTnlNpnVe/XnNAqzRFvHCi9ePePIkq1gfkKfZGHv0YzkbK1xPNfJ/8rg2wPz3G5
         hKBWVSnAjBqnY9rxA1bPal6hkql7nuWiM4DmHSrFbspbtZbWnadqi/1LWjFXjwic1uNS
         W+obUW/OJ5im+ozRFgDSzdEexjj2cM19hQqixgQYfKp9zKNoKUmyC37Ov65oUGELlSkF
         3KCp0Hfyr1Dx9yggrgKOXH72+OHr7jQ4YJj69aUyyM5JUignznBLmD6NPe+UFQgTXEGk
         REEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=76eHOjGHMEgzX37Faryvon4g3SALJsaVuBiR0wCzH1s=;
        b=hrgdsbIzLcjmyjm1l3FDdh7pLACZHU0YTe8nmIimUaWi10eU7Ysh3jlsbb5AYqgWnu
         J/k0tPK8TTyqL2TTMK+7pZuKsnHPxviCubJHqTxXHsUq3mgblIYsucLGOCRRX0ig9y0D
         VSn1LbB3Yqg8KTeAe8hpN23KHtGVszKksmQ3L/AXv1Sxl529iL8PFXQm2oKrLCwk2LMu
         xMh6X63NTp++5w62AHi7W3C76hZsMbKHLBzI2w+8+iAD0QZYCBsyuHJGK9XC+00IdmTS
         NUnktRjSTSIuieHZSO0INdFEpaD1x2724DThe3O335DWOOEtFKeXvV+fV5SaLGkxoO1r
         TXow==
X-Gm-Message-State: AGi0PuZk4De8yRu3TYnCITEtT/be30K6Gd85BiPEXMF1pqU4CoCP+QF4
        tZ1RiBSYjemmFqbbiFfUIxg=
X-Google-Smtp-Source: APiQypIlm5ITusl54MJwIXCqwRSpoGSeJlra1vj/chEzhCyV5ADnxAyySg5sofguMnZFg8Zqk+B4aA==
X-Received: by 2002:a17:90a:fd16:: with SMTP id cv22mr8361235pjb.169.1588761416194;
        Wed, 06 May 2020 03:36:56 -0700 (PDT)
Received: from localhost.localdomain ([106.215.43.48])
        by smtp.gmail.com with ESMTPSA id i72sm1601582pfe.104.2020.05.06.03.36.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 03:36:55 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org
Cc:     cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC 7/8] arm64: dts: actions: Add MMC controller support for S700
Date:   Wed,  6 May 2020 16:06:09 +0530
Message-Id: <1588761371-9078-8-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
References: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commits adds support for MMC controllers present on Actions S700 SoC,
there are 3 MMC controllers in this SoC which can be used for accessing
SD/EMMC/SDIO cards.

Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 56f2f84812cb..3f1fc3e48415 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -258,5 +258,38 @@
 			dma-requests = <44>;
 			clocks = <&cmu CLK_DMAC>;
 		};
+
+		mmc0: mmc@e0210000 {
+			compatible = "actions,owl-mmc";
+			reg = <0x0 0xe0210000 0x0 0x4000>;
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_SD0>;
+			resets = <&cmu RESET_SD0>;
+			dmas = <&dma 2>;
+			dma-names = "mmc";
+			status = "disabled";
+		};
+
+		mmc1: mmc@e0214000 {
+			compatible = "actions,owl-mmc";
+			reg = <0x0 0xe0214000 0x0 0x4000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_SD1>;
+			resets = <&cmu RESET_SD1>;
+			dmas = <&dma 3>;
+			dma-names = "mmc";
+			status = "disabled";
+		};
+
+		mmc2: mmc@e0218000 {
+			compatible = "actions,owl-mmc";
+			reg = <0x0 0xe0218000 0x0 0x4000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_SD2>;
+			resets = <&cmu RESET_SD2>;
+			dmas = <&dma 4>;
+			dma-names = "mmc";
+			status = "disabled";
+		};
 	};
 };
-- 
2.7.4

