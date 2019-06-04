From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 3/3] arm64: dts: allwinner: h6: Pine H64: Add interrupt line for RTC
Date: Tue,  4 Jun 2019 12:23:37 +0800
Message-ID: <20190604042337.26129-4-wens@kernel.org>
References: <20190604042337.26129-1-wens@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604042337.26129-1-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Vincent Donnefort <vdonnefort@gmail.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The external PCF8563 RTC chip's interrupt line is connected to the NMI
line on the SoC.

Add the interrupt line to the device tree.

Fixes: 17ebc33afc35 ("arm64: allwinner: h6: add PCF8563 RTC on Pine H64 board")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index 9e464d40cbff..189834518391 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -249,6 +249,8 @@
 	pcf8563: rtc@51 {
 		compatible = "nxp,pcf8563";
 		reg = <0x51>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		#clock-cells = <0>;
 	};
 };
-- 
2.20.1
