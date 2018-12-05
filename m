From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 08/15] ARM/arm64: sunxi: Move H3/H5 syscon label over to
 soc-specific nodes
Date: Wed,  5 Dec 2018 10:24:37 +0100
Message-ID: <20181205092444.29497-9-paul.kocialkowski@bootlin.com>
References: <20181205092444.29497-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181205092444.29497-1-paul.kocialkowski@bootlin.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org
Cc: Mark Rutland <mark.rutland@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-sunxi@googlegroups.com, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-Id: devicetree@vger.kernel.org

The EMAC driver requires a syscon node to access the EMAC clock
configuration register (that is part of the system-control register
range and controlled). For this purpose, a dummy syscon node was
introduced to let the driver access the register freely.

Recently, the EMAC driver was tuned to get access to the register when
the SRAM driver is registered (as used on the A64). As a result, it is
no longer necessary to have a dummy syscon node for that purpose.

Now that we have a proper system-control node for both the H3 and H5,
we can get rid of that dummy syscon node and have the EMAC driver use
the node corresponding to the proper SRAM driver (by switching the
syscon label over to each dtsi). This way, we no longer have two
separate nodes for the same register space.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun8i-h3.dtsi              | 2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi           | 6 ------
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index e438e54580e1..a858d91dd4c6 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -120,7 +120,7 @@
 	};
 
 	soc {
-		system-control@1c00000 {
+		syscon: system-control@1c00000 {
 			compatible = "allwinner,sun8i-h3-system-control";
 			reg = <0x01c00000 0x1000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 0d9e9eac518c..ed5846982685 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -152,12 +152,6 @@
 			};
 		};
 
-		syscon: syscon@1c00000 {
-			compatible = "allwinner,sun8i-h3-system-controller",
-				"syscon";
-			reg = <0x01c00000 0x1000>;
-		};
-
 		dma: dma-controller@1c02000 {
 			compatible = "allwinner,sun8i-h3-dma";
 			reg = <0x01c02000 0x1000>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
index 42bfb560b367..4e9025431e9f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
@@ -94,7 +94,7 @@
 	};
 
 	soc {
-		system-control@1c00000 {
+		syscon: system-control@1c00000 {
 			compatible = "allwinner,sun50i-h5-system-control";
 			reg = <0x01c00000 0x1000>;
 			#address-cells = <1>;
-- 
2.19.2
