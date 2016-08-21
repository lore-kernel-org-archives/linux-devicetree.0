From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 8/9] ARM: dts: sun9i: cubieboard4: Add AXP806
 PMIC device node and regulators
Date: Sun, 21 Aug 2016 10:11:24 +0800
Message-ID: <20160821021125.1521-9-wens@csie.org>
References: <20160821021125.1521-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB2FV4S6QKGQEAP63NRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160821021125.1521-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The AXP806 PMIC is the secondary PMIC. It provides various supply
voltages for the SoC and other peripherals. The PMIC's interrupt
line is connected to NMI pin of the SoC.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 112 ++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
index 910b29f0f0b5..e38ac4fec10c 100644
--- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
+++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
@@ -260,6 +260,118 @@
 		};
 	};
 
+	axp806: pmic@745 {
+		compatible = "x-powers,axp806";
+		reg = <0x745>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		bldoin-supply = <&reg_dcdce>;
+
+		regulators {
+			reg_s_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-name = "avcc";
+			};
+
+			aldo2 {
+				/*
+				 * unused, but use a different name to
+				 * avoid name clash with axp809's aldo's
+				 */
+				regulator-name = "s_aldo2";
+			};
+
+			aldo3 {
+				/*
+				 * unused, but use a different name to
+				 * avoid name clash with axp809's aldo's
+				 */
+				regulator-name = "s_aldo3";
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1620000>;
+				regulator-max-microvolt = <1980000>;
+				regulator-name = "vcc18-efuse-adc-display-csi";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-always-on;
+				regulator-min-microvolt = <1620000>;
+				regulator-max-microvolt = <1980000>;
+				regulator-name =
+					"vdd18-drampll-vcc18-pll-cpvdd";
+			};
+
+			bldo3 {
+				/* unused */
+			};
+
+			reg_bldo4: bldo4 {
+				regulator-min-microvolt = <1080000>;
+				regulator-max-microvolt = <1320000>;
+				regulator-name = "vcc12-hsic";
+			};
+
+			reg_cldo1: cldo1 {
+				/*
+				 * This was 3V in the original design, but
+				 * 3.3V is the recommended supply voltage
+				 * for the Ethernet PHY.
+				 */
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-gmac-phy";
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-name = "afvcc-cam";
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-name = "vcc-io-wifi-codec-io2";
+			};
+
+			reg_dcdca: dcdca {
+				regulator-always-on;
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-cpub";
+			};
+
+			reg_dcdcd: dcdcd {
+				regulator-always-on;
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-vpu";
+			};
+
+			reg_dcdce: dcdce {
+				regulator-always-on;
+				regulator-min-microvolt = <2100000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-name = "vcc-bldo-codec-ldoin";
+			};
+
+			sw {
+				/*
+				 * unused, but use a different name to
+				 * avoid name clash with axp809's sw
+				 */
+				regulator-name = "s_sw";
+			};
+		};
+	};
+
 	ac100: codec@e89 {
 		compatible = "x-powers,ac100";
 		reg = <0xe89>;
-- 
2.9.3
