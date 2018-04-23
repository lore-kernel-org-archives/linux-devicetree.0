From: Lionel Debieve <lionel.debieve@st.com>
Subject: [PATCH 4/4] ARM: dts: stm32: Add CRC support on stm32mp157c
Date: Mon, 23 Apr 2018 17:19:47 +0200
Message-ID: <20180423151947.2526-5-lionel.debieve@st.com>
References: <20180423151947.2526-1-lionel.debieve@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180423151947.2526-1-lionel.debieve@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch add CRC instance of the stm32mp157c SoC

Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 5ce7d28f8a1f..2962decacd87 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -185,6 +185,13 @@
 			status = "disabled";
 		};
 
+		crc1: crc@58009000 {
+			compatible = "st,stm32f7-crc";
+			reg = <0x58009000 0x400>;
+			clocks = <&rcc CRC1>;
+			status = "disabled";
+		};
+
 		usart1: serial@5c000000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x5c000000 0x400>;
-- 
2.15.1
