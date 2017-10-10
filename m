From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 06/14] ARM: dts: at91: sama5d27_som1_ek: add pinmuxing for pwm0
Date: Tue, 10 Oct 2017 13:09:41 +0300
Message-ID: <1507630189-15504-7-git-send-email-claudiu.beznea@microchip.com>
References: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

Add pin muxing for pwm0 and set it as disabled since it is in conflict
with the pins for leds.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
index 6c4c976a99d1..339f4e71cf40 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
@@ -136,7 +136,9 @@
 			};
 
 			pwm0: pwm@f802c000 {
-				status = "okay";
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_mikrobus1_pwm &pinctrl_mikrobus2_pwm>;
+				status = "disabled"; /* Conflict with leds. */
 			};
 
 			flx1: flexcom@f8038000 {
@@ -529,7 +531,7 @@
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_led_gpio_default>;
-		status = "okay";
+		status = "okay"; /* Conflict with pwm0. */
 
 		red {
 			label = "red";
-- 
2.7.4
