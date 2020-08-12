Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17530C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 22:42:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E08B120774
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 22:42:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yu1KnMKD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHLWl5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 18:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgHLWl4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 18:41:56 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5435CC061383
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 15:41:56 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id jp10so4060951ejb.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 15:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLL08hgLAFRN8+eH2wuHu3yL9yIs9VbXLvMOd1ENnDY=;
        b=Yu1KnMKDNs41+PuZXc+eohQwNmsLOZitHTGqrj+WW3jS91ifqrFl1kUGA9YEbBAOBP
         9SYA7kOO10GA5Cmz28sRueZ6DlTRJnB3rDi5EE8apk73ROmH2xFUMRN08ZjQKnKx5kxK
         9ZnEcV9qFuqL7mWirT6Mffx3cRgXXzT9wIoNOfEY2PJPdIS3aYhYxrioKo69EcxFfg5m
         snfcQLslNgc0bFOob1eKVNBeml8wWlqyYPX1fQtzqwcnIJYmz7iA1e1bN3LBh2LJRY6e
         OwzzWu9KDaWGSROQJGnQvH/7WlriowO3d8EEntNN1RbjhCLUehhmJHDBBNGjvZaDGzj1
         HmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLL08hgLAFRN8+eH2wuHu3yL9yIs9VbXLvMOd1ENnDY=;
        b=tjqtSR2hov60l7r0FZM8qwFLw53JzpRyVdHG1ZbUqFOI1OUVI2w1y6aPfXjvjE3lbV
         EwVAjUI5t/SoxzF0WB4BPdsEsAlXjU5kt7a3YfNeEnlLOmvTojZb47L8nkiN8iWyu2Rq
         nONXU/r5mKHaoILISmAPBIO6cBX4iLv13gHmPHWU6g5KyEVUjKL98bedhP4UEGkMqrch
         Q5/jN2azIn1uYqv0MMBZgkjF6UcPwQ+bLBV1gbu4HU4VWGY7CG03MO+SRQ34k65OZRci
         4E1Y+Mco9HkqjNcjq2tilpQmNaicqSHWh0pvxljJ75GiLNLWV/kl6PIE2Ke5pm+wffU6
         pcnw==
X-Gm-Message-State: AOAM533DWljpCE7jvE+r7sHYLiSDkkXZPiUXzuOgQTLa4oTQx0wave/F
        wt+/exFM+xTjFZN7/6soS+Y=
X-Google-Smtp-Source: ABdhPJw70cQL9RwRdb0TjJA0U9Ge9uW6IgVQB+I5l2aZxt517RQCeRpFBcC0jPTZcKVMjXPxhy9U2g==
X-Received: by 2002:a17:906:600f:: with SMTP id o15mr2109973ejj.41.1597272114959;
        Wed, 12 Aug 2020 15:41:54 -0700 (PDT)
Received: from debian64.daheim (pd9e293b6.dip0.t-ipconnect.de. [217.226.147.182])
        by smtp.gmail.com with ESMTPSA id r3sm2416655ejy.95.2020.08.12.15.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:41:54 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
        (envelope-from <chunkeey@gmail.com>)
        id 1k5zRR-005oDV-Sc; Thu, 13 Aug 2020 00:41:53 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Cc:     Chris Blake <chrisrblake93@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v1 2/4] powerpc: apm82181: add WD MyBook Live NAS
Date:   Thu, 13 Aug 2020 00:41:51 +0200
Message-Id: <08dd11e8ce996a0df27dca3a9316bfc4ede0d0d0.1597271958.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <15a94dddc15d29bac02439beb77fd066771c747a.1597271958.git.chunkeey@gmail.com>
References: <cover.1597271958.git.chunkeey@gmail.com> <15a94dddc15d29bac02439beb77fd066771c747a.1597271958.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds the device-tree definitions for
Western Digital MyBook Live NAS devices.

Technically, this devicetree file is shared by two, very
similar devices.

There's the My Book Live and the My Book Live Duo. WD's uboot
on the device will enable/disable the nodes for the device.

Ready to go images and install instruction can be found @OpenWrt.org

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 arch/powerpc/boot/dts/wd-mybooklive.dts    | 199 +++++++++++++++++++++
 arch/powerpc/platforms/44x/ppc44x_simple.c |   3 +-
 2 files changed, 201 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/boot/dts/wd-mybooklive.dts

diff --git a/arch/powerpc/boot/dts/wd-mybooklive.dts b/arch/powerpc/boot/dts/wd-mybooklive.dts
new file mode 100644
index 000000000000..0871cc17bc9d
--- /dev/null
+++ b/arch/powerpc/boot/dts/wd-mybooklive.dts
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2008 DENX Software Engineering, Stefan Roese <sr@denx.de>
+ * (c) Copyright 2010 Western Digital Technologies, Inc. All Rights Reserved.
+ */
+
+/dts-v1/;
+
+#include "apm82181.dtsi"
+
+/ {
+	compatible = "wd,mybooklive";
+	model = "MyBook Live";
+
+	aliases {
+		serial0 = &UART0;
+	};
+};
+
+&POB0 {
+	ebc {
+		nor_flash@0,0 {
+			status = "okay";
+			compatible = "amd,s29gl512n", "jedec-probe", "cfi-flash", "mtd-rom";
+			bank-width = <1>;
+			reg = <0x00000000 0x00000000 0x00080000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				/* Part of bootrom - Don't use it without a jump */
+				label = "free";
+				reg = <0x00000000 0x0001e000>;
+			};
+
+			partition@1e000 {
+				label = "env";
+				reg = <0x0001e000 0x00002000>;
+			};
+
+			partition@20000 {
+				label = "uboot";
+				reg = <0x00020000 0x00050000>;
+			};
+		};
+	};
+
+	GPIO1: gpio@e0000000 {
+		compatible = "wd,mbl-gpio";
+		reg-names = "dat";
+		reg = <0xe0000000 0x1>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		enable-button {
+			/* Defined in u-boot as: NOT_NOR
+			 * "enables features other than NOR
+			 * specifically, the buffer at CS2"
+			 * (button).
+			 *
+			 * Note: This option is disabled as
+			 * it prevents the system from being
+			 * rebooted successfully.
+			 */
+
+			gpio-hog;
+			line-name = "Enable Reset Button, disable NOR";
+			gpios = <1 GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+	};
+
+	GPIO2: gpio@e0100000 {
+		compatible = "wd,mbl-gpio";
+		reg-names = "dat";
+		reg = <0xe0100000 0x1>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		no-output;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		failsafe: power-red {
+			label = "mbl:red:power";
+			gpios = <&GPIO1 4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "panic";
+		};
+
+		status: power-green {
+			label = "mbl:green:power";
+			gpios = <&GPIO1 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		power-blue {
+			label = "mbl:blue:power";
+			gpios = <&GPIO1 6 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "disk-activity";
+		};
+	};
+
+	keys {
+		compatible = "gpio-keys-polled";
+		poll-interval = <60>;	/* 3 * 20 = 60ms */
+		autorepeat;
+
+		reset-button {
+			label = "Reset button";
+			linux,code = <KEY_RESTART>;
+			gpios = <&GPIO2 2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	usbpwr: usb-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "Power USB Core";
+		gpios = <&GPIO1 2 GPIO_ACTIVE_LOW>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	sata1pwr: sata1-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "Power Drive Port 1";
+		gpios = <&GPIO1 3 GPIO_ACTIVE_LOW>;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on; /* needed to read OS from HDD */
+	};
+
+	sata0pwr: sata0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "Power Drive Port 0";
+		gpios = <&GPIO1 7 GPIO_ACTIVE_LOW>;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on; /* needed to read OS from HDD */
+	};
+};
+
+&EMAC0 {
+	status = "okay";
+
+	phy-map = <0x2>;
+	phy-address = <0x1>;
+	phy-handle = <&phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reset-gpios = <&GPIO1 0 GPIO_ACTIVE_LOW>;
+
+		phy: phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+		};
+	};
+};
+
+&CRYPTO {
+	status = "okay";
+};
+
+&PKA {
+	status = "okay";
+};
+
+&TRNG {
+	status = "okay";
+};
+
+&SATA0 {
+	status = "okay";
+
+	drive0: sata-port@0 {
+		reg = <0>;
+		#thermal-sensor-cells = <0>;
+	};
+};
+
+&SATA1 {
+	status = "okay";
+
+	drive1: sata-port@0 {
+		reg = <0>;
+		#thermal-sensor-cells = <0>;
+	};
+};
+
+&UART0 {
+	status = "okay";
+};
+
+&USBOTG0 {
+	status = "okay";
+	dr_mode = "host";
+	vbus-supply = <&usbpwr>;
+};
diff --git a/arch/powerpc/platforms/44x/ppc44x_simple.c b/arch/powerpc/platforms/44x/ppc44x_simple.c
index 3dbd8ddd734a..1122702c804a 100644
--- a/arch/powerpc/platforms/44x/ppc44x_simple.c
+++ b/arch/powerpc/platforms/44x/ppc44x_simple.c
@@ -59,7 +59,8 @@ static char *board[] __initdata = {
 	"amcc,sequoia",
 	"amcc,taishan",
 	"amcc,yosemite",
-	"mosaixtech,icon"
+	"mosaixtech,icon",
+	"wd,mybooklive",
 };
 
 static int __init ppc44x_probe(void)
-- 
2.28.0

