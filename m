From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v2 1/3] ARM: dts: stm32: add RTC support to stm32mp157c
Date: Thu, 17 May 2018 14:07:06 +0200
Message-ID: <1526558828-24456-2-git-send-email-amelie.delaunay@st.com>
References: <1526558828-24456-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526558828-24456-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

Add support for RTC (Real Time Clock) to STM32MP157C SoC.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index b66f673..df2d874 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -818,6 +818,15 @@
 			status = "disabled";
 		};
 
+		rtc: rtc@5c004000 {
+			compatible = "st,stm32mp1-rtc";
+			reg = <0x5c004000 0x400>;
+			clocks = <&rcc RTCAPB>, <&rcc RTC>;
+			clock-names = "pclk", "rtc_ck";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		i2c6: i2c@5c009000 {
 			compatible = "st,stm32f7-i2c";
 			reg = <0x5c009000 0x400>;
-- 
2.7.4
