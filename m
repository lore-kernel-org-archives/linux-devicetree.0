From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH] ARM: dts: stm32: add DFSDM pins to stm32mp157c
Date: Thu, 1 Aug 2019 09:46:07 +0200
Message-ID: <1564645567-13156-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

Add DFSDM pins to stm32mp157c.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 9eaec9bf8cb8..f96a928cbc49 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -230,6 +230,45 @@
 				};
 			};
 
+			dfsdm_clkout_pins_a: dfsdm-clkout-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 13, AF3)>; /* DFSDM_CKOUT */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+			};
+
+			dfsdm_clkout_sleep_pins_a: dfsdm-clkout-sleep-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 13, ANALOG)>; /* DFSDM_CKOUT */
+				};
+			};
+
+			dfsdm_data1_pins_a: dfsdm-data1-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 3, AF3)>; /* DFSDM_DATA1 */
+				};
+			};
+
+			dfsdm_data1_sleep_pins_a: dfsdm-data1-sleep-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 3, ANALOG)>; /* DFSDM_DATA1 */
+				};
+			};
+
+			dfsdm_data3_pins_a: dfsdm-data3-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 13, AF6)>; /* DFSDM_DATA3 */
+				};
+			};
+
+			dfsdm_data3_sleep_pins_a: dfsdm-data3-sleep-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 13, ANALOG)>; /* DFSDM_DATA3 */
+				};
+			};
+
 			ethernet0_rgmii_pins_a: rgmii-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
-- 
2.7.4
