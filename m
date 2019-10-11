From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] ARM: dts: stm32f469: remove useless interrupt from dsi node
Date: Fri, 11 Oct 2019 15:06:58 +0200
Message-ID: <20191011130658.23670-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

DSI driver doesn't use interrupt, remove it from the node since it
breaks yaml check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32f469.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f469.dtsi b/arch/arm/boot/dts/stm32f469.dtsi
index 5ae5213f68cb..be002e8a78ac 100644
--- a/arch/arm/boot/dts/stm32f469.dtsi
+++ b/arch/arm/boot/dts/stm32f469.dtsi
@@ -8,7 +8,6 @@
 		dsi: dsi@40016c00 {
 			compatible = "st,stm32-dsi";
 			reg = <0x40016c00 0x800>;
-			interrupts = <92>;
 			resets = <&rcc STM32F4_APB2_RESET(DSI)>;
 			reset-names = "apb";
 			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
-- 
2.15.0
