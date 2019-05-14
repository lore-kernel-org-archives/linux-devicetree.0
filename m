From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 8/8] arm64: dts: meson: g12a: enable hdmi_tx sound dai provider
Date: Tue, 14 May 2019 16:26:49 +0200
Message-ID: <20190514142649.1127-9-jbrunet@baylibre.com>
References: <20190514142649.1127-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514142649.1127-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

At the moment the sysnopsys hdmi i2s driver provides a single playback
DAI. Add the corresponding sound-dai-cell to the hdmi device node.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index d6c6408281e9..4fd1ed4d434b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -158,6 +158,7 @@
 				clock-names = "isfr", "iahb", "venci";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				#sound-dai-cells = <0>;
 				status = "disabled";
 
 				/* VPU VENC Input */
-- 
2.20.1
