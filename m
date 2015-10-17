From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH 8/9] ARM: dts: Declare push button as GPIO key on stm32f429 Disco board
Date: Sat, 17 Oct 2015 19:23:57 +0200
Message-ID: <1445102638-11575-9-git-send-email-mcoquelin.stm32@gmail.com>
References: <1445102638-11575-1-git-send-email-mcoquelin.stm32@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445102638-11575-1-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, afaerber@suse.de, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
---
 arch/arm/boot/dts/stm32429i-eval.dts  | 19 +++++++++++++++++++
 arch/arm/boot/dts/stm32f429-disco.dts | 13 +++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 71fe17a..be21931 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -47,6 +47,7 @@
 
 /dts-v1/;
 #include "stm32f429.dtsi"
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "STMicroelectronics STM32429i-EVAL board";
@@ -64,6 +65,24 @@
 	aliases {
 		serial0 = &usart1;
 	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+		button@0 {
+			label = "Wake up";
+			linux,code = <KEY_WAKEUP>;
+			gpios = <&gpioa 0 0>;
+		};
+		button@1 {
+			label = "Tamper";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpioc 13 0>;
+		};
+
+	};
 };
 
 &clk_hse {
diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 532c499..2cb4c9e 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -47,6 +47,7 @@
 
 /dts-v1/;
 #include "stm32f429.dtsi"
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "STMicroelectronics STM32F429i-DISCO board";
@@ -74,6 +75,18 @@
 			gpios = <&gpiog 13 0>;
 		};
 	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+		button@0 {
+			label = "User";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpioa 0 0>;
+		};
+	};
 };
 
 &clk_hse {
-- 
1.9.1
