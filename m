Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CD4C352A3
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 11:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52A7221741
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 11:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbgBFLdn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 06:33:43 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:37600 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgBFLdn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Feb 2020 06:33:43 -0500
Received: from [5.158.153.53] (helo=adam.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <bage@linutronix.de>)
        id 1izfPg-0001yw-VP; Thu, 06 Feb 2020 12:33:41 +0100
From:   bage@linutronix.de
To:     devicetree@vger.kernel.org
Cc:     Bastian Germann <bage@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Benedikt Spranger <b.spranger@linutronix.de>
Subject: [PATCH 5/5] ARM: dts: sun7i: Add Linutronix Testbox v2 board
Date:   Thu,  6 Feb 2020 12:33:27 +0100
Message-Id: <20200206113328.7296-6-bage@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200206113328.7296-1-bage@linutronix.de>
References: <20200206113328.7296-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

The Testbox board is an open hardware enhancement for the Lamobo R1 router
board.  The Testbox board is used in the CI-RT project to manage devices
under test (https://ci-rt.linutronix.de).

The hardware project is located at https://github.com/ci-rt/testbox-shield

The Testbox v2 expands the Lamobo R1 router board with
- a power supply,
- a CAN bus PHY,
- a power control,
- a relay,
- a I2C EEPROM,
- a secure key storage (ATECC608a) and
- two RS232 compliant serial ports.

Co-developed-by: Benedikt Spranger <b.spranger@linutronix.de>
Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 arch/arm/boot/dts/sun7i-a20-lx-testbox-v2.dts | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-lx-testbox-v2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 08011dc8c7a6..383541842695 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1069,6 +1069,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
 	sun7i-a20-i12-tvbox.dtb \
 	sun7i-a20-icnova-swac.dtb \
 	sun7i-a20-lamobo-r1.dtb \
+	sun7i-a20-lx-testbox-v2.dtb \
 	sun7i-a20-m3.dtb \
 	sun7i-a20-mk808c.dtb \
 	sun7i-a20-olimex-som-evb.dtb \
diff --git a/arch/arm/boot/dts/sun7i-a20-lx-testbox-v2.dts b/arch/arm/boot/dts/sun7i-a20-lx-testbox-v2.dts
new file mode 100644
index 000000000000..3b91fb026a92
--- /dev/null
+++ b/arch/arm/boot/dts/sun7i-a20-lx-testbox-v2.dts
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2020 Linutronix GmbH
+ * Author: Benedikt Spranger <b.spranger@linutronix.de>
+ */
+
+/dts-v1/;
+#include "sun7i-a20-lamobo-r1-common.dtsi"
+
+/ {
+	model = "Lamobo R1";
+	compatible = "lx,testbox-v2", "lamobo,lamobo-r1", "allwinner,sun7i-a20";
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins_lamobo_r1>;
+
+		led-green {
+			label = "lamobo_r1:green:usr";
+			gpios = <&pio 7 24 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-opto1 {
+			label = "lamobo_r1:opto:powerswitch";
+			gpios = <&pio 7 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-opto2 {
+			label = "lamobo_r1:opto:relay";
+			gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		status = "okay";
+	};
+
+	atecc508a@60 {
+		compatible = "atmel,atecc508a";
+		reg = <0x60>;
+	};
+};
+
+&pio {
+	led_pins_lamobo_r1: led-pins {
+		pins = "PH3", "PH5", "PH24";
+		function = "gpio_out";
+		drive-strength = <40>;
+		bias-disable;
+	};
+};
+
+&can0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can_ph_pins>;
+	status = "okay";
+};
-- 
2.20.1

