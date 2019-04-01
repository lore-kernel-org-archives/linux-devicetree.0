From: megous@megous.com
Subject: [PATCH v2 1/5] ARM: dts: sun8i: tbs-a711: Add node for BMA250 accelerometer
Date: Mon,  1 Apr 2019 13:56:12 +0200
Message-ID: <20190401115616.21337-2-megous@megous.com>
References: <20190401115616.21337-1-megous@megous.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401115616.21337-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@free-electrons.com, wens@csie.org, robh@kernel.org, johan@kernel.org, mark.rutland@arm.com
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

A711 tablet has BMA250 accelerometer connected to I2C1 bus. Enable
both the I2C1 bus and add the accelerometer device to it.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
index 1e840ab5a541..d70fe04b66f0 100644
--- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
@@ -156,6 +156,19 @@
 	status = "okay";
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	/* Accelerometer */
+	accelerometer@18 {
+		compatible = "bosch,bma250";
+		reg = <0x18>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 10 IRQ_TYPE_EDGE_RISING>; /* PH10 / EINT10 */
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dcdc1>;
 	pinctrl-names = "default";
-- 
2.21.0
