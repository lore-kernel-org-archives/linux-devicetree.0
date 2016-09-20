From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH v6 4/4] ARM: dts: Add EXTI controller node to stm32f429
Date: Tue, 20 Sep 2016 18:00:59 +0200
Message-ID: <1474387259-18926-5-git-send-email-alexandre.torgue@st.com>
References: <1474387259-18926-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474387259-18926-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 35df462..1a189d4 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -176,6 +176,14 @@
 			reg = <0x40013800 0x400>;
 		};
 
+		exti: interrupt-controller@40013c00 {
+			compatible = "st,stm32-exti";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			reg = <0x40013C00 0x400>;
+			interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
+		};
+
 		pin-controller {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
1.9.1
