From: Erwan Le Ray <erwan.leray@st.com>
Subject: [PATCH] ARM: dts: stm32: fix -Wall W=1 compilation warnings for can1_sleep pinctrl
Date: Mon, 1 Jul 2019 11:18:06 +0200
Message-ID: <1561972686-23281-1-git-send-email-erwan.leray@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, erwan.leray@st.com, bich.hemon@st.com
List-Id: devicetree@vger.kernel.org

Fix compilations warnings detected by -Wall W=1 compilation option:
- node has a unit name, but no reg property

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 140a983..ce98fd8 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -427,7 +427,7 @@
 				};
 			};
 
-			m_can1_sleep_pins_a: m_can1-sleep@0 {
+			m_can1_sleep_pins_a: m_can1-sleep-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
 						 <STM32_PINMUX('I', 9, ANALOG)>; /* CAN1_RX */
-- 
1.9.1
