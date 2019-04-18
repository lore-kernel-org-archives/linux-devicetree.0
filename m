From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH] arm64: dts: allwinner: a64-oceanic-5205-5inmfd: Enable CAN
Date: Thu, 18 Apr 2019 19:46:58 +0530
Message-ID: <20190418141658.10868-1-jagan@amarulasolutions.com>
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Oceanic 5205 5inMFD has MCP2515 CAN device connected via SPI1.

- via SPI1 bus
- vdd supplied by 5V supply along with PL2 enable pin
- xceiver supply same as vdd
- can oscillator connected at 20MHz
- PB2 gpio as interrupt pin
- PD6 gpio as RX_BUF1_CAN0
- PD7 gpio as RX_BUF0_CAN0

Tested-by: Tamas Papp <tamas@osukl.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../sun50i-a64-oceanic-5205-5inmfd.dts        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
index f0cd6587f619..22535a297f51 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
@@ -21,6 +21,24 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	can_osc: can-osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <20000000>;
+	};
+
+	reg_can_v5v: reg-can-v5v {
+		compatible = "regulator-fixed";
+		regulator-name = "reg-can-v5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* CAN_3V3_EN: PL2 */
+		status = "okay";
+	};
+
 };
 
 &ehci0 {
@@ -77,6 +95,31 @@
 	status = "okay";
 };
 
+&pio {
+	can_pins: can-pins {
+		pins = "PD6",			/* RX_BUF1_CAN0 */
+		       "PD7";			/* RX_BUF0_CAN0 */
+		function = "gpio_in";
+	};
+};
+
+&spi1 {
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2515";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&can_pins>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 2 IRQ_TYPE_EDGE_FALLING>;	/* INT_CAN0: PB2 */
+		clocks = <&can_osc>;
+		vdd-supply = <&reg_can_v5v>;
+		xceiver-supply = <&reg_can_v5v>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.18.0.321.gffc6fa0e3
