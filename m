From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 4/5] ARM: dts: sun7i: Add CSI0 controller
Date: Thu, 14 Mar 2019 22:17:48 +0100
Message-ID: <2323d3efb4d654a162db0c856c779319b2498413.1552598161.git-series.maxime.ripard@bootlin.com>
References: <cover.f6227e6c3d38ac887e358a1f54c5581c254da1bd.1552598161.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.f6227e6c3d38ac887e358a1f54c5581c254da1bd.1552598161.git-series.maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

The CSI controller embedded in the A20 can be supported by our new driver.
Let's add it to our DT.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 641a8fa6d428..0eade0805fb0 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -376,6 +376,17 @@
 			num-cs = <1>;
 		};
 
+		csi0: csi@1c09000 {
+			compatible = "allwinner,sun7i-a20-csi0",
+				     "allwinner,sun4i-a10-csi0";
+			reg = <0x01c09000 0x1000>;
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
+				 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
+			clock-names = "bus", "mod", "isp", "ram";
+			resets = <&ccu RST_CSI0>;
+		};
+
 		emac: ethernet@1c0b000 {
 			compatible = "allwinner,sun4i-a10-emac";
 			reg = <0x01c0b000 0x1000>;
-- 
git-series 0.9.1
