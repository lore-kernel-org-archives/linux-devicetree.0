From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [RESEND 2/2] arm64: dts: sunxi: h6: Add device node for SID
Date: Thu,  4 Apr 2019 12:57:26 -0400
Message-ID: <20190404165726.13149-3-tiny.windzz@gmail.com>
References: <20190404165726.13149-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404165726.13149-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, srinivas.kandagatla@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

The device tree binding already lists compatible strings for H6
SoCs, so add a device node for iy.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index c9e861a50a63..cbeb587d2eed 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -192,6 +192,11 @@
 			#reset-cells = <1>;
 		};
 
+		sid: sid@3006000 {
+			compatible = "allwinner,sun50i-h6-sid";
+			reg = <0x3006000 0x400>;
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h6-pinctrl";
 			reg = <0x0300b000 0x400>;
-- 
2.17.0
