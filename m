From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 2/2] ARM: dts: stm32: Add MDMA support on STM32MP157C
Date: Fri, 20 Apr 2018 11:15:07 +0200
Message-ID: <1524215707-14642-3-git-send-email-pierre-yves.mordret@st.com>
References: <1524215707-14642-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524215707-14642-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

Activate MDMA for STM32MP157C

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
  Version history:
     v1:
        * Initial
---
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index bc3eddc..07cbcde 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -167,6 +167,16 @@
 			#reset-cells = <1>;
 		};
 
+		mdma1: dma@58000000 {
+			compatible = "st,stm32h7-mdma";
+			reg = <0x58000000 0x1000>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc MDMA>;
+			#dma-cells = <5>;
+			dma-channels = <32>;
+			dma-requests = <48>;
+		};
+
 		usart1: serial@5c000000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x5c000000 0x400>;
-- 
2.7.4
