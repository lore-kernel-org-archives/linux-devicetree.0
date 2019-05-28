From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] arm64: dts: marvell: armada-7040-db: Add USB current
 regulators
Date: Tue, 28 May 2019 11:03:10 +0200
Message-ID: <20190528090310.31774-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Armada 7040-db USB ports deliver 500mA by default while they
could deliver up to 900mA (usually, for USB3 devices).

The board embeds a GPIO controlled regulator on each port which can be
configured to deliver each amount of current.

Add a vin-supply property to the USB3 Vbus nodes for this purpose. The
regulator will be automatically 'enabled', ie. set to limit at 900mA
instead of 500mA.

Suggested-by: Alex Leibovich <alexl@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../arm64/boot/dts/marvell/armada-7040-db.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index d20d84ce7ca8..f34ee87a0f56 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -28,6 +28,32 @@
 		ethernet2 = &cp0_eth2;
 	};
 
+	cp0_exp_usb3_0_current_regulator: gpio-regulator {
+		compatible = "regulator-gpio";
+		regulator-name = "cp0-usb3-0-current-regulator";
+		regulator-type = "current";
+		regulator-min-microamp = <500000>;
+		regulator-max-microamp = <900000>;
+		gpios = <&expander0 4 GPIO_ACTIVE_HIGH>;
+		states = <500000 0x0
+			  900000 0x1>;
+		enable-active-high;
+		gpios-states = <0>;
+	};
+
+	cp0_exp_usb3_1_current_regulator: gpio-regulator {
+		compatible = "regulator-gpio";
+		regulator-name = "cp0-usb3-1-current-regulator";
+		regulator-type = "current";
+		regulator-min-microamp = <500000>;
+		regulator-max-microamp = <900000>;
+		gpios = <&expander0 5 GPIO_ACTIVE_HIGH>;
+		states = <500000 0x0
+			  900000 0x1>;
+		enable-active-high;
+		gpios-states = <0>;
+	};
+
 	cp0_reg_usb3_0_vbus: cp0-usb3-0-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb3h0-vbus";
@@ -35,6 +61,7 @@
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 		gpio = <&expander0 0 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&cp0_exp_usb3_0_current_regulator>;
 	};
 
 	cp0_reg_usb3_1_vbus: cp0-usb3-1-vbus {
@@ -44,6 +71,7 @@
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 		gpio = <&expander0 1 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&cp0_exp_usb3_1_current_regulator>;
 	};
 
 	cp0_usb3_0_phy: cp0-usb3-0-phy {
-- 
2.19.1
