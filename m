From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] ARM: dts: stm32: Enable high resolution timer
Date: Fri, 27 Sep 2019 10:48:19 +0200
Message-ID: <20190927084819.645-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Adding always-on makes arm arch_timer claim to be an high resolution timer.
That is possible because power mode won't stop clocking the timer.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 9b11654a0a39..74f64745d60d 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -50,6 +50,7 @@
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&intc>;
+		always-on;
 	};
 
 	clocks {
-- 
2.15.0
