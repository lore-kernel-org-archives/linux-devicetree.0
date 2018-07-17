From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2] ARM: dts: at91: fix typos for SSC TD functions
Date: Tue, 17 Jul 2018 17:03:53 +0300
Message-ID: <1531836233-31536-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ludovic.desroches@microchip.com, nicolas.ferre@microchip.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

Fix typo for TD function of pins PIN_PB22 and PIN_PC14

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---

Changes in v2:
- fix typo also for PC14 pin
- change patch subject to reflect new changes

 arch/arm/boot/dts/sama5d2-pinfunc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d2-pinfunc.h b/arch/arm/boot/dts/sama5d2-pinfunc.h
index e57191fb83de..1c01a6f843d8 100644
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
@@ -556,7 +556,7 @@
 #define PIN_PC14__LCDDAT6		PINMUX_PIN(PIN_PC14, 1, 2)
 #define PIN_PC14__GRX0			PINMUX_PIN(PIN_PC14, 2, 1)
 #define PIN_PC14__ISC_D5		PINMUX_PIN(PIN_PC14, 3, 1)
-#define PIN_PC14__TDO			PINMUX_PIN(PIN_PC14, 5, 2)
+#define PIN_PC14__TD0			PINMUX_PIN(PIN_PC14, 5, 2)
 #define PIN_PC14__A3			PINMUX_PIN(PIN_PC14, 6, 2)
 #define PIN_PC15			79
 #define PIN_PC15__GPIO			PINMUX_PIN(PIN_PC15, 0, 0)
-- 
2.7.4
