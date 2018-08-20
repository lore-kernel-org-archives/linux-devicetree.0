From: Tuomas Tynkkynen <tuomas@tuxera.com>
Subject: [PATCH v2] ARM: dts: imx6qdl-wandboard: Add stdout-path
Date: Tue, 21 Aug 2018 00:07:18 +0300
Message-ID: <20180820210718.18636-1-tuomas@tuxera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tuomas Tynkkynen <tuomas@tuxera.com>
List-Id: devicetree@vger.kernel.org

Setting a stdout-path in the .dtb is convenient because then the user
gets a serial console on the RS-232 connector without any extra effort
of figuring out the relevant 'console=' boot parameter.

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Tuomas Tynkkynen <tuomas@tuxera.com>
---
v2: Make subject line consistent
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
