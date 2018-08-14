From: Tuomas Tynkkynen <tuomas@tuxera.com>
Subject: [PATCH] ARM: dts: imx6: Add stdout-path to Wandboard
Date: Tue, 14 Aug 2018 23:47:58 +0300
Message-ID: <20180814204758.3049-1-tuomas@tuxera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Tuomas Tynkkynen <tuomas@tuxera.com>
List-Id: devicetree@vger.kernel.org

Setting a stdout-path in the .dtb is convenient because then the user
gets a serial console on the RS-232 connector without any extra effort
of figuring out the relevant 'console=' boot parameter.

Signed-off-by: Tuomas Tynkkynen <tuomas@tuxera.com>
---
Tested on a Wandboard Quad with mainline U-Boot 2018.05.
---
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
index e1afa54404d0..0ef34c31f7c6 100644
--- a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
@@ -8,6 +8,10 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
+	chosen {
+		stdout-path = &uart1;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.16.3
