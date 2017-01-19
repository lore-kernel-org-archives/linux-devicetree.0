From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 2/3] ARM: dts: stm32: Add RTC support for STM32F746 MCU
Date: Thu, 19 Jan 2017 14:45:18 +0100
Message-ID: <1484833519-9298-3-git-send-email-amelie.delaunay@st.com>
References: <1484833519-9298-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484833519-9298-1-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds STM32 RTC bindings for STM32F746.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32f746.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index b42f23d..c57d265 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -121,6 +121,20 @@
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
 			compatible = "st,stm32f7-usart", "st,stm32f7-uart";
 			reg = <0x40004400 0x400>;
-- 
1.9.1
