From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 2/2] ARM: dts: rockchip: enable pwm3 as pwm regulator for rk3066a based boards
Date: Fri, 15 Jan 2016 21:26:18 +0800
Message-ID: <1452864378-554-1-git-send-email-andy.yan@rock-chips.com>
References: <1452864223-423-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452864223-423-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, inux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rayeager/Bqcurie2/Marsboard use pwm3 modulate the vdd_logic voltage,
so enable it.

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v2:
- also enable the pwm regulator for bqcurie2 and Marsboard

 arch/arm/boot/dts/rk3066a-bqcurie2.dts  | 16 ++++++++++++++++
 arch/arm/boot/dts/rk3066a-marsboard.dts | 16 ++++++++++++++++
 arch/arm/boot/dts/rk3066a-rayeager.dts  | 16 ++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-bqcurie2.dts b/arch/arm/boot/dts/rk3066a-bqcurie2.dts
index 38c91a8..90a4c4d 100644
--- a/arch/arm/boot/dts/rk3066a-bqcurie2.dts
+++ b/arch/arm/boot/dts/rk3066a-bqcurie2.dts
@@ -53,6 +53,18 @@
 		reg = <0x60000000 0x40000000>;
 	};
 
+	pwm_regulator: pwm-regulator {
+		compatible = "pwm-regulator";
+		pwms = <&pwm3 0 1000>;
+		regulator-name = "vdd_logic";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		voltage-table = <1000000 100>,
+				<1200000 42>;
+		status = "okay";
+	};
+
 	vcc_sd0: fixed-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "sdmmc-supply";
@@ -203,6 +215,10 @@
 	disable-wp;
 };
 
+&pwm3 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/rk3066a-marsboard.dts b/arch/arm/boot/dts/rk3066a-marsboard.dts
index 7cdc308..4852e32 100644
--- a/arch/arm/boot/dts/rk3066a-marsboard.dts
+++ b/arch/arm/boot/dts/rk3066a-marsboard.dts
@@ -52,6 +52,18 @@
 		reg = <0x60000000 0x40000000>;
 	};
 
+	pwm_regulator: pwm-regulator {
+		compatible = "pwm-regulator";
+		pwms = <&pwm3 0 1000>;
+		regulator-name = "vdd_logic";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		voltage-table = <1000000 100>,
+				<1200000 42>;
+		status = "okay";
+	};
+
 	vcc_sd0: sdmmc-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "sdmmc-supply";
@@ -194,6 +206,10 @@
 	};
 };
 
+&pwm3 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/rk3066a-rayeager.dts b/arch/arm/boot/dts/rk3066a-rayeager.dts
index 0bf6876..7127e3f 100644
--- a/arch/arm/boot/dts/rk3066a-rayeager.dts
+++ b/arch/arm/boot/dts/rk3066a-rayeager.dts
@@ -78,6 +78,18 @@
 		};
 	};
 
+	pwm_regulator: pwm-regulator {
+		compatible = "pwm-regulator";
+		pwms = <&pwm3 0 1000>;
+		regulator-name = "vdd_logic";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		voltage-table = <1000000 100>,
+				<1200000 42>;
+		status = "okay";
+	};
+
 	vsys: vsys-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vsys";
@@ -435,6 +447,10 @@
 	status = "okay";
 };
 
+&pwm3 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcc_25>;
 	status = "okay";
-- 
1.9.1



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
