From: megous@megous.com
Subject: [RESEND PATCH 5/5] arm64: dts: allwinner: orange-pi-3: Enable UART1 / Bluetooth
Date: Fri, 23 Aug 2019 12:31:39 +0200
Message-ID: <20190823103139.17687-6-megous@megous.com>
References: <20190823103139.17687-1-megous@megous.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823103139.17687-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

The board contains AP6256 WiFi/BT module that has its bluetooth part
connected to SoC's UART1 port. Enable this port, and add node for the
bluetooth device.

Bluetooth part is named bcm4345c5.

You'll need a BCM4345C5.hcd firmware file that can be found in the
Xulongs's repository for H6:

https://github.com/orangepi-xunlong/OrangePiH6_external/tree/master/ap6256

The driver expects the firmware at the following path relative to the
firmware directory:

  brcm/BCM4345C5.hcd

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index 49d954369087..a9e776446c35 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -15,6 +15,7 @@
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	chosen {
@@ -271,6 +272,24 @@
 	status = "okay";
 };
 
+/* There's the BT part of the AP6256 connected to that UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		clocks = <&rtc 1>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+		host-wakeup-gpios = <&r_pio 1 1 GPIO_ACTIVE_HIGH>; /* PM1 */
+		shutdown-gpios = <&r_pio 1 4 GPIO_ACTIVE_HIGH>; /* PM4 */
+		max-speed = <1500000>;
+	};
+};
+
 &usb2otg {
 	/*
 	 * This board doesn't have a controllable VBUS even though it
-- 
2.23.0
