From: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Subject: [PATCH 16/23] ARM: u300: support regulators in the device tree
Date: Mon, 22 Apr 2013 11:57:48 +0200
Message-ID: <1366624668-6682-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Now that we have enabled board power and the AB3100 regulators,
put the regulator data into the device tree and enable it so
we can start to tie regulators to devices. To begin with we're
only supplying the power to the board itself.

Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-u300.dts | 79 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm/boot/dts/ste-u300.dts b/arch/arm/boot/dts/ste-u300.dts
index 784e17a..1b3ec2d 100644
--- a/arch/arm/boot/dts/ste-u300.dts
+++ b/arch/arm/boot/dts/ste-u300.dts
@@ -24,6 +24,11 @@
 		reg = <0x48000000 0x03c00000>;
 	};
 
+	s365 {
+		compatible = "stericsson,s365";
+		vana15-supply = <&ab3100_ldo_d_reg>;
+	};
+
 	timer: timer0@c0014000 {
 		compatible = "stericsson,u300-apptimer";
 		reg = <0xc0014000 0x1000>;
@@ -70,6 +75,74 @@
 		interrupts = <8>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		ab3100: ab3100@0x48 {
+			compatible = "stericsson,ab3100";
+			reg = <0x48>;
+			interrupt-parent = <&vica>;
+			interrupts = <0>; /* EXT0 IRQ */
+			ab3100-regulators {
+				compatible = "stericsson,ab3100-regulators";
+				ab3100_ldo_a_reg: ab3100_ldo_a {
+					regulator-compatible = "ab3100_ldo_a";
+					startup-delay-us = <200>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+				ab3100_ldo_c_reg: ab3100_ldo_c {
+					regulator-compatible = "ab3100_ldo_c";
+					startup-delay-us = <200>;
+				};
+				ab3100_ldo_d_reg: ab3100_ldo_d {
+					regulator-compatible = "ab3100_ldo_d";
+					startup-delay-us = <200>;
+				};
+				ab3100_ldo_e_reg: ab3100_ldo_e {
+					regulator-compatible = "ab3100_ldo_e";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					startup-delay-us = <200>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+				ab3100_ldo_f_reg: ab3100_ldo_f {
+					regulator-compatible = "ab3100_ldo_f";
+					regulator-min-microvolt = <2500000>;
+					regulator-max-microvolt = <2500000>;
+					startup-delay-us = <600>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+				ab3100_ldo_g_reg: ab3100_ldo_g {
+					regulator-compatible = "ab3100_ldo_g";
+					regulator-min-microvolt = <1500000>;
+					regulator-max-microvolt = <2850000>;
+					startup-delay-us = <400>;
+				};
+				ab3100_ldo_h_reg: ab3100_ldo_h {
+					regulator-compatible = "ab3100_ldo_h";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <2750000>;
+					startup-delay-us = <200>;
+				};
+				ab3100_ldo_k_reg: ab3100_ldo_k {
+					regulator-compatible = "ab3100_ldo_k";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <2750000>;
+					startup-delay-us = <200>;
+				};
+				ab3100_ext_reg: ab3100_ext {
+					regulator-compatible = "ab3100_ext";
+				};
+				ab3100_buck_reg: ab3100_buck {
+					regulator-compatible = "ab3100_buck";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1800000>;
+					startup-delay-us = <1000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+			};
+		};
 	};
 
 	i2c1: i2c@c0005000 {
@@ -79,6 +152,12 @@
 		interrupts = <9>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		fwcam0: fwcam@0x10 {
+			reg = <0x10>;
+		};
+		fwcam1: fwcam@0x5d {
+			reg = <0x5d>;
+		};
 	};
 
 	amba {
-- 
1.7.11.3
