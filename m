From: Pramod Gurav <pramod.gurav@smartplayin.com>
Subject: [PATCH v2] ARM: DT: apq8064: Add Support for SD Card Detect for ifc6410 board
Date: Tue, 21 Oct 2014 11:23:19 +0530
Message-ID: <1413870799-8608-1-git-send-email-pramod.gurav@smartplayin.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This changes muxes in gpio26 pin to function as gpio and adds support
for sd card detect for apq8064 based IFC6410 board.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
---

Changes since v2:
 - Replaced hardcode value with GPIO_ACTIVE_LOW

 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index b396c83..e641001 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -1,4 +1,5 @@
 #include "qcom-apq8064-v2.0.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm APQ8064/IFC6410";
@@ -12,6 +13,14 @@
 					function = "gsbi1";
 				};
 			};
+
+			card_detect: card_detect {
+				mux {
+					pins = "gpio26";
+					function = "gpio";
+					bias-disable;
+				};
+			};
 		};
 
 		gsbi@12440000 {
@@ -49,6 +58,9 @@
 			/* External micro SD card */
 			sdcc3: sdcc@12180000 {
 				status = "okay";
+				pinctrl-names	= "default";
+				pinctrl-0	= <&card_detect>;
+				cd-gpios	= <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
 			};
 			/* WLAN */
 			sdcc4: sdcc@121c0000 {
-- 
1.7.9.5
