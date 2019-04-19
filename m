From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 4/5] ARM: dts: lpc32xx: add address and size cell values to
 SPI controller nodes
Date: Fri, 19 Apr 2019 23:54:46 +0300
Message-ID: <20190419205447.6357-5-vz@mleia.com>
References: <20190419205447.6357-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190419205447.6357-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>
List-Id: devicetree@vger.kernel.org

All 4 SPI controllers on NXP LPC32xx SoC support SPI slaves discerning them
by one cell address value, set it as default to avoid duplication in board
device tree files.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc3250-phy3250.dts | 2 --
 arch/arm/boot/dts/lpc32xx.dtsi        | 8 ++++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/lpc3250-phy3250.dts b/arch/arm/boot/dts/lpc3250-phy3250.dts
index b99726d278f6..1b15f798794b 100644
--- a/arch/arm/boot/dts/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/lpc3250-phy3250.dts
@@ -202,8 +202,6 @@
 };
 
 &ssp0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	num-cs = <1>;
 	cs-gpios = <&gpio 3 5 0>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index a0fedab579b4..bc32450de423 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -187,6 +187,8 @@
 				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk LPC32XX_CLK_SSP0>;
 				clock-names = "apb_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -194,6 +196,8 @@
 				compatible = "nxp,lpc3220-spi";
 				reg = <0x20088000 0x1000>;
 				clocks = <&clk LPC32XX_CLK_SPI1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -207,6 +211,8 @@
 				interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk LPC32XX_CLK_SSP1>;
 				clock-names = "apb_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -214,6 +220,8 @@
 				compatible = "nxp,lpc3220-spi";
 				reg = <0x20090000 0x1000>;
 				clocks = <&clk LPC32XX_CLK_SPI2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
-- 
2.20.1
