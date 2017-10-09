From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 06/15] ARM: dts: at91: sama5d27_som1_ek: add pinmuxing for pwm0
Date: Mon, 9 Oct 2017 19:09:28 +0300
Message-ID: <1507565377-1545-7-git-send-email-claudiu.beznea@microchip.com>
References: <1507565377-1545-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1507565377-1545-1-git-send-email-claudiu.beznea@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
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
