From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 3/3] arm64: dts: rockchip: move QCA6174A wakeup pin into its USB node
Date: Thu, 21 Feb 2019 16:34:03 -0800
Message-ID: <20190222003403.128243-3-briannorris@chromium.org>
References: <20190222003403.128243-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222003403.128243-1-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Rajat Jain <rajatja@google.com>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Currently, we don't coordinate BT USB activity with our handling of the
BT out-of-band wake pin, and instead just use gpio-keys. That causes
problems because we have no way of distinguishing wake activity due to a
BT device (e.g., mouse) vs. the BT controller (e.g., re-configuring wake
mask before suspend). This can cause spurious wake events just because
we, for instance, try to reconfigure the host controller's event mask
before suspending.

We can avoid these synchronization problems by handling the BT wake pin
directly in the btusb driver -- for all activity up until BT controller
suspend(), we simply listen to normal USB activity (e.g., to know the
difference between device and host activity); once we're really ready to
suspend the host controller, there should be no more host activity, and
only *then* do we unmask the GPIO interrupt.

This is already supported by btusb; we just need to describe the wake
pin in the right node.

We list 2 compatible properties, since both PID/VID pairs show up on
Scarlet devices, and they're both essentially identical QCA6174A-based
modules.

Also note that the polarity was wrong before: Qualcomm implemented WAKE
as active high, not active low. We only got away with this because
gpio-keys always reconfigured us as bi-directional edge-triggered.

Finally, we have an external pull-up and a level-shifter on this line
(we didn't notice Qualcomm's polarity in the initial design), so we
can't do pull-down. Switch to pull-none.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch is also required to make this stable, but since it's not
really tied to the device tree, and it's an existing bug, I sent it
separately:

  https://lore.kernel.org/patchwork/patch/1044896/
  Subject: Bluetooth: btusb: request wake pin with NOAUTOEN

 .../dts/rockchip/rk3399-gru-chromebook.dtsi   | 13 ++++++
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi | 46 ++++++++++++-------
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi  | 13 ------
 3 files changed, 42 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index c400be64170e..931640e9aed4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -200,6 +200,19 @@
 		pinctrl-0 = <&bl_en>;
 		pwm-delay-us = <10000>;
 	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_host_wake_l>;
+
+		wake_on_bt: wake-on-bt {
+			label = "Wake-on-Bluetooth";
+			gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WAKEUP>;
+			wakeup-source;
+		};
+	};
 };
 
 &ppvar_bigcpu {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
index fc50b3ef758c..3e2196c08473 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
@@ -175,6 +175,21 @@
 		pinctrl-0 = <&dmic_en>;
 		wakeup-delay-ms = <250>;
 	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pen_eject_odl>;
+
+		pen-insert {
+			label = "Pen Insert";
+			/* Insert = low, eject = high */
+			gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+			linux,code = <SW_PEN_INSERTED>;
+			linux,input-type = <EV_SW>;
+			wakeup-source;
+		};
+	};
 };
 
 /* pp900_s0 aliases */
@@ -328,20 +343,6 @@ camera: &i2c7 {
 		<400000000>;
 };
 
-&gpio_keys {
-	pinctrl-names = "default";
-	pinctrl-0 = <&bt_host_wake_l>, <&pen_eject_odl>;
-
-	pen-insert {
-		label = "Pen Insert";
-		/* Insert = low, eject = high */
-		gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
-		linux,code = <SW_PEN_INSERTED>;
-		linux,input-type = <EV_SW>;
-		wakeup-source;
-	};
-};
-
 &i2c_tunnel {
 	google,remote-bus = <0>;
 };
@@ -437,8 +438,19 @@ camera: &i2c7 {
 	status = "okay";
 };
 
-&wake_on_bt {
-	gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
+&usb_host0_ohci {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	qca_bt: bt@1 {
+		compatible = "usb0cf3,e300", "usb04ca,301a";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_host_wake_l>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "wakeup";
+	};
 };
 
 /* PINCTRL OVERRIDES */
@@ -455,7 +467,7 @@ camera: &i2c7 {
 };
 
 &bt_host_wake_l {
-	rockchip,pins = <1 2 RK_FUNC_GPIO &pcfg_pull_up>;
+	rockchip,pins = <1 2 RK_FUNC_GPIO &pcfg_pull_none>;
 };
 
 &ec_ap_int_l {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index ea607a601a86..da03fa9c5662 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -269,19 +269,6 @@
 		#clock-cells = <0>;
 	};
 
-	gpio_keys: gpio-keys {
-		compatible = "gpio-keys";
-		pinctrl-names = "default";
-		pinctrl-0 = <&bt_host_wake_l>;
-
-		wake_on_bt: wake-on-bt {
-			label = "Wake-on-Bluetooth";
-			gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_WAKEUP>;
-			wakeup-source;
-		};
-	};
-
 	max98357a: max98357a {
 		compatible = "maxim,max98357a";
 		pinctrl-names = "default";
-- 
2.21.0.rc0.258.g878e2cd30e-goog
