From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH 1/2] ARM: dts: stm32: add spdifrx support on stm32mp157c
Date: Fri, 29 Mar 2019 11:12:44 +0100
Message-ID: <1553854365-19866-2-git-send-email-olivier.moysan@st.com>
References: <1553854365-19866-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553854365-19866-1-git-send-email-olivier.moysan@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

This patch adds support of STM32 SPDIFRX on
stm32mp157c.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 6ce75f696679..7769685d6361 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -580,6 +580,19 @@
 			status = "disabled";
 		};
 
+		spdifrx: audio-controller@4000d000 {
+			compatible = "st,stm32h7-spdifrx";
+			#sound-dai-cells = <0>;
+			reg = <0x4000d000 0x400>;
+			clocks = <&rcc SPDIF_K>;
+			clock-names = "kclk";
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 93 0x400 0x01>,
+			       <&dmamux1 94 0x400 0x01>;
+			dma-names = "rx", "rx-ctrl";
+			status = "disabled";
+		};
+
 		spi1: spi@44004000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.7.4
