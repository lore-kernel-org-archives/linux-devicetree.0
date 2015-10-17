From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH 7/9] ARM: dts: Add GPIO irq support to STM2F429
Date: Sat, 17 Oct 2015 19:23:56 +0200
Message-ID: <1445102638-11575-8-git-send-email-mcoquelin.stm32@gmail.com>
References: <1445102638-11575-1-git-send-email-mcoquelin.stm32@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445102638-11575-1-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, afaerber@suse.de, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index a2c3aaa..bc84e8b 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -169,6 +169,11 @@
 			status = "disabled";
 		};
 
+		syscfg: system-config@40013800 {
+			compatible = "syscon";
+			reg = <0x40013800 0x400>;
+		};
+
 		exti: interrupt-controller@40013c00 {
 			compatible = "st,stm32-exti";
 			interrupt-controller;
@@ -182,6 +187,8 @@
 			#size-cells = <1>;
 			compatible = "st,stm32f429-pinctrl";
 			ranges = <0 0x40020000 0x3000>;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&syscfg 0x8>;
 			pins-are-numbered;
 
 			gpioa: gpio@40020000 {
-- 
1.9.1
