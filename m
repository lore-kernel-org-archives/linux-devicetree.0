From: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Subject: [PATCH v4 3/4] ARM: dts: Add STM32 DMA support for STM32F429 MCU
Date: Fri, 16 Oct 2015 15:59:15 +0200
Message-ID: <1445003956-9150-4-git-send-email-cedric.madianga@gmail.com>
References: <1445003956-9150-1-git-send-email-cedric.madianga@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445003956-9150-1-git-send-email-cedric.madianga@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mcoquelin.stm32@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, vinod.koul@intel.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds STM32 DMA bindings for STM32F429.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index d78a481..037eb29 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -174,6 +174,37 @@
 			reg = <0x40023800 0x400>;
 			clocks = <&clk_hse>;
 		};
+
+		dma1: dma-controller@40026000 {
+			compatible = "st,stm32-dma";
+			reg = <0x40026000 0x400>;
+			interrupts = <11>,
+				     <12>,
+				     <13>,
+				     <14>,
+				     <15>,
+				     <16>,
+				     <17>,
+				     <47>;
+			clocks = <&rcc 0 21>;
+			#dma-cells = <4>;
+		};
+
+		dma2: dma-controller@40026400 {
+			compatible = "st,stm32-dma";
+			reg = <0x40026400 0x400>;
+			interrupts = <56>,
+				     <57>,
+				     <58>,
+				     <59>,
+				     <60>,
+				     <68>,
+				     <69>,
+				     <70>;
+			clocks = <&rcc 0 22>;
+			#dma-cells = <4>;
+			st,mem2mem;
+		};
 	};
 };
 
-- 
1.9.1
