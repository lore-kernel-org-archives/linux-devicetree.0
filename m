From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: 'Fix' nanopi4 uSD card detect
Date: Mon, 14 Jan 2019 12:05:34 +0000
Message-ID: <0608599d485117a9d99f5fb274fbb1b55f6ba9f7.1547466003.git.robin.murphy@arm.com>
References: <cover.1547466003.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1547466003.git.robin.murphy@arm.com>
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
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

For whatever reason, the sdmmc_dectn function isn't working properly
as-is, and microSD insertion and removal goes unnoticed. Using the pin
as a GPIO interrupt instead is rather noisy without any debouncing, but
is good enough to make it useful until someone feels inclined to figure
out how the vendor kernel/firmware gets the dedicated function to work
with no obvious difference in the pinmux/GRF configuration. Let's also
take the opportunity to tweak the node name so that all related pins
end up grouped together in the compiled DTB.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: Clean up ordering

 .../boot/dts/rockchip/rk3399-nanopi4.dtsi     | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
index 9c723038d8f8..2d304d2df62e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
@@ -501,17 +501,21 @@
 		};
 	};
 
-	sd {
-		sdmmc0_pwr_h: sdmmc0-pwr-h {
-			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	sdio-pwrseq {
 		wifi_reg_on_h: wifi-reg_on-h {
 			rockchip,pins = <0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	sdmmc {
+		sdmmc0_det_l: sdmmc0-det-l {
+			rockchip,pins = <0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		sdmmc0_pwr_h: sdmmc0-pwr-h {
+			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pmu_io_domains {
@@ -563,9 +567,10 @@
 	bus-width = <4>;
 	cap-sd-highspeed;
 	cap-mmc-highspeed;
+	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sdmmc_bus4 &sdmmc_cd &sdmmc_clk &sdmmc_cmd>;
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc0_det_l>;
 	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v0_sd>;
 	vqmmc-supply = <&vcc_sdio>;
-- 
2.20.1.dirty
