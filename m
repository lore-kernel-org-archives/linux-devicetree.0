From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH] ARM: dts: stm32: update SPI6 dmas property on stm32mp157c
Date: Mon, 17 Sep 2018 10:04:47 +0200
Message-ID: <1537171487-15191-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

Remove unused parameter from SPI6 dmas property on stm32mp157c SoC.

Fixes: dc3f8c86c10d ("ARM: dts: stm32: add SPI support on stm32mp157c")
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 661be94..185541a 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -1078,8 +1078,8 @@
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc SPI6_K>;
 			resets = <&rcc SPI6_R>;
-			dmas = <&mdma1 34 0x0 0x40008 0x0 0x0 0>,
-			       <&mdma1 35 0x0 0x40002 0x0 0x0 0>;
+			dmas = <&mdma1 34 0x0 0x40008 0x0 0x0>,
+			       <&mdma1 35 0x0 0x40002 0x0 0x0>;
 			dma-names = "rx", "tx";
 			status = "disabled";
 		};
-- 
2.7.4
