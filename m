From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 2/2] ARM: dts: rockchip: consolidate veyron panel and
 backlight settings
Date: Tue, 25 Jun 2019 15:26:29 -0700
Message-ID: <20190625222629.154619-2-mka@chromium.org>
References: <20190625222629.154619-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190625222629.154619-1-mka@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-rockchip@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>, Douglas Anderson <dianders@chromium.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

veyron jaq, jerry, minnie and speedy have mostly redundant regulator
and pinctrl configurations for the panel/backlight. Consolidate these
pieces in the eDP .dtsi.

Also change the default power supply for the panel to
'panel_regulator', instead of overriding it in all the board files.
pinky is the only device that uses 'vcc33_lcd' (the prior default),
so overwrite it in this case. pinky doesn't have a complete display
configuration, to keep things as they were delete the common nodes
that didn't exist previously in pinky's board file.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
This change should be a nop, the only deltas I see when comparing
decompiled .dtb files are phandle ids.
---
 arch/arm/boot/dts/rk3288-veyron-edp.dtsi   | 51 ++++++++++++++++++-
 arch/arm/boot/dts/rk3288-veyron-jaq.dts    | 55 --------------------
 arch/arm/boot/dts/rk3288-veyron-jerry.dts  | 58 ----------------------
 arch/arm/boot/dts/rk3288-veyron-minnie.dts | 52 -------------------
 arch/arm/boot/dts/rk3288-veyron-pinky.dts  | 17 +++++++
 arch/arm/boot/dts/rk3288-veyron-speedy.dts | 58 ----------------------
 6 files changed, 67 insertions(+), 224 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-edp.dtsi b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
index 5d812e9e78aa..39f56d36a701 100644
--- a/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
@@ -6,6 +6,40 @@
  */
 
 / {
+	backlight_regulator: backlight-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bl_pwr_en>;
+		regulator-name = "backlight_regulator";
+		vin-supply = <&vcc33_sys>;
+		startup-delay-us = <15000>;
+	};
+
+	panel_regulator: panel-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio7 RK_PB6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_enable_h>;
+		regulator-name = "panel_regulator";
+		startup-delay-us = <100000>;
+		vin-supply = <&vcc33_sys>;
+	};
+
+	vcc18_lcd: vcc18-lcd {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&avdd_1v8_disp_en>;
+		regulator-name = "vcc18_lcd";
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc18_wl>;
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		brightness-levels = <
@@ -48,12 +82,13 @@
 		pwms = <&pwm0 0 1000000 0>;
 		post-pwm-on-delay-ms = <10>;
 		pwm-off-delay-ms = <10>;
+		power-supply = <&backlight_regulator>;
 	};
 
 	panel: panel {
 		compatible ="innolux,n116bge", "simple-panel";
 		status = "okay";
-		power-supply = <&vcc33_lcd>;
+		power-supply = <&panel_regulator>;
 		backlight = <&backlight>;
 
 		panel-timing {
@@ -105,10 +140,24 @@
 
 &pinctrl {
 	backlight {
+		bl_pwr_en: bl_pwr_en {
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		bl_en: bl-en {
 			rockchip,pins = <7 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	lcd {
+		lcd_enable_h: lcd-en {
+			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		avdd_1v8_disp_en: avdd-1v8-disp-en {
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm0 {
diff --git a/arch/arm/boot/dts/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
index fcd119168cb6..80386203e85b 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jaq.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
@@ -16,40 +16,6 @@
 		     "google,veyron-jaq-rev3", "google,veyron-jaq-rev2",
 		     "google,veyron-jaq-rev1", "google,veyron-jaq",
 		     "google,veyron", "rockchip,rk3288";
-
-	panel_regulator: panel-regulator {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio7 RK_PB6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&lcd_enable_h>;
-		regulator-name = "panel_regulator";
-		startup-delay-us = <100000>;
-		vin-supply = <&vcc33_sys>;
-	};
-
-	vcc18_lcd: vcc18-lcd {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&avdd_1v8_disp_en>;
-		regulator-name = "vcc18_lcd";
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&vcc18_wl>;
-	};
-
-	backlight_regulator: backlight-regulator {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&bl_pwr_en>;
-		regulator-name = "backlight_regulator";
-		vin-supply = <&vcc33_sys>;
-		startup-delay-us = <15000>;
-	};
 };
 
 &backlight {
@@ -87,11 +53,6 @@
 		232 233 234 235 236 237 238 239
 		240 241 242 243 244 245 246 247
 		248 249 250 251 252 253 254 255>;
-	power-supply = <&backlight_regulator>;
-};
-
-&panel {
-	power-supply = <&panel_regulator>;
 };
 
 &rk808 {
@@ -343,12 +304,6 @@
 };
 
 &pinctrl {
-	backlight {
-		bl_pwr_en: bl_pwr_en {
-			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	buck-5v {
 		drv_5v: drv-5v {
 			rockchip,pins = <7 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -361,16 +316,6 @@
 		};
 	};
 
-	lcd {
-		lcd_enable_h: lcd-en {
-			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		avdd_1v8_disp_en: avdd-1v8-disp-en {
-			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	pmic {
 		dvs_1: dvs-1 {
 			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>;
diff --git a/arch/arm/boot/dts/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
index 164561f04c1d..a8f55aec09ee 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jerry.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
@@ -18,48 +18,6 @@
 		     "google,veyron-jerry-rev5", "google,veyron-jerry-rev4",
 		     "google,veyron-jerry-rev3", "google,veyron-jerry",
 		     "google,veyron", "rockchip,rk3288";
-
-	panel_regulator: panel-regulator {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio7 RK_PB6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&lcd_enable_h>;
-		regulator-name = "panel_regulator";
-		startup-delay-us = <100000>;
-		vin-supply = <&vcc33_sys>;
-	};
-
-	vcc18_lcd: vcc18-lcd {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&avdd_1v8_disp_en>;
-		regulator-name = "vcc18_lcd";
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&vcc18_wl>;
-	};
-
-	backlight_regulator: backlight-regulator {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&bl_pwr_en>;
-		regulator-name = "backlight_regulator";
-		vin-supply = <&vcc33_sys>;
-		startup-delay-us = <15000>;
-	};
-};
-
-&backlight {
-	power-supply = <&backlight_regulator>;
-};
-
-&panel {
-	power-supply= <&panel_regulator>;
 };
 
 &rk808 {
@@ -311,12 +269,6 @@
 };
 
 &pinctrl {
-	backlight {
-		bl_pwr_en: bl_pwr_en {
-			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	buck-5v {
 		drv_5v: drv-5v {
 			rockchip,pins = <7 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -329,16 +281,6 @@
 		};
 	};
 
-	lcd {
-		lcd_enable_h: lcd-en {
-			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		avdd_1v8_disp_en: avdd-1v8-disp-en {
-			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	pmic {
 		dvs_1: dvs-1 {
 			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>;
diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index b3f3d5494674..77e7a30d9401 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -15,40 +15,6 @@
 		     "google,veyron-minnie-rev0", "google,veyron-minnie",
 		     "google,veyron", "rockchip,rk3288";
 
-	backlight_regulator: backlight-regulator {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&bl_pwr_en>;
-		regulator-name = "backlight_regulator";
-		vin-supply = <&vcc33_sys>;
-		startup-delay-us = <15000>;
-	};
-
-	panel_regulator: panel-regulator {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio7 RK_PB6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&lcd_enable_h>;
-		regulator-name = "panel_regulator";
-		startup-delay-us = <100000>;
-		vin-supply = <&vcc33_sys>;
-	};
-
-	vcc18_lcd: vcc18-lcd {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&avdd_1v8_disp_en>;
-		regulator-name = "vcc18_lcd";
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&vcc18_wl>;
-	};
-
 	volume_buttons: volume-buttons {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -105,7 +71,6 @@
 			232 233 234 235 236 237 238 239
 			240 241 242 243 244 245 246 247
 			248 249 250 251 252 253 254 255>;
-	power-supply = <&backlight_regulator>;
 	post-pwm-on-delay-ms = <200>;
 	pwm-off-delay-ms = <200>;
 };
@@ -139,7 +104,6 @@
 
 &panel {
 	compatible = "auo,b101ean01", "simple-panel";
-	power-supply= <&panel_regulator>;
 
 	/delete-node/ panel-timing;
 
@@ -413,12 +377,6 @@
 };
 
 &pinctrl {
-	backlight {
-		bl_pwr_en: bl_pwr_en {
-			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	buck-5v {
 		drv_5v: drv-5v {
 			rockchip,pins = <7 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -441,16 +399,6 @@
 		};
 	};
 
-	lcd {
-		lcd_enable_h: lcd-en {
-			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		avdd_1v8_disp_en: avdd-1v8-disp-en {
-			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	pmic {
 		dvs_1: dvs-1 {
 			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>;
diff --git a/arch/arm/boot/dts/rk3288-veyron-pinky.dts b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
index 9b6f4d9b03b6..06af58e37a4b 100644
--- a/arch/arm/boot/dts/rk3288-veyron-pinky.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
@@ -14,7 +14,14 @@
 	compatible = "google,veyron-pinky-rev2", "google,veyron-pinky",
 		     "google,veyron", "rockchip,rk3288";
 
+	/delete-node/backlight-regulator;
+	/delete-node/panel-regulator;
 	/delete-node/emmc-pwrseq;
+	/delete-node/vcc18-lcd;
+};
+
+&backlight {
+	/delete-property/power-supply;
 };
 
 &emmc {
@@ -52,7 +59,17 @@
 	i2c-scl-rising-time-ns = <300>;
 };
 
+&panel {
+	power-supply= <&vcc33_lcd>;
+};
+
 &pinctrl {
+	/delete-node/ lcd;
+
+	backlight {
+		/delete-node/ bl_pwr_en;
+	};
+
 	buttons {
 		pwr_key_h: pwr-key-h {
 			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
index 9b140db04456..2f2989bc3f9c 100644
--- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -16,44 +16,6 @@
 		     "google,veyron-speedy-rev5", "google,veyron-speedy-rev4",
 		     "google,veyron-speedy-rev3", "google,veyron-speedy-rev2",
 		     "google,veyron-speedy", "google,veyron", "rockchip,rk3288";
-
-	panel_regulator: panel-regulator {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio7 RK_PB6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&lcd_enable_h>;
-		regulator-name = "panel_regulator";
-		startup-delay-us = <100000>;
-		vin-supply = <&vcc33_sys>;
-	};
-
-	vcc18_lcd: vcc18-lcd {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&avdd_1v8_disp_en>;
-		regulator-name = "vcc18_lcd";
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&vcc18_wl>;
-	};
-
-	backlight_regulator: backlight-regulator {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&bl_pwr_en>;
-		regulator-name = "backlight_regulator";
-		vin-supply = <&vcc33_sys>;
-		startup-delay-us = <15000>;
-	};
-};
-
-&backlight {
-	power-supply = <&backlight_regulator>;
 };
 
 &cpu_alert0 {
@@ -83,10 +45,6 @@
 	temperature = <90000>;
 };
 
-&panel {
-	power-supply= <&panel_regulator>;
-};
-
 &rk808 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pmic_int_l>;
@@ -321,12 +279,6 @@
 };
 
 &pinctrl {
-	backlight {
-		bl_pwr_en: bl_pwr_en {
-			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	buck-5v {
 		drv_5v: drv-5v {
 			rockchip,pins = <7 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -339,16 +291,6 @@
 		};
 	};
 
-	lcd {
-		lcd_enable_h: lcd-en {
-			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		avdd_1v8_disp_en: avdd-1v8-disp-en {
-			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	pmic {
 		dvs_1: dvs-1 {
 			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>;
-- 
2.22.0.410.gd8fdbe21b5-goog
