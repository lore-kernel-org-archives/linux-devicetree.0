From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 4/6] ARM: dts: sun5i: q8-common: Enable USB power supply
Date: Tue, 17 May 2016 23:56:09 +0800
Message-ID: <1463500571-28970-5-git-send-email-wens@csie.org>
References: <1463500571-28970-1-git-send-email-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463500571-28970-1-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org

On the A13 Q8 tablets, the PMIC's USB power supply (VBUS) is connected
to the external OTG port. This can be used to provide power and OTG VBUS
sensing.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun5i-q8-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i-q8-common.dtsi b/arch/arm/boot/dts/sun5i-q8-common.dtsi
index dcaaa085ac77..8fc1b6110fb8 100644
--- a/arch/arm/boot/dts/sun5i-q8-common.dtsi
+++ b/arch/arm/boot/dts/sun5i-q8-common.dtsi
@@ -176,11 +176,16 @@
 	status = "okay";
 };
 
+&usb_power_supply {
+	status = "okay";
+};
+
 &usbphy {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
 	usb0_id_det-gpio = <&pio 6 2 GPIO_ACTIVE_HIGH>; /* PG2 */
 	usb0_vbus_det-gpio = <&pio 6 1 GPIO_ACTIVE_HIGH>; /* PG1 */
+	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_ldo3>;
 	status = "okay";
-- 
2.8.1
