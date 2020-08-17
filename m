Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D2AC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C6322078A
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjeoSavH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgHQKVk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 06:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgHQKVi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 06:21:38 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D2FC061389
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 03:21:38 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y6so7284156plt.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 03:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PqgAiBpz0/r1imIOkYXww3zZboUZciPETdwlnAwtvjA=;
        b=WjeoSavHT6uSLWChIGkTNCoMIUs+8hkl8JHDzsIqGg+pTXusuhMy9AA/b90hal1M5F
         JUfsppg6SiOXVVWYnYbMHPbXZzCx+jCtiFzA56eG2LeQAD413L2+jL3DIunqxv+dli1D
         pD5VK+Ohqfv6jkASiLqxYjRHFvITs0i68SqDvaXD4QwOIXOjqJufuXc5ZVvy8QM5kRfA
         Fc0GkZ+Y5eHV4A/fxSyNoLGy2/NFA8uYDcXTsLEetvtFJy5D33S3VT2+m/FM21d5JdGR
         rK7Ys5p7JsC/D6OCJ5ePG7/+0kDuflPi7IXiR//w4hq7kB2gcI6xwv//R9cGe1hE0gTK
         nMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PqgAiBpz0/r1imIOkYXww3zZboUZciPETdwlnAwtvjA=;
        b=if4m68WlTcU31otGujb3qN5QIsE+j7HK/n6bNdBJvO9pP7nj1/ZZjRVeN7o2P7jaf0
         DZgvhzyENz9zqGUu2nNJRfULdReiAd7gN4VzZ3gCGx1LDyt8V3+kCX10QBvrGveDltO7
         z9P2z8afmZ6fGiH9Hhx4j0shXbeRlfQx8XlDppX9yuVz7muVYJyIfvboqU95ELuFPADF
         ULYqSPZyM3+YDixwbZ5Zx1+pFJ+9nRaFU+RaGx2kvdoPLcnLnOvL+kdK8B8A2PAVTch4
         nGaLGvGJ30GfGmXOuSKpZbbe86sPHxNTQ7+OKuVXbjR3ECd5IXpc8Ea9ExsOKnyliooQ
         ruCg==
X-Gm-Message-State: AOAM533WGKr5Z4X0PIJ+QJu6konGb2LoFZekZe1m/zp1vW2AuMbZUpqA
        Nn6TFjd7+kc5nBTMPto4jyOUnJ2TEPU=
X-Google-Smtp-Source: ABdhPJyHHCKwKILAFcZptdC7vrGUvOexdN39jqq94DRbxWOmVymwbOtj57loG47MV4fNaRFz2PbNZw==
X-Received: by 2002:a17:90b:4385:: with SMTP id in5mr11377861pjb.16.1597659698051;
        Mon, 17 Aug 2020 03:21:38 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
        by smtp.gmail.com with ESMTPSA id l67sm16773206pga.41.2020.08.17.03.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 03:21:37 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
Date:   Mon, 17 Aug 2020 10:21:20 +0000
Message-Id: <20200817102122.434-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817102122.434-1-linux.amoon@gmail.com>
References: <20200817102122.434-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enable RTC PCF8563 node on Odroid-N2 SBC, In order
to support the RTC wakealarm feature for suspend and resume.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
changes v2
--Fix the missing INT (GPIOA.BIT7) pinctrl.
--Fix the missing rtcwakeup.
--Drop the clock not required clock property by the PCF8563 driver.
---
 .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 34fffa6d859d..f08ae1b337ad 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -477,6 +477,19 @@ hdmi_tx_tmds_out: endpoint {
 	};
 };
 
+&i2c3 {
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-1 = <&tdm_c_din3_a_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	rtc: rtc@51 {
+		reg = <0x51>;
+		compatible = "nxp,pcf8563";
+		wakeup-source;
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
-- 
2.28.0

