From: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Subject: [PATCH v2] ARM: dts: sun8i-h3: add sy8106a to orange pi plus
Date: Sat, 29 Sep 2018 15:18:30 +0200
Message-ID: <20180929131830.13924-1-jorik@kippendief.biz>
Reply-To: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCR5X7NE2UERBQPXXXOQKGQEPS3TFNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>

The Orange Pi Plus board lacks voltage scaling capabilities in its
current form. This results in random freezes during boot when cpufreq is
enabled, probably due to wrong voltages.

This patch (more or less copy/paste from 06139c) does the following
things on this board:
- enable r_i2c
- add sy8106a to the r_i2c bus
- have the sy8106a regulate VDD of cpu

Since the Orange Pi Plus has the same PMU setup as the Orange Pi PC, I
simply took min/max/fixed/ramp from the latter DTS. In that file the
origin of the values are described by the following comment:

  "The datasheet uses 1.1V as the minimum value of VDD-CPUX,
  however both the Armbian DVFS table and the official one
  have operating points with voltage under 1.1V, and both
  DVFS table are known to work properly at the lowest
  operating point.
  Use 1.0V as the minimum voltage instead."

I have tested this on patch two Orange Pi Plus boards, by running a
kernel with this patch and do intermettent runs of cpuburn while
monitoring voltage, frequency and temperature. The board runs stable
across its operatiing points while showing a reasonable (< 40C)
temperature. My Orange Pi PC, when put to the same test, yields similar
stable results.

Signed-off-by: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
index b403e5d78..ac8438c2c 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
@@ -74,6 +74,10 @@
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_vdd_cpux>;
+};
+
 &ehci3 {
 	status = "okay";
 };
@@ -119,6 +123,22 @@
 	};
 };
 
+&r_i2c {
+	status = "okay";
+
+	reg_vdd_cpux: regulator@65 {
+		compatible = "silergy,sy8106a";
+		reg = <0x65>;
+		regulator-name = "vdd-cpux";
+		silergy,fixed-microvolt = <1200000>;
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-ramp-delay = <200>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
 &usbphy {
 	usb3_vbus-supply = <&reg_usb3_vbus>;
 };
-- 
2.17.1
