From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 4/4] ARM: dts: stm32: Add DMAMUX support on STM32MP157C
Date: Fri, 20 Apr 2018 11:14:41 +0200
Message-ID: <1524215681-14555-5-git-send-email-pierre-yves.mordret@st.com>
References: <1524215681-14555-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524215681-14555-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

Activate DMAMUX for STM32MP157C

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
  Version history:
     v1:
        * Initial
---
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 3c0ca6c..da4c39e 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -174,6 +174,7 @@
 			clocks = <&rcc DMA1>;
 			#dma-cells = <4>;
 			st,mem2mem;
+			dma-requests = <8>;
 		};
 
 		dma2: dma@48001000 {
@@ -190,6 +191,17 @@
 			clocks = <&rcc DMA2>;
 			#dma-cells = <4>;
 			st,mem2mem;
+			dma-requests = <8>;
+		};
+
+		dmamux1: dma-router@48002000 {
+			compatible = "st,stm32h7-dmamux";
+			reg = <0x48002000 0x1c>;
+			#dma-cells = <3>;
+			dma-requests = <128>;
+			dma-masters = <&dma1 &dma2>;
+			dma-channels = <16>;
+			clocks = <&rcc DMAMUX>;
 		};
 
 		rcc: rcc@50000000 {
-- 
2.7.4
