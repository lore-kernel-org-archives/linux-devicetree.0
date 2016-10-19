From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 9/9] ARM: dts: amlogic: enable gpio interrupt controller on
 meson8
Date: Wed, 19 Oct 2016 12:08:29 +0200
Message-ID: <1476871709-8359-10-git-send-email-jbrunet@baylibre.com>
References: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm/boot/dts/meson8.dtsi  | 11 +++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 45619f6162c5..713a22456ff1 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -43,6 +43,8 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/meson8-gpio.h>
 /include/ "meson.dtsi"
 
@@ -91,6 +93,13 @@
 		clock-frequency = <141666666>;
 	};
 
+	gpio_interrupt: interrupt-controller@c1109880 {
+		compatible = "amlogic,meson8-gpio-intc";
+		reg = <0xc1109880 0x10>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
 	pinctrl_cbus: pinctrl@c1109880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0xc1109880 0x10>;
@@ -106,6 +115,7 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-parent = <&gpio_interrupt>;
 		};
 
 		spi_nor_pins: nor {
@@ -148,6 +158,7 @@
 			reg-names = "mux", "pull", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-parent = <&gpio_interrupt>;
 		};
 
 		uart_ao_a_pins: uart_ao_a {
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 41fd53671859..36a239a645f5 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -44,6 +44,8 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8b-gpio.h>
 #include <dt-bindings/reset/amlogic,meson8b-reset.h>
@@ -183,6 +185,13 @@
 			status = "disabled";
 		};
 
+		gpio_interrupt: interrupt-controller@c1109880 {
+			compatible = "amlogic,meson8b-gpio-intc";
+			reg = <0xc1109880 0x10>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		pinctrl_cbus: pinctrl@c1109880 {
 			compatible = "amlogic,meson8b-cbus-pinctrl";
 			reg = <0xc1109880 0x10>;
@@ -198,6 +207,7 @@
 				reg-names = "mux", "pull", "pull-enable", "gpio";
 				gpio-controller;
 				#gpio-cells = <2>;
+				interrupt-parent = <&gpio_interrupt>;
 			};
 		};
 
@@ -215,6 +225,7 @@
 				reg-names = "mux", "pull", "gpio";
 				gpio-controller;
 				#gpio-cells = <2>;
+				interrupt-parent = <&gpio_interrupt>;
 			};
 
 			uart_ao_a_pins: uart_ao_a {
-- 
2.7.4
