From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH] ARM: dts: stm32: Add hwspinlock node for stm32mp157 SoC
Date: Thu,  6 Dec 2018 10:57:57 +0100
Message-ID: <20181206095757.16363-1-benjamin.gaignard@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Benjamin Gaignard <benjamin.gaignard@st.com>

Declare hwspinlock device for stm32mp157 SoC

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index f8bbfff5950b..2bd4394fd791 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -886,6 +886,14 @@
 			status = "disabled";
 		};
 
+		hsem: hwspinlock@4c000000 {
+			compatible = "st,stm32-hwspinlock";
+			#hwlock-cells = <1>;
+			reg = <0x4c000000 0x400>;
+			clocks = <&rcc HSEM>;
+			clock-names = "hwsem";
+		};
+
 		rcc: rcc@50000000 {
 			compatible = "st,stm32mp1-rcc", "syscon";
 			reg = <0x50000000 0x1000>;
-- 
2.15.0
