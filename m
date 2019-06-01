From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/3] ARM: dts: imx6sx-udoo-neo: enable i2c-2 and i2c-4 for
 onboard sensors
Date: Sat,  1 Jun 2019 08:07:17 +0100
Message-ID: <20190601070718.26971-3-pbrobinson@gmail.com>
References: <20190601070718.26971-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190601070718.26971-1-pbrobinson@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
List-Id: devicetree@vger.kernel.org

The i2c2 bus has a external plug which enables the easy connection of external
"bricks" with sensors of various kinds, while i2c4 on the Extended/Full boards
has a pair of on board motion sensors, accelerometer and magnetometer on one chip
and gyroscope on another so it makes sense to enable these i2c buses for use.
Tested on UDOO Neo Full.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

--
v2: move i2c-4 core to imx6sx-udoo-neo.dtsi and just enable it on specific boards
---
 .../arm/boot/dts/imx6sx-udoo-neo-extended.dts |  4 +++
 arch/arm/boot/dts/imx6sx-udoo-neo-full.dts    |  4 +++
 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi        | 26 +++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts b/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts
index c6005cd284be..04a9f8780b8c 100644
--- a/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts
@@ -16,3 +16,7 @@
 		reg = <0x80000000 0x40000000>;
 	};
 };
+
+&i2c4 { /* Onboard Motion sensors */
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts b/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts
index ad8b8a663a70..3cc6b0231ff6 100644
--- a/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts
@@ -31,3 +31,7 @@
 		};
 	};
 };
+
+&i2c4 { /* Onboard Motion sensors */
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
index 386707c1bfe0..26373e3f3afd 100644
--- a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
@@ -188,6 +188,20 @@
 	};
 };
 
+&i2c2 { /* Brick snap in sensors connector */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&i2c4 { /* Onboard Motion sensors */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	clock-frequency = <100000>;
+	status = "disabled";
+};
+
 &iomuxc {
 	pinctrl_bt_reg: btreggrp {
 		fsl,pins =
@@ -219,6 +233,18 @@
 			<MX6SX_PAD_GPIO1_IO01__I2C1_SDA		0x4001b8b1>;
 	};
 
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins =
+			<MX6SX_PAD_GPIO1_IO03__I2C2_SDA		0x4001b8b1>,
+			<MX6SX_PAD_GPIO1_IO02__I2C2_SCL		0x4001b8b1>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins =
+			<MX6SX_PAD_USB_H_DATA__I2C4_SDA		0x4001b8b1>,
+			<MX6SX_PAD_USB_H_STROBE__I2C4_SCL	0x4001b8b1>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins =
 			<MX6SX_PAD_GPIO1_IO04__UART1_TX		0x1b0b1>,
-- 
2.21.0
