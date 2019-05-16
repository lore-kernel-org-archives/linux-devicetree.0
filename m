From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] arm64: dts: meson: g12a: add tohdmitx
Date: Thu, 16 May 2019 16:32:16 +0200
Message-ID: <20190516143216.6193-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the hdmitx glue device linking the SoC audio interfaces to the
embedded Synopsys hdmi controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi Kevin,

 The related device driver and dt-binding have been merged in the ASoC
 tree, for-5.3 branch [0]

 This patch is based on the audio series I have just sent [1]. Like the
 patches I have sent this week, they are all based on Linus's master
 branch. This is done so it applies nicely when setup your branch based
 on 5.2-rc1

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-5.3
[1]: https://lkml.kernel.org/r/20190514142649.1127-1-jbrunet@baylibre.com

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 3c92d165621c..90da7cc81681 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -1677,6 +1677,14 @@
 					clock-names = "pclk", "mclk";
 					status = "disabled";
 				};
+
+				tohdmitx: audio-controller@744 {
+					compatible = "amlogic,g12a-tohdmitx";
+					reg = <0x0 0x744 0x0 0x4>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "TOHDMITX";
+					status = "disabled";
+				};
 			};
 
 			usb3_pcie_phy: phy@46000 {
-- 
2.20.1
