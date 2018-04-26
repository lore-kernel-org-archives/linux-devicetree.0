From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH 11/11] ARM: dts: stm32: add exti support to stm32mp157 pinctrl
Date: Thu, 26 Apr 2018 18:18:34 +0200
Message-ID: <1524759514-12392-12-git-send-email-ludovic.Barre@st.com>
References: <1524759514-12392-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524759514-12392-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Gerald BAEZA <gerald.baeza@st.com>, Loic PALLARDY <loic.pallardy@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch adds support of external interrupt for
gpio[a..k], gpioz

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 6f044100..2f6872b 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -12,6 +12,8 @@
 			#size-cells = <1>;
 			compatible = "st,stm32mp157-pinctrl";
 			ranges = <0 0x50002000 0xa400>;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&exti 0x60 0xff>;
 			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
@@ -166,6 +168,8 @@
 			compatible = "st,stm32mp157-z-pinctrl";
 			ranges = <0 0x54004000 0x400>;
 			pins-are-numbered;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&exti 0x60 0xff>;
 			status = "disabled";
 
 			gpioz: gpio@54004000 {
-- 
2.7.4
