From: Philippe Reynes <tremyfr@gmail.com>
Subject: [PATCH v2] imx27: dt: only map 4 Kbyte for fec registers
Date: Tue, 12 May 2015 23:51:30 +0200
Message-ID: <1431467490-22253-1-git-send-email-tremyfr@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Philippe Reynes <tremyfr@gmail.com>
List-Id: devicetree@vger.kernel.org

According to the imx27 documentation, fec has a 4 Kbyte
memory space map. So, we don't need to map 16 Kbyte for
registers, 4 Kbyte is enough.

Signed-off-by: Philippe Reynes <tremyfr@gmail.com>
---
 arch/arm/boot/dts/imx27.dtsi |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

Changelog:
v2: (thanks Shawn Guo and Uwe Kleine-Konig)
- map 4 Kbyte instead of 1 Kbyte

diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
index 6951b66..bc215e4 100644
--- a/arch/arm/boot/dts/imx27.dtsi
+++ b/arch/arm/boot/dts/imx27.dtsi
@@ -533,7 +533,7 @@
 
 			fec: ethernet@1002b000 {
 				compatible = "fsl,imx27-fec";
-				reg = <0x1002b000 0x4000>;
+				reg = <0x1002b000 0x1000>;
 				interrupts = <50>;
 				clocks = <&clks IMX27_CLK_FEC_IPG_GATE>,
 					 <&clks IMX27_CLK_FEC_AHB_GATE>;
-- 
1.7.4.4
