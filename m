From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH v2 7/9] ARM: dts: Add GPIO irq support to STM2F429
Date: Thu, 31 Mar 2016 17:09:37 +0200
Message-ID: <1459436979-17275-8-git-send-email-mcoquelin.stm32@gmail.com>
References: <1459436979-17275-1-git-send-email-mcoquelin.stm32@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1459436979-17275-1-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 1a189d44ad38..68247625a8d5 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -189,6 +189,8 @@
 			#size-cells = <1>;
 			compatible = "st,stm32f429-pinctrl";
 			ranges = <0 0x40020000 0x3000>;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&syscfg 0x8>;
 			pins-are-numbered;
 
 			gpioa: gpio@40020000 {
-- 
1.9.1

