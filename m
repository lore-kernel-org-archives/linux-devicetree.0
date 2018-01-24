From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] ARM: dts: use 'atmel' as at24 manufacturer for at91-sama5d2_ptc_ek
Date: Wed, 24 Jan 2018 22:26:56 +0100
Message-ID: <20180124212656.4072-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: devicetree@vger.kernel.org

Using compatible strings without the <manufacturer> part for at24 is
now deprecated. Use a correct 'atmel,<model>' value.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts b/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
index e603a267bdf1..b10dccd0958f 100644
--- a/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
@@ -230,7 +230,7 @@
 				status = "okay";
 
 				at24@50 {
-					compatible = "24c02";
+					compatible = "atmel,24c02";
 					reg = <0x50>;
 					pagesize = <8>;
 				};
-- 
2.16.1
