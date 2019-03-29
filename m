From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH v1 2/2] ARM: dts: stm32: add sleep pinctrl for cec on stm32mp157c
Date: Fri, 29 Mar 2019 13:41:55 +0100
Message-ID: <1553863315-6652-3-git-send-email-yannick.fertre@st.com>
References: <1553863315-6652-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553863315-6652-1-git-send-email-yannick.fertre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>
List-Id: devicetree@vger.kernel.org

Add sleep pinctrl for cec on stm32mp157c

Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 54fe2ad..4886a89 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -157,6 +157,12 @@
 				};
 			};
 
+			cec_pins_sleep_a: cec-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* HDMI_CEC */
+				};
+			};
+
 			cec_pins_b: cec-1 {
 				pins {
 					pinmux = <STM32_PINMUX('B', 6, AF5)>;
@@ -166,6 +172,12 @@
 				};
 			};
 
+			cec_pins_sleep_b: cec-sleep-1 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 6, ANALOG)>; /* HDMI_CEC */
+				};
+			};
+
 			ethernet0_rgmii_pins_a: rgmii-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
-- 
2.7.4
