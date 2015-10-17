From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH v2 6/9] ARM: dts: Add pinctrl node to STM32F429
Date: Sat, 17 Oct 2015 19:23:21 +0200
Message-ID: <1445102604-11502-7-git-send-email-mcoquelin.stm32@gmail.com>
References: <1445102604-11502-1-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1445102604-11502-1-git-send-email-mcoquelin.stm32@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com, linux-kernel@vger.kernel.org, afaerber@suse.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The STM32F429 MCU has 11 GPIO banks, with 16 pins per bank.

Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 97 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index d78a481..9e6e75c 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -46,6 +46,7 @@
  */
 
 #include "armv7-m.dtsi"
+#include <dt-bindings/pinctrl/stm32f429-pinfunc.h>
 
 / {
 	clocks {
@@ -168,6 +169,102 @@
 			status = "disabled";
 		};
 
+		pin-controller {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "st,stm32f429-pinctrl";
+			ranges = <0 0x40020000 0x3000>;
+			pins-are-numbered;
+
+			gpioa: gpio@40020000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x0 0x400>;
+				clocks = <&rcc 0 256>;
+				st,bank-name = "GPIOA";
+			};
+
+			gpiob: gpio@40020400 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x400 0x400>;
+				clocks = <&rcc 0 257>;
+				st,bank-name = "GPIOB";
+			};
+
+			gpioc: gpio@40020800 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x800 0x400>;
+				clocks = <&rcc 0 258>;
+				st,bank-name = "GPIOC";
+			};
+
+			gpiod: gpio@40020c00 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0xc00 0x400>;
+				clocks = <&rcc 0 259>;
+				st,bank-name = "GPIOD";
+			};
+
+			gpioe: gpio@40021000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x1000 0x400>;
+				clocks = <&rcc 0 260>;
+				st,bank-name = "GPIOE";
+			};
+
+			gpiof: gpio@40021400 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x1400 0x400>;
+				clocks = <&rcc 0 261>;
+				st,bank-name = "GPIOF";
+			};
+
+			gpiog: gpio@40021800 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x1800 0x400>;
+				clocks = <&rcc 0 262>;
+				st,bank-name = "GPIOG";
+			};
+
+			gpioh: gpio@40021c00 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x1c00 0x400>;
+				clocks = <&rcc 0 263>;
+				st,bank-name = "GPIOH";
+			};
+
+			gpioi: gpio@40022000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x2000 0x400>;
+				clocks = <&rcc 0 264>;
+				st,bank-name = "GPIOI";
+			};
+
+			gpioj: gpio@40022400 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x2400 0x400>;
+				clocks = <&rcc 0 265>;
+				st,bank-name = "GPIOJ";
+			};
+
+			gpiok: gpio@40022800 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x2800 0x400>;
+				clocks = <&rcc 0 266>;
+				st,bank-name = "GPIOK";
+			};
+		};
+
 		rcc: rcc@40023810 {
 			#clock-cells = <2>;
 			compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
-- 
1.9.1
