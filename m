From: Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2] arm64: dts: rockchip: add USB 2.0 and 3.0 support on Ficus
 board
Date: Sat, 14 Jul 2018 14:09:22 -0300
Message-ID: <20180714170922.4433-1-ezequiel@collabora.com>
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
To: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Enric Balletbo i Serra <enric.balletbo@collabora.com>

The board exposes two types A ports, one is USB 3.0, up to 5.0Gbps and
another one is USB 2.0 up to 480Mbps. Enable the USB PHYs and the USB
controllers to enable theses devices.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes from v1:
 * Provide voltage for vcc5v0_host and vcc3v3_pcie regulators
 * Provide vin_supply for vcc5v0_host.

 arch/arm64/boot/dts/rockchip/rk3399-ficus.dts | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts b/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts
index 0d14183dd4a9..6295483b701f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts
@@ -58,9 +58,24 @@
 		pinctrl-0 = <&pcie_drv>;
 		regulator-boot-on;
 		regulator-name = "vcc3v3_pcie";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc3v3_sys>;
 	};
 
+	vcc5v0_host: vcc5v0-host-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 27 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&host_vbus_drv>;
+		regulator-name = "vcc5v0_host";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&vcc_sys>;
+	};
+
 	vdd_log: vdd-log {
 		compatible = "pwm-regulator";
 		pwms = <&pwm2 0 25000 0>;
@@ -454,6 +469,13 @@
 				<1 14 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
+
+	usb2 {
+		host_vbus_drv: host-vbus-drv {
+			rockchip,pins =
+				<4 27 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm2 {
@@ -487,6 +509,40 @@
 	status = "okay";
 };
 
+&tcphy0 {
+	status = "okay";
+};
+
+&tcphy1 {
+	status = "okay";
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy0_host {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
+&u2phy1_host {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_xfer &uart0_cts>;
@@ -497,6 +553,40 @@
 	status = "okay";
 };
 
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usbdrd3_0 {
+	status = "okay";
+};
+
+&usbdrd_dwc3_0 {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&usbdrd3_1 {
+	status = "okay";
+};
+
+&usbdrd_dwc3_1 {
+	status = "okay";
+	dr_mode = "host";
+};
+
 &vopb {
 	status = "okay";
 };
-- 
2.18.0
