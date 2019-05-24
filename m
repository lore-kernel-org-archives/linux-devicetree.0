From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] arm64: dts: meson: add dwmac-3.70a to ethmac compatible list
Date: Fri, 24 May 2019 15:08:17 +0200
Message-ID: <20190524130817.18920-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

After discussing with Amlogic, the Synopsys GMAC version used by
the gx and axg family is the 3.70a. Set this is in DT

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi,

 The same should be true for the meson8 families but I did not test
 it which is why only the patch only address the 64bits SoC families

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 +++-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 38169c85e91f..6219337033a0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -171,7 +171,9 @@
 		ranges;
 
 		ethmac: ethernet@ff3f0000 {
-			compatible = "amlogic,meson-axg-dwmac", "snps,dwmac";
+			compatible = "amlogic,meson-axg-dwmac",
+				     "snps,dwmac-3.70a",
+				     "snps,dwmac";
 			reg = <0x0 0xff3f0000 0x0 0x10000
 			       0x0 0xff634540 0x0 0x8>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 6772709b9e19..74d03fc706be 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -486,7 +486,9 @@
 		};
 
 		ethmac: ethernet@c9410000 {
-			compatible = "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+			compatible = "amlogic,meson-gxbb-dwmac",
+				     "snps,dwmac-3.70a",
+				     "snps,dwmac";
 			reg = <0x0 0xc9410000 0x0 0x10000
 			       0x0 0xc8834540 0x0 0x4>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.20.1
