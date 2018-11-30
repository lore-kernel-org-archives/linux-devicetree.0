From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 4/6] ARM: dts: sunxi: h3-h5: Add pinmux setting for CSI MCLK on PE1
Date: Fri, 30 Nov 2018 15:58:47 +0800
Message-ID: <20181130075849.16941-5-wens@csie.org>
References: <20181130075849.16941-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130075849.16941-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some camera modules have the SoC feeding a master clock to the sensor
instead of having a standalone crystal. This clock signal is generated
from the clock control unit and output from the CSI MCLK function of
pin PE1.

Add a pinmux setting for it for camera sensors to reference.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index c9c9ec71945f..b70899500825 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -400,6 +400,11 @@
 				function = "csi";
 			};
 
+			csi_mclk_pin: csi-mclk {
+				pins = "PE1";
+				function = "csi";
+			};
+
 			emac_rgmii_pins: emac0 {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4",
 				       "PD5", "PD7", "PD8", "PD9", "PD10",
-- 
2.20.0.rc1
