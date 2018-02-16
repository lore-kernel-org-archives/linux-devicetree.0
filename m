From: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: stm32: add RTC support on STM32H743
Date: Fri, 16 Feb 2018 14:16:39 +0100
Message-ID: <1518787000-10675-2-git-send-email-amelie.delaunay@st.com>
References: <1518787000-10675-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518787000-10675-1-git-send-email-amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for RTC on STM32H743 SoC.
It also adds dt-bindings/interrupt-controller/irq.h include and uses it to
configure RTC alarm interrupt.

Signed-off-by: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stm32h743.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 38d7cb8..b4487d1 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -44,6 +44,7 @@
 #include "armv7-m.dtsi"
 #include <dt-bindings/clock/stm32h7-clks.h>
 #include <dt-bindings/mfd/stm32h7-rcc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	clocks {
@@ -326,6 +327,20 @@
 			status = "disabled";
 		};
 
+		rtc: rtc@58004000 {
+			compatible = "st,stm32h7-rtc";
+			reg = <0x58004000 0x400>;
+			clocks = <&rcc RTCAPB_CK>, <&rcc RTC_CK>;
+			clock-names = "pclk", "rtc_ck";
+			assigned-clocks = <&rcc RTC_CK>;
+			assigned-clock-parents = <&rcc LSE_CK>;
+			interrupt-parent = <&exti>;
+			interrupts = <17 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "alarm";
+			st,syscfg = <&pwrcfg>;
+			status = "disabled";
+		};
+
 		rcc: reset-clock-controller@58024400 {
 			compatible = "st,stm32h743-rcc", "st,stm32-rcc";
 			reg = <0x58024400 0x400>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
