From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 6/6] arm64: dts: meson: vim2: remove sd hs and hs400 modes from emmc
Date: Thu, 18 Apr 2019 14:27:14 +0200
Message-ID: <20190418122714.30805-7-jbrunet@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

sd highspeed mode make no sense for an eMMC and HS400 is not working
at the moment.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 766194ab0aa8..c5f3f90a42ae 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -372,14 +372,12 @@
 	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <8>;
-	cap-sd-highspeed;
 	cap-mmc-highspeed;
 	max-frequency = <200000000>;
 	non-removable;
 	disable-wp;
 	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
-	mmc-hs400-1_8v;
 
 	mmc-pwrseq = <&emmc_pwrseq>;
 	vmmc-supply = <&vcc_3v3>;
-- 
2.20.1
