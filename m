From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH v3 3/3] ARM64: dts: meson-gx: add dmcbus and canvas nodes.
Date: Thu, 23 Aug 2018 13:49:54 +0200
Message-ID: <20180823114954.30704-4-mjourdan@baylibre.com>
References: <20180823114954.30704-1-mjourdan@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823114954.30704-1-mjourdan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

DMC is a small memory region with various registers,
including the ones needed for the canvas module.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index b8dc4dbb391b..5dd63ecf8b05 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -423,6 +423,19 @@
 			};
 		};
 
+		dmcbus: bus@c8838000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xc8838000 0x0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xc8838000 0x0 0x400>;
+
+			canvas: video-lut@48 {
+				compatible = "amlogic,canvas";
+				reg = <0x0 0x48 0x0 0x14>;
+			};
+		};
+
 		hiubus: bus@c883c000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc883c000 0x0 0x2000>;
-- 
2.18.0
