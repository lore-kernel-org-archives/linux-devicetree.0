From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 5/7] arm64: allwinner: h6: Add RTC node
Date: Thu,  1 Nov 2018 00:06:32 +0530
Message-ID: <20181031183634.29640-5-jagan@amarulasolutions.com>
References: <20181031183634.29640-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181031183634.29640-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@openedev.com>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan@openedev.com>

RTC controller is similar to A31, so use the same compatible
for H6 and update interrupt numbers as per manual.

Signed-off-by: Jagan Teki <jagan@openedev.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 3b9da12e65db..c8d2fe76da7e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -266,6 +266,13 @@
 			status = "disabled";
 		};
 
+		rtc: rtc@7000000 {
+			compatible = "allwinner,sun6i-a31-rtc";
+			reg = <0x7000000 0x400>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		r_ccu: clock@7010000 {
 			compatible = "allwinner,sun50i-h6-r-ccu";
 			reg = <0x07010000 0x400>;
-- 
2.18.0.321.gffc6fa0e3
