From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv2 1/1] ARM: dts: meson8b: odroidc1: fix USB power supplies for
 phy
Date: Sat,  9 Feb 2019 17:54:28 +0000
Message-ID: <20190209175428.1199-2-linux.amoon@gmail.com>
References: <20190209175428.1199-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190209175428.1199-1-linux.amoon@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

>From the shematics GPIOAO.BIT5 gpio input for the PWREN signal of the
USB_HOST controller (usb1), add missing phy-supply link for USB1 phy
controller this changes fixed the power issue on usb ports.
Changes help fix usb reset warning.

[   59.693078] usb 1-1.3: reset high-speed USB device number 6 using dwc2
[   62.703039] usb 1-1.3: reset high-speed USB device number 6 using dwc2
[   65.693073] usb 1-1.3: reset high-speed USB device number 6 using dwc2
[   68.703030] usb 1-1.3: reset high-speed USB device number 6 using dwc2
[   72.080440] usb 1-1.3: USB disconnect, device number 6

Fixes: 2eb79a4d15ff ("ARM: dts: meson: enabling the USB Host controller on Odroid-C1/C1+ board")
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  4    3      0 unknown     0mV     0mA     0mV     0mV
    c90c0000.usb                  1                                 0mA     0mV     0mV
    c90c0000.usb                  1                                 0mA     0mV     0mV
    VCCK                          1    1      0 unknown   860mV     0mA   860mV  1140mV
       cpu0                       0                                 0mA   860mV   860mV
 P5V0                             3    4      0 unknown  5000mV     0mA  5000mV  5000mV
    VCC1V8                        1    1      0 unknown  1800mV     0mA  1800mV  1800mV
       c1108680.adc               1                                 0mA     0mV     0mV
    VCC3V3                        1    2      0 unknown  3300mV     0mA  3300mV  3300mV
       VDD_RTC                    0    0      0 unknown   900mV     0mA   900mV   900mV
       TFLASH_VDD                 1    1      0 unknown  3300mV     0mA  3300mV  3300mV
          c1108c20.mmc:slot@1     1                                 0mA  3300mV  3400mV
    DDR_VDDC                      0    0      0 unknown  1500mV     0mA  1500mV  1500mV
    USB_VBUS                      2    1      0 unknown  5000mV     0mA  5000mV  5000mV
       phy-c1108820.phy.0         2                                 0mA     0mV     0mV
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 0f0a46ddf3ff..00f2bb1a68f4 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -83,6 +83,20 @@
 		regulator-max-microvolt = <5000000>;
 	};
 
+	usb_vbus: regulator-usb-vbus {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		/*
+		 * signal name from schematics: PWREN
+		 */
+		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&p5v0>;
+	};
+
 	tflash_vdd: regulator-tflash_vdd {
 		/*
 		 * signal name from schematics: TFLASH_VDD_EN
@@ -295,6 +309,7 @@
 
 &usb1_phy {
 	status = "okay";
+	phy-supply = <&usb_vbus>;
 };
 
 &usb1 {
-- 
2.20.1
