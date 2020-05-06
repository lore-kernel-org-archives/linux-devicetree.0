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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CBBC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:37:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35F3D2070B
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQtU4g1E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgEFKhA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 06:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728338AbgEFKhA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 06:37:00 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C71BC061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 03:37:00 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id e6so646814pjt.4
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GRl+cRuJItfX393h+k5FDOGSXXO3n1nRchoc5uvkFw0=;
        b=GQtU4g1Ef3lzCGVFsz5hJfhxLq/JbDHXq2Fnt5aY2jcoz6abJGFAl8TWSLvV5LAiCR
         xq2AIK1ypOIYFB3yKM+F3HTkIFVn1WFgMEoisAQKdN2QohM66H6clyjr7TVwk2x25Dm4
         m2hFaKPGzJA8PoiDq96L1+rOiCe57zXAqqEtLyJ5fXF7wSDtegcXaK43a8I3cVufy7ut
         AkZcfFc1HWiBDfS2873H1l1xUK9a+0AN+PQqvwsjaN2Wakgc76c016kMAUENOIASFB7C
         vdrTnXT9nNVefEzuaYGIjVqfU6QHGPz1S2xqKc3ggSHrpFNOp83NDxaudqyoDzuM8LnS
         w8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GRl+cRuJItfX393h+k5FDOGSXXO3n1nRchoc5uvkFw0=;
        b=pRtmMoMIdHaVjvMHK+3pTHwra/gDQEPwae/mh5w68TjWbcpIYtsnHJrhfA7b7Cznff
         xv0b89lUprUPrRGg76ZW7mNoAD8IY2Rp8OOc03ttvD/ie6ySYZhCL6HC7F9HzYiW4h49
         BupejblHfE4HeE1QzX4KBv9KvwObgbhhxXcGhafdDHUqig+tc5OplX9dEzaL28tnpA7R
         azV3B+Kjdak2++wIm7tZj/Sb4Uqh5UPTWBBx/gWao0tZgJRdgpFtXdVn3T9XN6EOLF0s
         xrm6HVWdmQ7HBdoNYMGGlONRCQGMpsuy0bnBqBUZ5w5dbyAZOqryPY/jq/S9BBtQYw6V
         lUUw==
X-Gm-Message-State: AGi0PuZAMW+H/f27BdVzoi+BWT9EJ/fPYX9mzro9ISKemaQvTKEiAJXj
        qWQHBlSDz5dRDmHLDZhlOIc=
X-Google-Smtp-Source: APiQypLpxk8AcJgk+dPBHwI9w4FC4I21Xkht0unu7Q97N9db1MwxkgDMsuJhQ7f45VVEMuVfF4YgCw==
X-Received: by 2002:a17:90a:30a5:: with SMTP id h34mr8235042pjb.171.1588761419966;
        Wed, 06 May 2020 03:36:59 -0700 (PDT)
Received: from localhost.localdomain ([106.215.43.48])
        by smtp.gmail.com with ESMTPSA id i72sm1601582pfe.104.2020.05.06.03.36.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 03:36:59 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org
Cc:     cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC 8/8] arm64: dts: actions: Add uSD support for Cubieboard7
Date:   Wed,  6 May 2020 16:06:10 +0530
Message-Id: <1588761371-9078-9-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
References: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds uSD support for Cubieboard7 board based on Actions Semi
S700 SoC. SD0 is connected to uSD slot. Since there is no PMIC support
added yet, fixed regulator has been used as a regulator node.

Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
 arch/arm64/boot/dts/actions/s700-cubieboard7.dts | 41 ++++++++++++++++++++++++
 arch/arm64/boot/dts/actions/s700.dtsi            |  1 +
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
index 63e375cd9eb4..ec117eb12f3a 100644
--- a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
+++ b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
@@ -13,6 +13,7 @@
 
 	aliases {
 		serial3 = &uart3;
+		mmc0 = &mmc0;
 	};
 
 	chosen {
@@ -28,6 +29,23 @@
 		device_type = "memory";
 		reg = <0x1 0xe0000000 0x0 0x0>;
 	};
+
+	/* Fixed regulator used in the absence of PMIC */
+	vcc_3v1: vcc-3v1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.1V";
+		regulator-min-microvolt = <3100000>;
+		regulator-max-microvolt = <3100000>;
+	};
+
+	/* Fixed regulator used in the absence of PMIC */
+	sd_vcc: sd-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.1V";
+		regulator-min-microvolt = <3100000>;
+		regulator-max-microvolt = <3100000>;
+		regulator-always-on;
+	};
 };
 
 &i2c0 {
@@ -81,6 +99,14 @@
 			bias-pull-up;
 		};
 	};
+
+	mmc0_default: mmc0_default {
+		pinmux {
+			groups = "sd0_d0_mfp", "sd0_d1_mfp", "sd0_d2_d3_mfp",
+				 "sd0_cmd_mfp", "sd0_clk_mfp";
+			function = "sd0";
+		};
+	};
 };
 
 &timer {
@@ -90,3 +116,18 @@
 &uart3 {
 	status = "okay";
 };
+
+/* uSD */
+&mmc0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_default>;
+	cd-gpios = <&pinctrl 120 GPIO_ACTIVE_LOW>;
+	no-sdio;
+	no-mmc;
+	no-1-8-v;
+	bus-width = <4>;
+	vmmc-supply = <&sd_vcc>;
+	vqmmc-supply = <&sd_vcc>;
+};
+
diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 3f1fc3e48415..8a541dd48f61 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/actions,s700-cmu.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/actions,s700-reset.h>
 
-- 
2.7.4

