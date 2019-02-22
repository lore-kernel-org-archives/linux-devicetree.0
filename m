From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH V2 8/8] ARM: dts: stm32: add syscfg clock support for Ethernet on STM32F429 SoC
Date: Fri, 22 Feb 2019 09:28:09 +0100
Message-ID: <1550824089-19961-9-git-send-email-christophe.roullier@st.com>
References: <1550824089-19961-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550824089-19961-1-git-send-email-christophe.roullier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

This patch add syscfg clock support for Ethernet of the STM32F429 SoC.
Needed if bootloader do not manage it.

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 8d6f028..6f78346 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -657,10 +657,12 @@
 			reg-names = "stmmaceth";
 			interrupts = <61>;
 			interrupt-names = "macirq";
-			clock-names = "stmmaceth", "mac-clk-tx", "mac-clk-rx";
+			clock-names = "stmmaceth", "mac-clk-tx", "mac-clk-rx",
+			"syscfg-clk";
 			clocks = <&rcc 0 STM32F4_AHB1_CLOCK(ETHMAC)>,
 					<&rcc 0 STM32F4_AHB1_CLOCK(ETHMACTX)>,
-					<&rcc 0 STM32F4_AHB1_CLOCK(ETHMACRX)>;
+					<&rcc 0 STM32F4_AHB1_CLOCK(ETHMACRX)>,
+					<&rcc 0 STM32F4_APB2_CLOCK(SYSCFG)>;
 			st,syscon = <&syscfg 0x4>;
 			snps,pbl = <8>;
 			snps,mixed-burst;
-- 
2.7.4
