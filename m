From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: [PATCH 3/3] This patch adds wifi to asus tinker board S
Date: Sat, 22 Sep 2018 18:02:36 +0100
Message-ID: <20180922170236.8690-4-beagleboard@davidjohnsummers.uk>
References: <20180922170236.8690-1-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180922170236.8690-1-beagleboard@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rockchip@lists.infradead.org, David Summers <beagleboard@davidjohnsummers.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now as fair as I understand. the asus tinker board contains a wifi
So should this patch be added to the tinker board dtsi ?

It also far move complex - it adds far more things, so consider

Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
---
 arch/arm/boot/dts/rk3288-tinker-s.dts | 93 +++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-tinker-s.dts b/arch/arm/boot/dts/rk3288-tinker-s.dts
index bc691e3f9c07..3d91924fd8db 100644
--- a/arch/arm/boot/dts/rk3288-tinker-s.dts
+++ b/arch/arm/boot/dts/rk3288-tinker-s.dts
@@ -10,6 +10,95 @@
 / {
 	model = "Rockchip RK3288 Asus Tinker Board S";
 	compatible = "asus,rk3288-tinker-s", "rockchip,rk3288";
+
+	wireless-bluetooth {
+		compatible = "bluetooth-platdata";
+		uart_rts_gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default","rts_gpio";
+		pinctrl-0 = <&uart0_rts>;
+		pinctrl-1 = <&uart0_gpios>;
+		BT,reset_gpio    = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		BT,wake_gpio     = <&gpio4 26 GPIO_ACTIVE_HIGH>;
+		BT,wake_host_irq = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+
+	wireless-wlan {
+		compatible = "wlan-platdata";
+		rockchip,grf = <&grf>;
+		wifi_chip_type = "ap6212";
+		sdio_vref = <1800>;
+		WIFI,host_wake_irq = <&gpio4 30 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+
+	io-domains {
+		compatible = "rockchip,rk3288-io-voltage-domain";
+		rockchip,grf = <&grf>;
+		flash0-supply = <&vcc_flash>;
+		gpio30-supply = <&vcc_io>;
+		wifi-supply = <&vcc_18>;
+		sdcard-supply = <&vccio_sd>;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rk808 1>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&chip_enable_h>, <&wifi_enable_h>;
+
+		/*
+		 * On the module itself this is one of these (depending
+		 * on the actual card populated):
+		 * - SDIO_RESET_L_WL_REG_ON
+		 * - PDN (power down when low)
+		 */
+		reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>, <&gpio4 27 GPIO_ACTIVE_LOW>;
+	};
+
+	vcc_flash: flash-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_flash";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_io>;
+	};
+};
+
+&pinctrl {
+	sdio-pwrseq {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins = <4 28 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		chip_enable_h: chip-enable-h {
+			rockchip,pins = <4 27 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wireless-bluetooth {
+		uart0_gpios: uart0-gpios {
+			rockchip,pins = <4 19 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&sdio0 {
+	status = "okay";
+	clock-frequency = <50000000>;
+	clock-freq-min-max = <200000 50000000>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	num-slots = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
+	sd-uhs-sdr104;
+	supports-sdio;
 };
 
 &emmc {
@@ -25,3 +114,7 @@
 	mmc-ddr-1_8v;
 	status = "okay";
 };
+
+&uart0 {
+	pinctrl-0 = <&uart0_xfer>, <&uart0_cts>;
+};
-- 
David Summers <beagleboard@davididjohnsummers.uk>
