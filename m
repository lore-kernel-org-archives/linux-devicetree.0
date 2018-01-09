From: Marco Franchi <marco.franchi@nxp.com>
Subject: [PATCH 1/3] ARM: dts: imx6ul-evk: Add support for mag3110 sensor
Date: Tue, 9 Jan 2018 09:46:23 -0200
Message-ID: <1515498385-23198-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: fabio.estevam@nxp.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Marco Franchi <marco.franchi@nxp.com>
List-Id: devicetree@vger.kernel.org

The i.MX 6UL EVK has a MAG3110 Magnetometer sensor in its base board.
Add support for this sensor, which is included in the trivial i2c devices 
and according to the bindings documentation, just need a compatible field 
and an address.

Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
---
 arch/arm/boot/dts/imx6ul-14x14-evk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dts b/arch/arm/boot/dts/imx6ul-14x14-evk.dts
index 18fdb08..cb33baa 100644
--- a/arch/arm/boot/dts/imx6ul-14x14-evk.dts
+++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dts
@@ -140,6 +140,17 @@
 	};
 };
 
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	mag3110@e {
+		compatible = "fsl,mag3110";
+		reg = <0x0e>;
+	};
+};
 
 &lcdif {
 	assigned-clocks = <&clks IMX6UL_CLK_LCDIF_PRE_SEL>;
-- 
2.7.4
