From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCHv3 RESEND 4/8] ARM: dts: stm32: Add RTC support for STM32F429 MCU
Date: Mon, 16 Jan 2017 14:29:45 +0100
Message-ID: <1484573388-590-2-git-send-email-amelie.delaunay@st.com>
References: <1484573388-590-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484573388-590-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds STM32 RTC bindings for STM32F429.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 557c1f4..f05a9d9 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -125,6 +125,20 @@
 			status = "disabled";
 		};
 
+		rtc: rtc@40002800 {
+			compatible = "st,stm32-rtc";
+			reg = <0x40002800 0x400>;
+			clocks = <&rcc 1 CLK_RTC>;
+			clock-names = "ck_rtc";
+			assigned-clocks = <&rcc 1 CLK_RTC>;
+			assigned-clock-parents = <&rcc 1 CLK_LSE>;
+			interrupt-parent = <&exti>;
+			interrupts = <17 1>;
+			interrupt-names = "alarm";
+			st,syscfg = <&pwrcfg>;
+			status = "disabled";
+		};
+
 		usart2: serial@40004400 {
 			compatible = "st,stm32-usart", "st,stm32-uart";
 			reg = <0x40004400 0x400>;
-- 
1.9.1
