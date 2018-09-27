From: jorik@kippendief.biz
Subject: [PATCH] dts: sun8i-h3: add sy8106a to orange pi plus
Date: Thu, 27 Sep 2018 10:36:36 +0200
Message-ID: <20180927083636.5415-1-jorik@kippendief.biz>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com, jorik@kippendief.biz
List-Id: devicetree@vger.kernel.org

From: Jorik Jonker <jorik@kippendief.biz>

The Orange Pi Plus board lacks voltage scaling capabilities in its
current form. This results in random freezes during boot when cpufreq is
enabled, probably due to wrong voltages.

This patch (a copy/paste of 06139c) does the following things on this
board:
- enable r_i2c
- add sy8106a to the r_i2c bus
- have the sy8106a regulate VDD of cpu

I have tested this on two Orange Pi Plus boards, and they run stable
across a range of voltages (and frequencies).

Signed-off-by: Jorik Jonker <jorik@kippendief.biz>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
index b403e5d78..fd64b5c94 100644
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
@@ -119,6 +123,31 @@
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
+		/*
+		 * The datasheet uses 1.1V as the minimum value of VDD-CPUX,
+		 * however both the Armbian DVFS table and the official one
+		 * have operating points with voltage under 1.1V, and both
+		 * DVFS table are known to work properly at the lowest
+		 * operating point.
+		 *
+		 * Use 1.0V as the minimum voltage instead.
+		 */
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
