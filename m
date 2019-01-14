From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH] arm64: dts: meson-gx: Add canvas provider node to the vpu
Date: Mon, 14 Jan 2019 17:22:29 +0100
Message-ID: <20190114162229.5412-1-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Allows the vpu driver to optionally use a canvas provider node.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 44c5c51ff1fa..9b0ac183ee0c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -510,6 +510,7 @@
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			amlogic,canvas = <&canvas>;
 
 			/* CVBS VDAC output port */
 			cvbs_vdac_port: port@0 {
-- 
2.20.1
