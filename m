From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 3/3] ARM: dts: imx6sx-udoo-neo: add bluetooth config to uart3
Date: Sat,  1 Jun 2019 08:07:18 +0100
Message-ID: <20190601070718.26971-4-pbrobinson@gmail.com>
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

This updates the WL1831 bluetooth to use the serial serdev driver
interface.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../arm/boot/dts/imx6sx-udoo-neo-extended.dts |  4 ++++
 arch/arm/boot/dts/imx6sx-udoo-neo-full.dts    |  4 ++++
 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi        | 24 ++++++++-----------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts b/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts
index 04a9f8780b8c..5c50d44eb8d8 100644
--- a/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts
@@ -20,3 +20,7 @@
 &i2c4 { /* Onboard Motion sensors */
 	status = "okay";
 };
+
+&uart3 { /* Bluetooth */
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts b/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts
index 3cc6b0231ff6..ba051a755177 100644
--- a/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts
@@ -35,3 +35,7 @@
 &i2c4 { /* Onboard Motion sensors */
 	status = "okay";
 };
+
+&uart3 { /* Bluetooth */
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
index 26373e3f3afd..f35c3af43780 100644
--- a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
@@ -70,18 +70,6 @@
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
-
-	reg_bt: regulator-bt {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_bt_reg>;
-		enable-active-high;
-		gpio = <&gpio2 17 GPIO_ACTIVE_HIGH>;
-		regulator-name = "bt_reg";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
 };
 
 &fec1 {
@@ -343,11 +331,19 @@
 	status = "disabled";
 };
 
-&uart3 { /* Bluetooth */
+&uart3 { /* Bluetooth - only on Extended/Full versions */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
 	uart-has-rtscts;
-	status = "okay";
+	status = "disabled";
+
+	bluetooth {
+		compatible = "ti,wl1831-st";
+		enable-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_bt_reg>;
+		max-speed = <921600>;
+	};
 };
 
 /* Arduino serial */
-- 
2.21.0
