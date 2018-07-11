From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH] ARM: dts: at91: fix typo for PIN_PB22
Date: Wed, 11 Jul 2018 19:25:37 +0300
Message-ID: <1531326337-15504-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

Fix typo for PIN_PB22 on TD function.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/sama5d2-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama5d2-pinfunc.h b/arch/arm/boot/dts/sama5d2-pinfunc.h
index e57191fb83de..ac61491c9d7f 100644
--- a/arch/arm/boot/dts/sama5d2-pinfunc.h
+++ b/arch/arm/boot/dts/sama5d2-pinfunc.h
@@ -375,7 +375,7 @@
 #define PIN_PB22__GPIO			PINMUX_PIN(PIN_PB22, 0, 0)
 #define PIN_PB22__LCDDAT11		PINMUX_PIN(PIN_PB22, 1, 1)
 #define PIN_PB22__A11			PINMUX_PIN(PIN_PB22, 2, 1)
-#define PIN_PB22__TDO			PINMUX_PIN(PIN_PB22, 3, 1)
+#define PIN_PB22__TD0			PINMUX_PIN(PIN_PB22, 3, 1)
 #define PIN_PB22__TIOA2			PINMUX_PIN(PIN_PB22, 4, 2)
 #define PIN_PB22__FLEXCOM3_IO1		PINMUX_PIN(PIN_PB22, 5, 3)
 #define PIN_PB22__GMDC			PINMUX_PIN(PIN_PB22, 6, 3)
-- 
2.7.4
