From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 5/6] ARM: dts: stm32f429: Add adc support
Date: Thu, 10 Nov 2016 17:18:57 +0100
Message-ID: <1478794738-28933-6-git-send-email-fabrice.gasnier@st.com>
References: <1478794738-28933-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1478794738-28933-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, lars@metafoo.de, alexandre.torgue@st.com, pmeerw@pmeerw.net, linux@armlinux.org.uk, robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, lee.jones@linaro.org, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

Add adc support & pinctrl analog phandle (adc3_in8) to stm32f429.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 49 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 336ee4f..f198132 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -172,6 +172,49 @@
 			status = "disabled";
 		};
 
+		adc: adc@40012000 {
+			compatible = "st,stm32f4-adc-core";
+			reg = <0x40012000 0x400>;
+			interrupts = <18>;
+			clocks = <&rcc 0 168>;
+			clock-names = "adc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			adc1: adc@0 {
+				compatible = "st,stm32f4-adc";
+				#io-channel-cells = <1>;
+				reg = <0x0>;
+				clocks = <&rcc 0 168>;
+				interrupt-parent = <&adc>;
+				interrupts = <0>;
+				status = "disabled";
+			};
+
+			adc2: adc@100 {
+				compatible = "st,stm32f4-adc";
+				#io-channel-cells = <1>;
+				reg = <0x100>;
+				clocks = <&rcc 0 169>;
+				interrupt-parent = <&adc>;
+				interrupts = <1>;
+				status = "disabled";
+			};
+
+			adc3: adc@200 {
+				compatible = "st,stm32f4-adc";
+				#io-channel-cells = <1>;
+				reg = <0x200>;
+				clocks = <&rcc 0 170>;
+				interrupt-parent = <&adc>;
+				interrupts = <2>;
+				status = "disabled";
+			};
+		};
+
 		syscfg: system-config@40013800 {
 			compatible = "syscon";
 			reg = <0x40013800 0x400>;
@@ -332,6 +375,12 @@
 					slew-rate = <2>;
 				};
 			};
+
+			adc3_in8_pin: adc@200 {
+				pins {
+					pinmux = <STM32F429_PF10_FUNC_ANALOG>;
+				};
+			};
 		};
 
 		rcc: rcc@40023810 {
-- 
1.9.1
