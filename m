From: Edward Cragg <edward.cragg@codethink.co.uk>
Subject: [PATCH v2] ARM: meson: Add status LED for Odroid-C1
Date: Wed,  4 Nov 2015 12:17:20 +0000
Message-ID: <1446639440-4057-1-git-send-email-edward.cragg@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ct173-kernel-internal@lists.codethink.co.uk
List-Id: devicetree@vger.kernel.org

Add the blue status LED to the Hardkernel Odroid C1 board DTS.

Signed-off-by: <edward.cragg@codethink.co.uk>
---

Changes in v2:
    - Remove additional copyright

 arch/arm/boot/dts/meson8b-odroidc1.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 88669a7..1f03406 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -1,6 +1,7 @@
 /*
  * Copyright 2015 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
+ * Author: Edward Cragg <edward.cragg@codethink.co.uk>
  *
  * This file is dual-licensed: you can use it either under the terms
  * of the GPL or the X11 license, at your option. Note that this dual
@@ -46,6 +47,7 @@
 
 /dts-v1/;
 #include "meson8b.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Hardkernel ODROID-C1";
@@ -58,6 +60,16 @@
 	memory {
 		reg = <0x40000000 0x40000000>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		blue {
+			label = "c1:blue:alive";
+			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+	};
 };
 
 &mmc0 {
-- 
2.6.1
