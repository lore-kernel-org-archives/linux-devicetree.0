From: Helen Koike <helen.koike@collabora.com>
Subject: [PATCH] ARM: dts: bcm283x: Fix hdmi hpd gpio pull
Date: Mon,  4 Mar 2019 18:48:37 -0300
Message-ID: <20190304214837.9045-1-helen.koike@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: eric@anholt.net
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stefan.wahren@i2se.com, linus.walleij@linaro.org, lkundrak@v3.sk, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

Raspberry pi board model B revison 2 have the hot plug detector gpio
active high (and not low as it was in the dts).

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
index 5641d162dfdb..28e7513ce617 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
@@ -93,7 +93,7 @@
 };
 
 &hdmi {
-	hpd-gpios = <&gpio 46 GPIO_ACTIVE_LOW>;
+	hpd-gpios = <&gpio 46 GPIO_ACTIVE_HIGH>;
 };
 
 &pwm {
-- 
2.20.1
