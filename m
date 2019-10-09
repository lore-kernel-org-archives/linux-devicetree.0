From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 1/2] ARM: dts: stm32: Add DAC pins used on stm32mp157c-ed1
Date: Wed, 9 Oct 2019 16:12:51 +0200
Message-ID: <1570630372-24579-2-git-send-email-fabrice.gasnier@st.com>
References: <1570630372-24579-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570630372-24579-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

Define pins that can be used by digital-to-analog converter on
stm32mp157c eval daughter board:
- PA4 and PA5 pins are available respectively on JP11 and JP10

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index eeb60d0..1e45b75 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -183,6 +183,18 @@
 				};
 			};
 
+			dac_ch1_pins_a: dac-ch1 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 4, ANALOG)>;
+				};
+			};
+
+			dac_ch2_pins_a: dac-ch2 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 5, ANALOG)>;
+				};
+			};
+
 			dcmi_pins_a: dcmi-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 8,  AF13)>,/* DCMI_HSYNC */
-- 
2.7.4
