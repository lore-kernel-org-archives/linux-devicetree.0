Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555D3C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 16:12:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BA2B2065D
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 16:12:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUslQwh7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgENQMS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 12:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727935AbgENQMS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 12:12:18 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E273C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 09:12:18 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id n18so1515440pfa.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iq25LTwXEFRJhD+OnRlNqkQp31RrUmA9ayd2n+EnuO8=;
        b=qUslQwh7wi9KUoRz7+NTfcmNh906uA25RhWONLuwHJAZ6z5Ys7ozADgdnSOU6AO/3E
         gtNC7/Ar2klwZ9dBwl+ELEExCd5AALzJmWUEE0mN41K82zda8dTR0hDrqyZfA8YxTNYD
         eLbqGvMPsAPQRxrAIMeZldL//XkY8Av8iOGxJ3LqggEQeya7aKuB6MUo0jWGCA/4wiqf
         AbajBqD00r6MnwnwmgySx2B9xHRTiC7eKrHSJuxZEI8KCzVOZG6dG14ecle6006KzfPF
         c0qgoQth0k0GhXcEN+YJ3+SzGnwo9WgjDXqNdS8II6kh2pmCQ4lw8HtdHOdXZT/tpWq6
         S3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iq25LTwXEFRJhD+OnRlNqkQp31RrUmA9ayd2n+EnuO8=;
        b=fIZ0bdz4PTc79Q2J486S2zlsQILwPzNdWWWo34b+soSinAgojpESUodarKvZWfybdn
         UmAcOCEYO3OCV5HVX3E1yQzhsEKaX5iltxBI9vA7wWql7mT8q431j5tofTI7S4jbqA3J
         vrJjSdQ8aOtv51G1/P6+EC9VHxTNhjK0jLJ6hCWTxF6p/VoppnFQEshBB2vncu4rng7/
         3kYc+gnV10dL09j/UQbElxIk22GgtzvMCs0sRor4ctwioXISh3BX9YhRy5V6oTbH7bNJ
         H2xRkOGS2ib5q+NRuLb5uw+NI8yh+iUfu9r7px/Smn1ygWIjqGDH5wUZN5jZoioKZyp8
         9MpA==
X-Gm-Message-State: AOAM531V7Nf9wHnaYFt+8HdTUH+N2UUDf+kXNf8QWDJFyl2LlnZNiDoJ
        ee4f3Yg2yct1oE26/Zg12s0=
X-Google-Smtp-Source: ABdhPJx17oMOQ9Kw6oKeoUheSZIcyfjXCLb5ZrrPy7cBcxJKbx1NeZ2JhL85jxt8Ywumr+U2/lMQ5g==
X-Received: by 2002:a63:1103:: with SMTP id g3mr4684320pgl.206.1589472737839;
        Thu, 14 May 2020 09:12:17 -0700 (PDT)
Received: from localhost.localdomain ([106.215.24.137])
        by smtp.gmail.com with ESMTPSA id t5sm2331755pgp.80.2020.05.14.09.12.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 09:12:17 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org
Cc:     cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v1 8/9] arm64: dts: actions: Add MMC controller support for S700
Date:   Thu, 14 May 2020 21:40:56 +0530
Message-Id: <1589472657-3930-9-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commits adds support for MMC controllers present on Actions S700 SoC,
there are 3 MMC controllers in this SoC which can be used for accessing
SD/EMMC/SDIO cards.

Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
Changes since RFC:
	* No change.
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

