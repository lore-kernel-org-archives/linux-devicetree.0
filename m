From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: g12a: audio clock controller provides resets
Date: Tue, 20 Aug 2019 14:15:50 +0200
Message-ID: <20190820121551.18398-2-jbrunet@baylibre.com>
References: <20190820121551.18398-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820121551.18398-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The clock controller dedicated to audio clocks also provides reset lines
on the g12 SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 809f741a82ec..8eb92edb7a66 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -1477,6 +1477,7 @@
 					compatible = "amlogic,g12a-audio-clkc";
 					reg = <0x0 0x0 0x0 0xb4>;
 					#clock-cells = <1>;
+					#reset-cells = <1>;
 
 					clocks = <&clkc CLKID_AUDIO>,
 						 <&clkc CLKID_MPLL0>,
-- 
2.21.0
