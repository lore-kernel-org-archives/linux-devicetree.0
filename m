From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am654: Enable main domain McSPI0
Date: Sun, 9 Dec 2018 15:52:22 +0530
Message-ID: <20181209102222.7624-3-vigneshr@ti.com>
References: <20181209102222.7624-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209102222.7624-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Enable McSPI0 of main domain and add DT node for the SPI NOR flash
connected to CS0.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 49ec2c3f5ef1..e41fc3a5987b 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -60,6 +60,15 @@
 			AM65X_IOPAD(0x0070, PIN_INPUT, 5) /* (R25) GPMC0_CSn2.I2C2_SDA */
 		>;
 	};
+
+	main_spi0_pins_default: main-spi0-pins-default {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x01c4, PIN_INPUT, 0) /* (AH13) SPI0_CLK */
+			AM65X_IOPAD(0x01c8, PIN_INPUT, 0) /* (AE13) SPI0_D0 */
+			AM65X_IOPAD(0x01cc, PIN_INPUT, 0) /* (AD13) SPI0_D1 */
+			AM65X_IOPAD(0x01bc, PIN_OUTPUT, 0) /* (AG13) SPI0_CS0 */
+		>;
+	};
 };
 
 &main_pmx1 {
@@ -136,3 +145,21 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&ecap0_pins_default>;
 };
+
+&main_spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_spi0_pins_default>;
+	#address-cells = <1>;
+	#size-cells= <0>;
+	ti,pindir-d0-out-d1-in = <1>;
+
+	flash@0{
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+		spi-max-frequency = <48000000>;
+		#address-cells = <1>;
+		#size-cells= <1>;
+	};
+};
-- 
2.19.2
