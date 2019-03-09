From: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Subject: [PATCH v3 2/3] arm: dts: rk3288-tinker.dtsi: Enable WiFi
Date: Sat,  9 Mar 2019 15:39:22 +0000
Message-ID: <20190309153923.22806-2-beagleboard@davidjohnsummers.uk>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190309153923.22806-1-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190309153923.22806-1-beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tony McKahan <tonymckahan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds wifi support to the ASUS Tinker Board (S) machines.

This is provided by an wifi card (RTL8723BS) wired into the sdio interface.

It requires certain pins pulled, to enable the WiFi.

The schematics for these board do not show the WiFi connection, so the
connections have been taken from:

https://github.com/TinkerBoard/debian_kernel/blob/develop/arch/arm/boot/dts/rk3288-miniarm.dts

In particular the pulling of two pins.

This patch is almost identical to v1. A few additional line breaks for
readability. On Armbian, they did not use sd-uhs-ddr50, so this has
been removed. It does not change functionality. The ASUS patch set
sd-uhs-sdr104;.

Signed-off-by: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Tested-by: Tony McKahan <tonymckahan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> 
Test-by: TheSaint @ ArchLinux ARM 

---
 arch/arm/boot/dts/rk3288-tinker.dtsi | 40 +++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
index ef653c3209bc..0ffab1b7c940 100644
--- a/arch/arm/boot/dts/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
@@ -5,6 +5,7 @@
 
 #include "rk3288.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/clock/rockchip,rk808.h>
 
 / {
 	chosen {
@@ -96,6 +97,17 @@
 		startup-delay-us = <100000>;
 		vin-supply = <&vcc_io>;
 	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rk808 RK808_CLKOUT1>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_enable>;
+		reset-gpios = <&gpio4 RK_PD3 GPIO_ACTIVE_LOW>,
+			<&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
+	};
+
 };
 
 &cpu0 {
@@ -336,7 +348,7 @@
 
 &io_domains {
 	status = "okay";
-
+	wifi-supply = <&vcc_18>;
 	sdcard-supply = <&vccio_sd>;
 };
 
@@ -416,6 +428,13 @@
 			rockchip,pins = <7 8 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	sdio {
+		wifi_enable: wifi-enable {
+			rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>,
+				<4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm0 {
@@ -440,6 +459,25 @@
 	vqmmc-supply = <&vccio_sd>;
 };
 
+&sdio0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio0_bus4>, <&sdio0_cmd>, <&sdio0_clk>, <&sdio0_int>;
+	max-frequency = <50000000>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	vmmc-supply = <&vcc_io>;
+	vqmmc-supply = <&vcc_18>;
+	status = "okay";
+};
+
+
 &tsadc {
 	rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
 	rockchip,hw-tshut-polarity = <1>; /* tshut polarity 0:LOW 1:HIGH */
-- 
beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org
