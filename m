From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: genmai: Correct primary compatible value for eeprom
Date: Thu, 16 Nov 2017 14:51:36 +0100
Message-ID: <1510840296-12767-3-git-send-email-geert+renesas@glider.be>
References: <1510840296-12767-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1510840296-12767-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The Renesas part number of the two-wire serial interface EEPROM is not
24C128, but R1EX24128ASA00A.

Hence change its primary compatible value to "renesas,r1ex24128".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index cd4d5ff7749eaf53..5af2a0116ff2689a 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -123,7 +123,7 @@
 	pinctrl-0 = <&i2c2_pins>;
 
 	eeprom@50 {
-		compatible = "renesas,24c128", "atmel,24c128";
+		compatible = "renesas,r1ex24128", "atmel,24c128";
 		reg = <0x50>;
 		pagesize = <64>;
 	};
-- 
2.7.4
