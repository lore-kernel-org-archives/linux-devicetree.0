From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 6/7] ARM64: dts: marvell: Add pinctrl nodes for Armada 3700
Date: Tue, 21 Mar 2017 19:28:35 +0100
Message-ID: <5fa8b89d7224d4e394e1b56027789f7beb8c16c4.1490120798.git-series.gregory.clement@free-electrons.com>
References: <cover.26288667a039bc9f8e62dec2fd6342ded4014d12.1490120798.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.26288667a039bc9f8e62dec2fd6342ded4014d12.1490120798.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.26288667a039bc9f8e62dec2fd6342ded4014d12.1490120798.git-series.gregory.clement@free-electrons.com>
References: <cover.26288667a039bc9f8e62dec2fd6342ded4014d12.1490120798.git-series.gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Hua Jing <jinghua@marvell.com>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Add the nodes for the two pin controller present in the Armada 37xx SoCs.

Initially the node was named gpio1 using the same name that for the
register range in the datasheet. However renaming it pinctr_nb (nb for
North Bridge) makes more sens.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 40 +++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index b48d668a6ab6..229946c57a07 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -157,10 +157,28 @@
 				#clock-cells = <1>;
 			};
 
-			gpio1: gpio@13800 {
-				compatible = "marvell,mvebu-gpio-3700",
+			pinctrl_nb: pinctrl-nb@13800 {
+				compatible = "marvell,armada3710-nb-pinctrl",
 				"syscon", "simple-mfd";
-				reg = <0x13800 0x500>;
+				reg = <0x13800 0x100>, <0x13C00 0x20>;
+				gpionb: gpionb {
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupts =
+					<GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+
+				};
 
 				xtalclk: xtal-clk {
 					compatible = "marvell,armada-3700-xtal-clock";
@@ -169,6 +187,22 @@
 				};
 			};
 
+			pinctrl_sb: pinctrl-sb@18800 {
+				compatible = "marvell,armada3710-sb-pinctrl",
+				"syscon", "simple-mfd";
+				reg = <0x18800 0x100>, <0x18C00 0x20>;
+				gpiosb: gpiosb {
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupts =
+					<GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+
 			eth0: ethernet@30000 {
 				   compatible = "marvell,armada-3700-neta";
 				   reg = <0x30000 0x4000>;
-- 
git-series 0.9.1
