From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCHv3 RESEND 1/8] ARM: dts: stm32: set HSE_RTC clock frequency to 1 MHz on stm32f429
Date: Mon, 16 Jan 2017 14:29:44 +0100
Message-ID: <1484573388-590-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch set HSE_RTC clock frequency to 1 MHz, as the clock supplied to
the RTC must be 1 MHz.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index e9324a3..557c1f4 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -433,6 +433,8 @@
 			reg = <0x40023800 0x400>;
 			clocks = <&clk_hse>, <&clk_i2s_ckin>;
 			st,syscfg = <&pwrcfg>;
+			assigned-clocks = <&rcc 1 CLK_HSE_RTC>;
+			assigned-clock-rates = <1000000>;
 		};
 
 		dma1: dma-controller@40026000 {
-- 
1.9.1
