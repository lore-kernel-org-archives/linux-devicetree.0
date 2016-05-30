From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 4/4] ARM: dts: amlogic: Enable Reset Controller on Meson8b platforms
Date: Mon, 30 May 2016 15:27:18 +0200
Message-ID: <1464614838-28107-5-git-send-email-narmstrong@baylibre.com>
References: <1464614838-28107-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464614838-28107-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, xing.xu@amlogic.com, victor.wan@amlogic.com, jerry.cao@amlogic.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update DTSI file to add the reset controller node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 2bfe401..fc4080d 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -46,6 +46,7 @@
 
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8b-gpio.h>
+#include <dt-bindings/reset/amlogic,meson8b-reset.h>
 #include "skeleton.dtsi"
 
 / {
@@ -105,6 +106,12 @@
 			#interrupt-cells = <3>;
 		};
 
+		reset: reset-controller@c1104404 {
+			compatible = "amlogic,meson8b-reset";
+			reg = <0xc1104404 0x20>;
+			#reset-cells = <1>;
+		};
+
 		wdt: watchdog@c1109900 {
 			compatible = "amlogic,meson8b-wdt";
 			reg = <0xc1109900 0x8>;
-- 
2.7.0
