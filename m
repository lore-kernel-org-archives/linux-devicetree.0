From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: [PATCH v5 10/12] ARM: dts: Berlin: enable USB on the BG2Q DMP
Date: Mon, 15 Sep 2014 12:36:16 +0200
Message-ID: <1410777378-12726-11-git-send-email-antoine.tenart@free-electrons.com>
References: <1410777378-12726-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1410777378-12726-1-git-send-email-antoine.tenart@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com, p.zabel@pengutronix.de
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable the 2 available USB PHY and USB nodes on the Marvell Berlin BG2Q
DMP.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 53 ++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
index a357ce02a64e..663aedb173e0 100644
--- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
+++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
@@ -7,6 +7,8 @@
  */
 
 /dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
 #include "berlin2q.dtsi"
 
 / {
@@ -21,6 +23,39 @@
 	choosen {
 		bootargs = "console=ttyS0,115200 earlyprintk";
 	};
+
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg_usb0_vbus: regulator@0 {
+			compatible = "regulator-fixed";
+			regulator-name = "usb0_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&portb 8 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_usb1_vbus: regulator@1 {
+			compatible = "regulator-fixed";
+			regulator-name = "usb1_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&portb 10 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_usb2_vbus: regulator@2 {
+			compatible = "regulator-fixed";
+			regulator-name = "usb2_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&portb 12 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+	};
 };
 
 &sdhci1 {
@@ -45,3 +80,21 @@
 &uart0 {
 	status = "okay";
 };
+
+&usb_phy0 {
+	status = "okay";
+};
+
+&usb_phy2 {
+	status = "okay";
+};
+
+&usb0 {
+	vbus-supply = <&reg_usb0_vbus>;
+	status = "okay";
+};
+
+&usb2 {
+	vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+};
-- 
1.9.1
