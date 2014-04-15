From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: armadillo-reference dts: Seiko Instruments, Inc is "sii"
Date: Tue, 15 Apr 2014 14:51:50 +0200
Message-ID: <1397566310-24055-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Ulrich Hecht <ulrich.hecht@gmail.com>, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Use "sii,s35390a" instead of "seiko,s35390a", cfr.
Documentation/devicetree/bindings/i2c/trivial-devices.txt and
Documentation/devicetree/bindings/vendor-prefixes.txt.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/r8a7740-armadillo800eva-reference.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
index 0cb235a450b9..10344e6edd20 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
@@ -180,7 +180,7 @@
 &i2c2 {
 	status = "okay";
 	rtc@30 {
-		compatible = "seiko,s35390a";
+		compatible = "sii,s35390a";
 		reg = <0x30>;
 	};
 };
-- 
1.7.9.5

