From: <patrice.chotard@st.com>
Subject: [PATCH 1/6] ARM: dts: stm32: Add sdio pins definition for stm32f7
Date: Thu, 1 Mar 2018 10:43:36 +0100
Message-ID: <1519897421-23803-2-git-send-email-patrice.chotard@st.com>
References: <1519897421-23803-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519897421-23803-1-git-send-email-patrice.chotard@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com, lee.jones@linaro.org
Cc: Patrice Chotard <patrice.chotard@st.com>, mcoquelin.stm32@gmail.com
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

Add sdio pins definition for the 2 sdio instances embeds in stm32f746.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 62 ++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
index f518de184e52..fb40f0835dd4 100644
--- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
@@ -222,6 +222,68 @@
 					slew-rate = <2>;
 				};
 			};
+
+			sdio_pins: sdio_pins@0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1 D0 */
+						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1 D1 */
+						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1 D2 */
+						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1 D3 */
+						 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1 CLK */
+						 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1 CMD */
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+
+			sdio_pins_od: sdio_pins_od@0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1 D0 */
+						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1 D1 */
+						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1 D2 */
+						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1 D3 */
+						 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1 CLK */
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+
+				pins2 {
+					pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1 CMD */
+					drive-open-drain;
+					slew-rate = <2>;
+				};
+			};
+
+			sdio_pins_b: sdio_pins_b@0 {
+				pins {
+					pinmux = <STM32_PINMUX('G', 9, AF11)>, /* SDMMC2 D0 */
+						 <STM32_PINMUX('G', 10, AF11)>, /* SDMMC2 D1 */
+						 <STM32_PINMUX('B', 3, AF10)>, /* SDMMC2 D2 */
+						 <STM32_PINMUX('B', 4, AF10)>, /* SDMMC2 D3 */
+						 <STM32_PINMUX('D', 6, AF11)>, /* SDMMC2 CLK */
+						 <STM32_PINMUX('D', 7, AF11)>; /* SDMMC2 CMD */
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+
+			sdio_pins_od_b: sdio_pins_od_b@0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('G', 9, AF11)>, /* SDMMC2 D0 */
+						 <STM32_PINMUX('G', 10, AF11)>, /* SDMMC2 D1 */
+						 <STM32_PINMUX('B', 3, AF10)>, /* SDMMC2 D2 */
+						 <STM32_PINMUX('B', 4, AF10)>, /* SDMMC2 D3 */
+						 <STM32_PINMUX('D', 6, AF11)>; /* SDMMC2 CLK */
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+
+				pins2 {
+					pinmux = <STM32_PINMUX('D', 7, AF11)>; /* SDMMC2 CMD */
+					drive-open-drain;
+					slew-rate = <2>;
+				};
+			};
 		};
 	};
 };
-- 
1.9.1
