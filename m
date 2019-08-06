From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 13/20] arm64: dts: marvell: Drop PCIe I/O ranges from CP11x
 file
Date: Tue,  6 Aug 2019 16:54:53 +0200
Message-ID: <20190806145500.24109-14-miquel.raynal@bootlin.com>
References: <20190806145500.24109-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190806145500.24109-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

As an example, Armada 70x0 and 80x0 SoC 0xf9000000 region points to
RUNIT/SPICS0 while it is referenced in the DT as PCIe I/O memory
range. This shows that I/O memory has never been used/working on the
old SoCs despite the region being advertised. As PCIe I/O ranges will
not be supported in newer SoCs using CP11x co-processors, let's
simply drop them. It is not harmful in any case as PCIe device drivers
can do it all with the regular mapped memory anyway.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi     |  2 --
 .../boot/dts/marvell/armada-8040-mcbin.dtsi      |  3 +--
 arch/arm64/boot/dts/marvell/armada-80x0.dtsi     |  4 ----
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi    | 16 +++-------------
 4 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-70x0.dtsi b/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
index 4e78ccd207b7..ac28903ea409 100644
--- a/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
@@ -19,7 +19,6 @@
  */
 #define CP11X_NAME		cp0
 #define CP11X_BASE		f2000000
-#define CP11X_PCIE_IO_BASE	0xf9000000
 #define CP11X_PCIE_MEM_BASE	0xf6000000
 #define CP11X_PCIE0_BASE	f2600000
 #define CP11X_PCIE1_BASE	f2620000
@@ -29,7 +28,6 @@
 
 #undef CP11X_NAME
 #undef CP11X_BASE
-#undef CP11X_PCIE_IO_BASE
 #undef CP11X_PCIE_MEM_BASE
 #undef CP11X_PCIE0_BASE
 #undef CP11X_PCIE1_BASE
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index d250f4b2bfed..572e2610e0a3 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -179,8 +179,7 @@
 	num-lanes = <4>;
 	num-viewport = <8>;
 	reset-gpios = <&cp0_gpio2 20 GPIO_ACTIVE_LOW>;
-	ranges = <0x81000000 0x0 0xf9010000 0x0 0xf9010000 0x0 0x10000
-		  0x82000000 0x0 0xc0000000 0x0 0xc0000000 0x0 0x20000000>;
+	ranges = <0x82000000 0x0 0xc0000000 0x0 0xc0000000 0x0 0x20000000>;
 	phys = <&cp0_comphy0 0>, <&cp0_comphy1 0>,
 	       <&cp0_comphy2 0>, <&cp0_comphy3 0>;
 	phy-names = "cp0-pcie0-x4-lane0-phy", "cp0-pcie0-x4-lane1-phy",
diff --git a/arch/arm64/boot/dts/marvell/armada-80x0.dtsi b/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
index ebb98836ec9c..902eed571bcc 100644
--- a/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
@@ -21,7 +21,6 @@
  */
 #define CP11X_NAME		cp0
 #define CP11X_BASE		f2000000
-#define CP11X_PCIE_IO_BASE	0xf9000000
 #define CP11X_PCIE_MEM_BASE	0xf6000000
 #define CP11X_PCIE0_BASE	f2600000
 #define CP11X_PCIE1_BASE	f2620000
@@ -31,7 +30,6 @@
 
 #undef CP11X_NAME
 #undef CP11X_BASE
-#undef CP11X_PCIE_IO_BASE
 #undef CP11X_PCIE_MEM_BASE
 #undef CP11X_PCIE0_BASE
 #undef CP11X_PCIE1_BASE
@@ -42,7 +40,6 @@
  */
 #define CP11X_NAME		cp1
 #define CP11X_BASE		f4000000
-#define CP11X_PCIE_IO_BASE	0xfd000000
 #define CP11X_PCIE_MEM_BASE	0xfa000000
 #define CP11X_PCIE0_BASE	f4600000
 #define CP11X_PCIE1_BASE	f4620000
@@ -52,7 +49,6 @@
 
 #undef CP11X_NAME
 #undef CP11X_BASE
-#undef CP11X_PCIE_IO_BASE
 #undef CP11X_PCIE_MEM_BASE
 #undef CP11X_PCIE0_BASE
 #undef CP11X_PCIE1_BASE
diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 3e77cf34604c..7d1ab097453d 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -10,7 +10,6 @@
 
 #include "armada-common.dtsi"
 
-#define CP11X_PCIEx_IO_BASE(iface)	(CP11X_PCIE_IO_BASE + (iface *  0x10000))
 #define CP11X_PCIEx_MEM_BASE(iface)	(CP11X_PCIE_MEM_BASE + (iface *  0x1000000))
 #define CP11X_PCIEx_CONF_BASE(iface)	(CP11X_PCIEx_MEM_BASE(iface) + 0xf00000)
 
@@ -507,11 +506,8 @@
 		msi-parent = <&gic_v2m0>;
 
 		bus-range = <0 0xff>;
-		ranges =
-		/* downstream I/O */
-		<0x81000000 0 CP11X_PCIEx_IO_BASE(0) 0  CP11X_PCIEx_IO_BASE(0) 0 0x10000
 		/* non-prefetchable memory */
-		0x82000000 0 CP11X_PCIEx_MEM_BASE(0) 0  CP11X_PCIEx_MEM_BASE(0) 0 0xf00000>;
+		ranges = <0x82000000 0 CP11X_PCIEx_MEM_BASE(0) 0  CP11X_PCIEx_MEM_BASE(0) 0 0xf00000>;
 		interrupt-map-mask = <0 0 0 0>;
 		interrupt-map = <0 0 0 0 &CP11X_LABEL(icu_nsr) 22 IRQ_TYPE_LEVEL_HIGH>;
 		interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
@@ -534,11 +530,8 @@
 		msi-parent = <&gic_v2m0>;
 
 		bus-range = <0 0xff>;
-		ranges =
-		/* downstream I/O */
-		<0x81000000 0 CP11X_PCIEx_IO_BASE(1) 0  CP11X_PCIEx_IO_BASE(1) 0 0x10000
 		/* non-prefetchable memory */
-		0x82000000 0 CP11X_PCIEx_MEM_BASE(1) 0  CP11X_PCIEx_MEM_BASE(1) 0 0xf00000>;
+		ranges = <0x82000000 0 CP11X_PCIEx_MEM_BASE(1) 0  CP11X_PCIEx_MEM_BASE(1) 0 0xf00000>;
 		interrupt-map-mask = <0 0 0 0>;
 		interrupt-map = <0 0 0 0 &CP11X_LABEL(icu_nsr) 24 IRQ_TYPE_LEVEL_HIGH>;
 		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
@@ -562,11 +555,8 @@
 		msi-parent = <&gic_v2m0>;
 
 		bus-range = <0 0xff>;
-		ranges =
-		/* downstream I/O */
-		<0x81000000 0 CP11X_PCIEx_IO_BASE(2) 0  CP11X_PCIEx_IO_BASE(2) 0 0x10000
 		/* non-prefetchable memory */
-		0x82000000 0 CP11X_PCIEx_MEM_BASE(2) 0  CP11X_PCIEx_MEM_BASE(2) 0 0xf00000>;
+		ranges = <0x82000000 0 CP11X_PCIEx_MEM_BASE(2) 0  CP11X_PCIEx_MEM_BASE(2) 0 0xf00000>;
 		interrupt-map-mask = <0 0 0 0>;
 		interrupt-map = <0 0 0 0 &CP11X_LABEL(icu_nsr) 23 IRQ_TYPE_LEVEL_HIGH>;
 		interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.20.1
