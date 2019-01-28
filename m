From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 4.20 131/304] arm64: dts: rockchip: fix
 rk3399-rockpro64 regulator gpios
Date: Mon, 28 Jan 2019 10:40:48 -0500
Message-ID: <20190128154341.47195-131-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190128154341.47195-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Oskari Lemmela <oskari-fV/XPr6JiiHR7s880joybQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Oskari Lemmela <oskari-fV/XPr6JiiHR7s880joybQ@public.gmane.org>

[ Upstream commit 690e16bada6029694740d5501025faf483d14339 ]

Rockpro64 is not able boot if GPIO1_C1 pin is pulled high
before loading linux kernel.

In rockpro64 GPIO1_C1 pin is connected vdd_cpu_b regulator
VSEL pin. Pin should be pulled down in normal operation and
pulled high in suspend.

PMIC LDO_REG2 is connected to touch panel connector.
Rename regulator and set it to correct voltage.

PCIe power is controller by GPIO1_D0.

Schematics can be downloaded from:
http://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf

Signed-off-by: Oskari Lemmela <oskari-fV/XPr6JiiHR7s880joybQ@public.gmane.org>
Acked-by: Akash Gajjar <Akash_Gajjar-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../boot/dts/rockchip/rk3399-rockpro64.dts    | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index 1d35f5406b5e..5bd4d69914bd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -97,7 +97,7 @@
 	vcc3v3_pcie: vcc3v3-pcie-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_pwr_en>;
 		regulator-name = "vcc3v3_pcie";
@@ -293,12 +293,12 @@
 				};
 			};
 
-			vcc2v8_dvp: LDO_REG2 {
-				regulator-name = "vcc2v8_dvp";
+			vcc3v0_touch: LDO_REG2 {
+				regulator-name = "vcc3v0_touch";
 				regulator-always-on;
 				regulator-boot-on;
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -397,7 +397,9 @@
 	vdd_cpu_b: regulator@40 {
 		compatible = "silergy,syr827";
 		reg = <0x40>;
-		fcs,suspend-voltage-selector = <0>;
+		fcs,suspend-voltage-selector = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel1_gpio>;
 		regulator-name = "vdd_cpu_b";
 		regulator-min-microvolt = <712500>;
 		regulator-max-microvolt = <1500000>;
@@ -415,6 +417,8 @@
 		compatible = "silergy,syr828";
 		reg = <0x41>;
 		fcs,suspend-voltage-selector = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel2_gpio>;
 		regulator-name = "vdd_gpu";
 		regulator-min-microvolt = <712500>;
 		regulator-max-microvolt = <1500000>;
@@ -519,7 +523,7 @@
 
 	pcie {
 		pcie_pwr_en: pcie-pwr-en {
-			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <1 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
@@ -529,7 +533,7 @@
 		};
 
 		vsel1_gpio: vsel1-gpio {
-			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
 		vsel2_gpio: vsel2-gpio {
-- 
2.19.1
