Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D177C5DF63
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 14:11:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3C1220663
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 14:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=emlid.com header.i=@emlid.com header.b="a3g/YqYK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbfKFOLo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 09:11:44 -0500
Received: from forward104p.mail.yandex.net ([77.88.28.107]:41171 "EHLO
        forward104p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727128AbfKFOLo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 09:11:44 -0500
X-Greylist: delayed 486 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Nov 2019 09:11:41 EST
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id BEB3A4B00696;
        Wed,  6 Nov 2019 17:03:33 +0300 (MSK)
Received: from mxback1q.mail.yandex.net (mxback1q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:25b3:aea5])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id B9C557080005;
        Wed,  6 Nov 2019 17:03:33 +0300 (MSK)
Received: from vla5-9cb0c276d29e.qloud-c.yandex.net (vla5-9cb0c276d29e.qloud-c.yandex.net [2a02:6b8:c18:3588:0:640:9cb0:c276])
        by mxback1q.mail.yandex.net (mxback/Yandex) with ESMTP id 4DUacILPQV-3X90rsIP;
        Wed, 06 Nov 2019 17:03:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlid.com; s=mail; t=1573049013;
        bh=OmAhseeN3vnoBo8Ldcq0zRK8mVkBBCYF6MIulTWghyA=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=a3g/YqYKr9CP0U8etdRXE/cB4xUrocShjL0zmbA+iMZhVa6hkXOKWfds+VsuiSGL1
         E5TdrK1dFsn8GKAt59pXPrsd8OyaCNVg7VtIOJv3Tsh+kjD5xz5wayxPVkRuN1VzTd
         6bxn9JiuraDqvpHYb26PseJHzWYFNszbm9ZBey/A=
Authentication-Results: mxback1q.mail.yandex.net; dkim=pass header.i=@emlid.com
Received: by vla5-9cb0c276d29e.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id S6vUK4L7IT-3W1uwhsR;
        Wed, 06 Nov 2019 17:03:32 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (Client certificate not present)
From:   Georgii Staroselskii <georgii.staroselskii@emlid.com>
To:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Georgii Staroselskii <georgii.staroselskii@emlid.com>
Subject: [PATCH 1/2] arm: dts: allwinner: Split out non-SoC specific parts of Neutis N5
Date:   Wed,  6 Nov 2019 17:03:17 +0300
Message-Id: <1573048998-8913-2-git-send-email-georgii.staroselskii@emlid.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573048998-8913-1-git-send-email-georgii.staroselskii@emlid.com>
References: <1573048998-8913-1-git-send-email-georgii.staroselskii@emlid.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

A new variant of Emlid Neutis has been inroduced. This one uses H3
instead of H5. The boards are essentially the same. This commit moves
non-SoC-specific parts out so that the common parts could be reused with
ease.

Signed-off-by: Georgii Staroselskii <georgii.staroselskii@emlid.com>
---
 arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi    | 181 +++++++++++++++++++++
 .../sun50i-h5-emlid-neutis-n5-devboard.dts         |  95 +----------
 .../dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi   |  64 +-------
 3 files changed, 186 insertions(+), 154 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi

diff --git a/arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi b/arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi
new file mode 100644
index 00000000..ecce01a
--- /dev/null
+++ b/arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * DTSI for Emlid Neutis SoMs.
+ *
+ * Copyright (C) 2019 Georgii Staroselskii <georgii.staroselskii@emlid.com>
+ */
+
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 */
+		post-power-on-delay-ms = <200>;
+		clocks = <&rtc 1>;
+		clock-names = "ext_clock";
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpux>;
+};
+
+&reg_usb0_vbus {
+	gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>;   /* PL9 */
+	status = "okay";
+};
+
+
+&de {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ohci2 {
+	status = "okay";
+};
+
+&ohci3 {
+	status = "okay";
+};
+
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ehci2 {
+	status = "okay";
+};
+
+&ehci3 {
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	status = "okay";
+};
+
+
+&mmc1 {
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 5 IRQ_TYPE_LEVEL_LOW>;	/* PL5 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_8bit_pins>;
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pa_pins>;
+	status = "okay";
+};
+
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&rtc 1>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_vcc3v3>;
+		vddio-supply = <&reg_vcc3v3>;
+		shutdown-gpios = <&pio 2 4 GPIO_ACTIVE_HIGH>; /* PC4 */
+		device-wakeup-gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
+	};
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
+	usb0_vbus-supply = <&reg_usb0_vbus>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&codec {
+	allwinner,audio-routing =
+		"Line Out", "LINEOUT",
+		"LINEIN", "Line In",
+		"MIC1", "Mic",
+		"MIC2", "Mic",
+		"Mic",  "MBIAS";
+};
+
+&i2c0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dts
index c924090..fb96d35 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dts
@@ -15,35 +15,6 @@
 		     "emlid,neutis-n5",
 		     "allwinner,sun50i-h5";
 
-	aliases {
-		serial0 = &uart0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	connector {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi_con_in: endpoint {
-				remote-endpoint = <&hdmi_out_con>;
-			};
-		};
-	};
-
-	reg_usb0_vbus: usb0-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "usb0-vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		enable-active-high;
-		gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>;   /* PL9 */
-		status = "okay";
-	};
-
 	vdd_cpux: gpio-regulator {
 		compatible = "regulator-gpio";
 		regulator-name = "vdd-cpux";
@@ -59,33 +30,11 @@
 	};
 };
 
-&codec {
-	allwinner,audio-routing =
-		"Line Out", "LINEOUT",
-		"LINEIN", "Line In",
-		"MIC1", "Mic",
-		"MIC2", "Mic",
-		"Mic",  "MBIAS";
-	status = "okay";
-};
-
-&de {
-	status = "okay";
-};
-
-&ehci0 {
-	status = "okay";
-};
-
-&ehci1 {
-	status = "okay";
-};
-
-&ehci2 {
-	status = "okay";
+&cpu0 {
+	cpu-supply = <&vdd_cpux>;
 };
 
-&ehci3 {
+&codec {
 	status = "okay";
 };
 
@@ -106,42 +55,6 @@
 	};
 };
 
-&mmc0 {
-	vmmc-supply = <&reg_vcc3v3>;
-	bus-width = <4>;
-	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
-	status = "okay";
-};
-
-&ohci0 {
-	status = "okay";
-};
-
-&ohci1 {
-	status = "okay";
-};
-
-&ohci2 {
-	status = "okay";
-};
-
-&ohci3 {
-	status = "okay";
-};
-
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_pa_pins>;
-	status = "okay";
-};
-
-&usb_otg {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&usbphy {
-	usb0_id_det-gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
-	usb0_vbus-supply = <&reg_usb0_vbus>;
+&i2c1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi
index 5bec574..7df7308 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi
@@ -8,66 +8,4 @@
 /dts-v1/;
 
 #include "sun50i-h5.dtsi"
-
-#include <dt-bindings/gpio/gpio.h>
-
-/ {
-	reg_vcc3v3: vcc3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc3v3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	wifi_pwrseq: wifi_pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 */
-		post-power-on-delay-ms = <200>;
-		clocks = <&rtc 1>;
-		clock-names = "ext_clock";
-	};
-};
-
-&mmc1 {
-	vmmc-supply = <&reg_vcc3v3>;
-	vqmmc-supply = <&reg_vcc3v3>;
-	mmc-pwrseq = <&wifi_pwrseq>;
-	bus-width = <4>;
-	non-removable;
-	status = "okay";
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-		interrupt-parent = <&r_pio>;
-		interrupts = <0 5 IRQ_TYPE_LEVEL_LOW>;	/* PL5 */
-		interrupt-names = "host-wake";
-	};
-};
-
-&mmc2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc2_8bit_pins>;
-	vmmc-supply = <&reg_vcc3v3>;
-	bus-width = <8>;
-	non-removable;
-	cap-mmc-hw-reset;
-	status = "okay";
-};
-
-&uart1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
-	uart-has-rtscts;
-	status = "okay";
-
-	bluetooth {
-		compatible = "brcm,bcm43438-bt";
-		clocks = <&rtc 1>;
-		clock-names = "lpo";
-		vbat-supply = <&reg_vcc3v3>;
-		vddio-supply = <&reg_vcc3v3>;
-		shutdown-gpios = <&pio 2 4 GPIO_ACTIVE_HIGH>; /* PC4 */
-		device-wakeup-gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
-	};
-};
+#include <arm/sunxi-h3-h5-emlid-neutis.dtsi>
-- 
2.7.4

