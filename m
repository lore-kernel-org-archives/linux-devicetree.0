From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH 3/4] ARM64: dts: meson-gx: add vdec entry
Date: Fri, 31 Aug 2018 10:52:04 +0200
Message-ID: <20180831085205.14760-4-mjourdan@baylibre.com>
References: <20180831085205.14760-1-mjourdan@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831085205.14760-1-mjourdan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the video decoder dts entry

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 737b741df035..d9e0fea71dbe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -410,6 +410,19 @@
 			};
 		};
 
+		vdec: video-decoder@c8820000 {
+			compatible = "amlogic,gx-vdec";
+			reg = <0x0 0xc8820000 0x0 0x10000>,
+			      <0x0 0xc110a580 0x0 0xe4>;
+			reg-names = "dos", "esparser";
+
+			interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+
+			amlogic,ao-sysctrl = <&sysctrl_AO>;
+			amlogic,canvas = <&canvas>;
+		};
+
 		periphs: periphs@c8834000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc8834000 0x0 0x2000>;
-- 
2.18.0
