From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 1/2] arm64: dts: allwinner: a64: Add pinmux setting for CSI MCLK on PE1
Date: Thu, 18 Apr 2019 19:22:31 +0530
Message-ID: <20190418135232.9368-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Some camera modules have the SoC feeding a master clock to the sensor
instead of having a standalone crystal. This clock signal is generated
from the clock control unit and output from the CSI MCLK function of
pin PE1.

Add a pinmux setting for it for camera sensors to reference.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- add /omit-if-no-ref/
- add pin name as csi-mclk-pin instead of csi-mclk 

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 728f70018c51..8c5b521e6389 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -595,6 +595,12 @@
 				function = "csi";
 			};
 
+			/omit-if-no-ref/
+			csi_mclk_pin: csi-mclk-pin {
+				pins = "PE1";
+				function = "csi";
+			};
+
 			i2c0_pins: i2c0-pins {
 				pins = "PH0", "PH1";
 				function = "i2c0";
-- 
2.18.0.321.gffc6fa0e3
