From: Olivier Moysan <olivier.moysan@st.com>
Subject: [Linux-stm32][PATCH 1/4] ARM: dts: stm32: add sai support on stm32mp157c
Date: Thu, 25 Apr 2019 16:10:37 +0200
Message-ID: <1556201440-5540-2-git-send-email-olivier.moysan@st.com>
References: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

This patch adds support of STM32 SAI on stm32mp157c.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 125 +++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 2afeee65c3ea..9ae40240f635 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -708,6 +708,100 @@
 			status = "disabled";
 		};
 
+		sai1: sai@4400a000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x4400a000 0x400>;
+			reg = <0x4400a000 0x4>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI1_R>;
+			status = "disabled";
+
+			sai1a: audio-controller@4400a004 {
+				#sound-dai-cells = <0>;
+
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x4 0x1c>;
+				clocks = <&rcc SAI1_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 87 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai1b: audio-controller@4400a024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI1_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 88 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		sai2: sai@4400b000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x4400b000 0x400>;
+			reg = <0x4400b000 0x4>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI2_R>;
+			status = "disabled";
+
+			sai2a: audio-controller@4400b004 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x4 0x1c>;
+				clocks = <&rcc SAI2_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 89 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai2b: audio-controller@4400b024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI2_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 90 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		sai3: sai@4400c000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x4400c000 0x400>;
+			reg = <0x4400c000 0x4>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI3_R>;
+			status = "disabled";
+
+			sai3a: audio-controller@4400c004 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x04 0x1c>;
+				clocks = <&rcc SAI3_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 113 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai3b: audio-controller@4400c024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI3_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 114 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
 		dfsdm: dfsdm@4400d000 {
 			compatible = "st,stm32mp1-dfsdm";
 			reg = <0x4400d000 0x800>;
@@ -1020,6 +1114,37 @@
 			status = "disabled";
 		};
 
+		sai4: sai@50027000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x50027000 0x400>;
+			reg = <0x50027000 0x4>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI4_R>;
+			status = "disabled";
+
+			sai4a: audio-controller@50027004 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x04 0x1c>;
+				clocks = <&rcc SAI4_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 99 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai4b: audio-controller@50027024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI4_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 100 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
 		dts: thermal@50028000 {
 			compatible = "st,stm32-thermal";
 			reg = <0x50028000 0x100>;
-- 
2.7.4
