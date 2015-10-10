From: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH] ARM: dts: sun7i: Add regulator configuration
 for pcDuino v3 Nano
Date: Sat, 10 Oct 2015 21:15:21 +0100
Message-ID: <1444508121-20233-1-git-send-email-ats@offog.org>
Reply-To: ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQPXGGUXQGBBYXD4WYAKGQE2OBX2ZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The power configuration on this board is the same as the pcDuino v3.
This will enable frequency/voltage scaling over the standard A20
operating points from 144 MHz to 960 MHz.

Tested using cpufreq-ljt-stress-test on two pcDuino v3 Nano boards; also
tested successfully with voltages reduced by 0.025 V.

Signed-off-by: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts | 35 ++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
index ee85e07..1757a6a 100644
--- a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
+++ b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
@@ -82,6 +82,10 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -108,13 +112,9 @@
 	status = "okay";
 
 	axp209: pmic@34 {
-		compatible = "x-powers,axp209";
 		reg = <0x34>;
 		interrupt-parent = <&nmi_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-
-		interrupt-controller;
-		#interrupt-cells = <1>;
 	};
 };
 
@@ -182,6 +182,33 @@
 	status = "okay";
 };
 
+#include "axp209.dtsi"
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-int-pll";
+};
+
+&reg_ldo1 {
+	regulator-name = "vdd-rtc";
+};
+
+&reg_ldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
+
 /* A single regulator (U24) powers both USB host ports. */
 &reg_usb1_vbus {
 	pinctrl-0 = <&usb1_vbus_pin_pcduino3_nano>;
-- 
2.1.4
