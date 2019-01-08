From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 5/5] arm64: dts: rockchip: Fix nanopi4 uSD card detect
Date: Tue,  8 Jan 2019 21:57:27 +0000
Message-ID: <83098c7ecc471a77dd89564f5f98fcf30c1ed431.1546981251.git.robin.murphy@arm.com>
References: <cover.1546981251.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1546981251.git.robin.murphy@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, tomeu.vizoso@collabora.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

For whatever reason, the sdmmc_dectn function isn't working properly
as-is, and microSD insertion and removal goes unnoticed. Flipping the
pin into GPIO mode, however, does do the job, so let's just handle it
that way for now until someone feels inclined to figure out what GRF
voodoo or otherwise is needed for correct 'native' operation.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
index 9c723038d8f8..2a183a6af150 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
@@ -505,6 +505,10 @@
 		sdmmc0_pwr_h: sdmmc0-pwr-h {
 			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+
+		sdmmc0_det_l: sdmmc0-det-l {
+			rockchip,pins = <0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
 	};
 
 	sdio-pwrseq {
@@ -563,9 +567,10 @@
 	bus-width = <4>;
 	cap-sd-highspeed;
 	cap-mmc-highspeed;
+	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sdmmc_bus4 &sdmmc_cd &sdmmc_clk &sdmmc_cmd>;
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc0_det_l &sdmmc_clk &sdmmc_cmd>;
 	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v0_sd>;
 	vqmmc-supply = <&vcc_sdio>;
-- 
2.17.1
