Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BE8C5DF64
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 14:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 832932067B
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 14:09:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=emlid.com header.i=@emlid.com header.b="DC45EuzO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfKFOJ4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 09:09:56 -0500
Received: from forward104o.mail.yandex.net ([37.140.190.179]:53760 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727958AbfKFOJz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 09:09:55 -0500
X-Greylist: delayed 375 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Nov 2019 09:09:53 EST
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id 2EF16940E5E;
        Wed,  6 Nov 2019 17:03:37 +0300 (MSK)
Received: from mxback1q.mail.yandex.net (mxback1q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:25b3:aea5])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id 2987B61E0015;
        Wed,  6 Nov 2019 17:03:37 +0300 (MSK)
Received: from vla5-9cb0c276d29e.qloud-c.yandex.net (vla5-9cb0c276d29e.qloud-c.yandex.net [2a02:6b8:c18:3588:0:640:9cb0:c276])
        by mxback1q.mail.yandex.net (mxback/Yandex) with ESMTP id A4fqlvflAd-3b9GUHV2;
        Wed, 06 Nov 2019 17:03:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlid.com; s=mail; t=1573049017;
        bh=ScFPaG9UQrYGGId0CvVB3OieD16A0ZI82rTOVQODVyQ=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=DC45EuzOlPIlokiiMZn/+dHC1b+mNEFTBDYZidgPiezS0MKNzcapsL7LXUmPYb1Bh
         Bb5CXRKKntwIfRjeC113J8Okw8m95+fdwLV17fjhlBeyN4Xrf1qBVrmWH4xGfxgzhL
         QooPnJDD8MtBUuxqvgJ4mvnGbReZHqmxudONg9xU=
Authentication-Results: mxback1q.mail.yandex.net; dkim=pass header.i=@emlid.com
Received: by vla5-9cb0c276d29e.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id S6vUK4L7IT-3a1uKwYa;
        Wed, 06 Nov 2019 17:03:36 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (Client certificate not present)
From:   Georgii Staroselskii <georgii.staroselskii@emlid.com>
To:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Georgii Staroselskii <georgii.staroselskii@emlid.com>
Subject: [PATCH 2/2] arm: dts: sunxi: Add Neutis N5H3 support
Date:   Wed,  6 Nov 2019 17:03:18 +0300
Message-Id: <1573048998-8913-3-git-send-email-georgii.staroselskii@emlid.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573048998-8913-1-git-send-email-georgii.staroselskii@emlid.com>
References: <1573048998-8913-1-git-send-email-georgii.staroselskii@emlid.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Emlid Neutis N5H3 is a version of Emlid Neutis SoM with H3 instead of H5
inside.

6eeb4180d4b9 ("ARM: dts: sunxi: h3-h5: Add Bananapi M2+ v1.2 device")
was used as reference.

Signed-off-by: Georgii Staroselskii <georgii.staroselskii@emlid.com>
---
 arch/arm/boot/dts/Makefile                         |  1 +
 .../dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts    | 61 ++++++++++++++++++++++
 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi  | 11 ++++
 3 files changed, 73 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts
 create mode 100644 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 3f13b88..c997b0c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1119,6 +1119,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-h3-orangepi-plus2e.dtb \
 	sun8i-h3-orangepi-zero-plus2.dtb \
 	sun8i-h3-rervision-dvk.dtb \
+	sun8i-h3-emlid-neutis-n5h3-devboard.dtb \
 	sun8i-r16-bananapi-m2m.dtb \
 	sun8i-r16-nintendo-nes-classic.dtb \
 	sun8i-r16-nintendo-super-nes-classic.dtb \
diff --git a/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts b/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts
new file mode 100644
index 00000000..3b68750
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * DTS for Emlid Neutis N5 Dev board.
+ *
+ * Copyright (C) 2019 Georgii Staroselskii <georgiii.staroselskii@emlid.com>
+ */
+
+/dts-v1/;
+
+#include "sun8i-h3-emlid-neutis-n5h3.dtsi"
+
+/ {
+	model = "Emlid Neutis N5H3 Developer board";
+	compatible = "emlid,neutis-n5h3-devboard",
+		     "emlid,neutis-n5h3",
+		     "allwinner,sun8i-h3";
+
+	vdd_cpux: gpio-regulator {
+		compatible = "regulator-gpio";
+		regulator-name = "vdd-cpux";
+		regulator-type = "voltage";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1300000>;
+		regulator-ramp-delay = <50>; /* 4ms */
+		gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		gpios-states = <0x1>;
+		states = <1100000 0x0
+			  1300000 0x1>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpux>;
+};
+
+&codec {
+	status = "okay";
+};
+
+&emac {
+	phy-handle = <&int_mii_phy>;
+	phy-mode = "mii";
+	allwinner,leds-active-low;
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi b/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
new file mode 100644
index 00000000..eedd5da
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * DTSI for Emlid Neutis N5 SoM.
+ *
+ * Copyright (C) 2019 Georgii Staroselskii <georgii.staroselskii@emlid.com>
+ */
+
+/dts-v1/;
+
+#include "sun8i-h3.dtsi"
+#include <arm/sunxi-h3-h5-emlid-neutis.dtsi>
-- 
2.7.4

