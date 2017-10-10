From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] ARM64: dts: meson-gxm: enable HS400 on the vim2
Date: Tue, 10 Oct 2017 16:18:22 +0200
Message-ID: <20171010141822.16266-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable HS400 high speed eMMC mode on the khadas vim2

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 32c138ec0e58..34a41b26a4ed 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -348,6 +348,7 @@
 	disable-wp;
 	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
 
 	mmc-pwrseq = <&emmc_pwrseq>;
 	vmmc-supply = <&vcc_3v3>;
-- 
2.13.6
