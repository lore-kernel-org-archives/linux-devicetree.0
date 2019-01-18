From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 3/8] dt-bindings: net: bluetooth: Add rtl8723bs-bluetooth
Date: Fri, 18 Jan 2019 09:02:27 -0800
Message-ID: <20190118170232.16142-4-anarsoul@gmail.com>
References: <20190118170232.16142-1-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190118170232.16142-1-anarsoul@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add binding document for bluetooth part of RTL8723BS/RTL8723CS

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../bindings/net/rtl8723bs-bluetooth.txt      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt

diff --git a/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt b/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
new file mode 100644
index 000000000000..8357f242ae4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
@@ -0,0 +1,35 @@
+RTL8723BS/RTL8723CS Bluetooth
+---------------------
+
+RTL8723CS/RTL8723CS is WiFi + BT chip. WiFi part is connected over SDIO, while
+BT is connected over serial. It speaks H5 protocol with few extra commands
+to upload firmware and change module speed.
+
+Required properties:
+
+ - compatible: should be one of the following:
+   * "realtek,rtl8723bs-bt"
+   * "realtek,rtl8723cs-bt"
+Optional properties:
+
+ - device-wake-gpios: GPIO specifier, used to wakeup the BT module (active high)
+ - enable-gpios: GPIO specifier, used to enable the BT module (active high)
+ - host-wake-gpios: GPIO specifier, used to wakeup the host processor (active high)
+ - firmware-postfix: firmware postfix to be used for firmware config
+ - reset-gpios: GPIO specifier, used to reset the BT module (active high)
+
+Example:
+
+&uart1 {
+       pinctrl-names = "default";
+       pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+       status = "okay";
+
+       bluetooth {
+               compatible = "realtek,rtl8723bs-bt";
+               reset-gpios = <&r_pio 0 4 GPIO_ACTIVE_LOW>; /* PL4 */
+               device-wake-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
+               host-wakeup-gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+               firmware-postfix="pine64";
+       };
+};
-- 
2.20.1
