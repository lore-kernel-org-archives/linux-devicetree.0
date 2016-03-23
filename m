From: Jean-Michel Friedt <jmfriedt@femto-st.fr>
Subject: [PATCH 1/1] ARM: dts: sun5i-a13-olinuxino-micro: enable USB DRC
Date: Wed, 23 Mar 2016 17:28:48 +0100
Message-ID: <1458750528-13180-1-git-send-email-jmfriedt@femto-st.fr>
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
To: linux-arm-kernel@lists.infradead.org
Cc: JM Friedt <jmfriedt@femto-st.fr>, devicetree@vger.kernel.org, maxime.ripard@free-electrons.com
List-Id: devicetree@vger.kernel.org

From: JM Friedt <jmfriedt@femto-st.fr>

Enable the OTG controller on the Olinuxino A13-micro. 

Signed-off-by: JM Friedt <jmfriedt@femto-st.fr>
---
 arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts | 41 +++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
index ad84fe4..081329e 100644
--- a/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
@@ -109,6 +109,10 @@
 	status = "okay";
 };
 
+&otg_sram {
+	status = "okay";
+};
+
 &pio {
 	mmc0_cd_pin_olinuxinom: mmc0_cd_pin@0 {
 		allwinner,pins = "PG0";
@@ -124,6 +128,27 @@
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
+	usb0_id_detect_pin: usb0_id_detect_pin@0 {
+		allwinner,pins = "PG2";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
+
+	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
+		allwinner,pins = "PG1";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+	};
+
+	usb0_vbus_pin_olinuxinom: usb0_vbus_pin@0 {
+		allwinner,pins = "PG12";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+
 	usb1_vbus_pin_olinuxinom: usb1_vbus_pin@0 {
 		allwinner,pins = "PG11";
 		allwinner,function = "gpio_out";
@@ -132,6 +157,12 @@
 	};
 };
 
+&reg_usb0_vbus {
+	pinctrl-0 = <&usb0_vbus_pin_olinuxinom>;
+	gpio = <&pio 6 12 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
 &reg_usb1_vbus {
 	pinctrl-0 = <&usb1_vbus_pin_olinuxinom>;
 	gpio = <&pio 6 11 GPIO_ACTIVE_HIGH>;
@@ -144,7 +175,17 @@
 	status = "okay";
 };
 
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &usbphy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
+	usb0_id_det-gpio = <&pio 6 2 GPIO_ACTIVE_HIGH>; /* PG2 */
+	usb0_vbus_det-gpio = <&pio 6 1 GPIO_ACTIVE_HIGH>; /* PG1 */
+	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
 };
-- 
2.6.4
