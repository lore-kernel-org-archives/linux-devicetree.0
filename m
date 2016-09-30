From: Brian Kim <brian.kim@hardkernel.com>
Subject: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes
Date: Fri, 30 Sep 2016 18:17:39 +0900
Message-ID: <1475227059-17462-1-git-send-email-brian.kim@hardkernel.com>
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
To: linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, johnyoun@synopsys.com, catalin.marinas@arm.com, will.deacon@arm.com, kishon@ti.com, robh+dt@kernel.org, moon.linux@hardkernel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable both gxbb USB controller and add a 5V regulator for the OTG port
VBUS

Signed-off-by: Brian Kim <brian.kim@hardkernel.com>
---
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 8d89edc..997c671 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -64,6 +64,18 @@
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
 
+	usb_pwr: regulator-usb-pwrs {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB_PWR";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		blue {
@@ -149,6 +161,23 @@
 	pinctrl-names = "default";
 };
 
+&usb0_phy {
+	status = "okay";
+	phy-supply = <&usb_pwr>;
+};
+
+&usb1_phy {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
+
 /* SD */
 &sd_emmc_b {
 	status = "okay";
-- 
2.7.4
