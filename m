From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 06/13] arm64: dts: rockchip: add emmc-powersequence to px30-evb
Date: Tue, 17 Sep 2019 10:26:52 +0200
Message-ID: <20190917082659.25549-6-heiko@sntech.de>
References: <20190917082659.25549-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917082659.25549-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Hook the reset line into an emmc-pwrseq for it to get initialized nicely.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/px30-evb.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index d78fb172a66f..6d50f6abcb48 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -61,6 +61,13 @@
 		power-supply = <&vcc3v3_lcd>;
 	};
 
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		pinctrl-0 = <&emmc_reset>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
+	};
+
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		pinctrl-names = "default";
@@ -110,6 +117,7 @@
 	cap-mmc-highspeed;
 	mmc-hs200-1_8v;
 	non-removable;
+	mmc-pwrseq = <&emmc_pwrseq>;
 	vmmc-supply = <&vcc_3v0>;
 	vqmmc-supply = <&vccio_flash>;
 	status = "okay";
@@ -364,6 +372,12 @@
 		};
 	};
 
+	emmc {
+		emmc_reset: emmc-reset {
+			rockchip,pins = <1 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int: pmic_int {
 			rockchip,pins =
-- 
2.20.1
