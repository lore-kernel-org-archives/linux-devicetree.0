From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] ARM: ux500: Move GPIO regulator for SD-card into board DTSs
Date: Mon, 20 Apr 2015 16:02:31 +0200
Message-ID: <1429538553-17366-2-git-send-email-ulf.hansson@linaro.org>
References: <1429538553-17366-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429538553-17366-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The GPIO regulator for the SD-card isn't a ux500 SOC configuration, but
instead it's specific to the board. Move the definition of it, into the
board DTSs.

Fixes: c94a4ab7af3f ("ARM: ux500: Disable the MMCI gpio-regulator by default")
Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi  | 17 -----------------
 arch/arm/boot/dts/ste-href.dtsi    | 17 +++++++++++++++++
 arch/arm/boot/dts/ste-snowball.dts | 15 +++++++++++++++
 3 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index bfd3f1c..2201cd5 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -1017,23 +1017,6 @@
 			status = "disabled";
 		};
 
-		vmmci: regulator-gpio {
-			compatible = "regulator-gpio";
-
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2900000>;
-			regulator-name = "mmci-reg";
-			regulator-type = "voltage";
-
-			startup-delay-us = <100>;
-			enable-active-high;
-
-			states = <1800000 0x1
-				  2900000 0x0>;
-
-			status = "disabled";
-		};
-
 		mcde@a0350000 {
 			compatible = "stericsson,mcde";
 			reg = <0xa0350000 0x1000>, /* MCDE */
diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
index bf8f0ed..8cf499a 100644
--- a/arch/arm/boot/dts/ste-href.dtsi
+++ b/arch/arm/boot/dts/ste-href.dtsi
@@ -111,6 +111,23 @@
 			pinctrl-1 = <&i2c3_sleep_mode>;
 		};
 
+		vmmci: regulator-gpio {
+			compatible = "regulator-gpio";
+
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-name = "mmci-reg";
+			regulator-type = "voltage";
+
+			startup-delay-us = <100>;
+			enable-active-high;
+
+			states = <1800000 0x1
+				  2900000 0x0>;
+
+			status = "disabled";
+		};
+
 		// External Micro SD slot
 		sdi0_per1@80126000 {
 			arm,primecell-periphid = <0x10480180>;
diff --git a/arch/arm/boot/dts/ste-snowball.dts b/arch/arm/boot/dts/ste-snowball.dts
index 206826a..65a7f63 100644
--- a/arch/arm/boot/dts/ste-snowball.dts
+++ b/arch/arm/boot/dts/ste-snowball.dts
@@ -146,8 +146,23 @@
 		};
 
 		vmmci: regulator-gpio {
+			compatible = "regulator-gpio";
+
 			gpios = <&gpio7 4 0x4>;
 			enable-gpio = <&gpio6 25 0x4>;
+
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-name = "mmci-reg";
+			regulator-type = "voltage";
+
+			startup-delay-us = <100>;
+			enable-active-high;
+
+			states = <1800000 0x1
+				  2900000 0x0>;
+
+			status = "disabled";
 		};
 
 		// External Micro SD slot
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
