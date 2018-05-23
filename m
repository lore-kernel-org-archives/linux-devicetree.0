From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH] ARM: dts: stm32: Add DFSDM support to stm32mp157c
Date: Wed, 23 May 2018 11:30:35 +0200
Message-ID: <1527067835-22303-1-git-send-email-fabrice.gasnier@st.com>
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
To: alexandre.torgue@st.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnaud.pouliquen@st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

stm32mp157c has DFSDM (Digital Filter For Sigma Delta Modulators) hardware
with 6 filter instances.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 70 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 66d7496..3d2f4e7 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -556,6 +556,76 @@
 			};
 		};
 
+		dfsdm: dfsdm@4400d000 {
+			compatible = "st,stm32mp1-dfsdm";
+			reg = <0x4400d000 0x800>;
+			clocks = <&rcc DFSDM_K>;
+			clock-names = "dfsdm";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			dfsdm0: filter@0 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <0>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 101 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm1: filter@1 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <1>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 102 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm2: filter@2 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <2>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 103 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm3: filter@3 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <3>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 104 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm4: filter@4 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <4>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 91 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm5: filter@5 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <5>;
+				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 92 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+		};
+
 		dma1: dma@48000000 {
 			compatible = "st,stm32-dma";
 			reg = <0x48000000 0x400>;
-- 
1.9.1
