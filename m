From: Tim Kryger <tim.kryger@linaro.org>
Subject: [RESEND PATCH] ARM: dts: bcm28155-ap: Fix Card Detection GPIO
Date: Thu, 5 Dec 2013 13:51:44 -0800
Message-ID: <1386280304-4227-1-git-send-email-tim.kryger@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Daudt <bcm@fixthebug.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Tim Kryger <tim.kryger@linaro.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, Device Tree List <devicetree@vger.kernel.org>, Linux Arm Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linaro Patches <patches@linaro.org>
List-Id: devicetree@vger.kernel.org

The board schematic states that the "SD_CARD_DET_N gets pulled to GND
when card is inserted" so the polarity has been updated to active low.

Polarity is now specified with a GPIO define instead of a magic number.

Signed-off-by: Tim Kryger <tim.kryger@linaro.org>
Reviewed-by: Matt Porter <matt.porter@linaro.org>
---
 arch/arm/boot/dts/bcm28155-ap.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm28155-ap.dts b/arch/arm/boot/dts/bcm28155-ap.dts
index 08e47c2..27dd110 100644
--- a/arch/arm/boot/dts/bcm28155-ap.dts
+++ b/arch/arm/boot/dts/bcm28155-ap.dts
@@ -13,6 +13,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "bcm11351.dtsi"
 
 / {
@@ -40,7 +42,7 @@
 
 	sdio4: sdio@3f1b0000 {
 		max-frequency = <48000000>;
-		cd-gpios = <&gpio 14 0>;
+		cd-gpios = <&gpio 14 GPIO_ACTIVE_LOW>;
 		status = "okay";
 	};
 };
-- 
1.8.0.1
