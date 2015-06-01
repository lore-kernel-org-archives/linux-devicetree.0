From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/2] arm64: dts: mt8173: Add I2C device node
Date: Mon, 1 Jun 2015 21:08:27 +0800
Message-ID: <1433164107-26568-3-git-send-email-eddie.huang@mediatek.com>
References: <1433164107-26568-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1433164107-26568-1-git-send-email-eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add MT8173 I2C device nodes, include I2C controllers and pins.
MT8173 has six I2C controllers, from i2c0 to i2c6, exclude i2c5.
The 6th I2C controller register base doesn't next to 5th I2C,
and there is a hardware between 5th and 6th I2C controller. So
SoC designer name 6th controller as "i2c6", not "i2c5".

Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 119 +++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index b52ec43..7003ed2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -158,6 +158,53 @@
 			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
 						<GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
 						<GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			i2c0_pins_a: i2c0@0 {
+				pins1 {
+					pinmux = <MT8173_PIN_45_SDA0__FUNC_SDA0>,
+						 <MT8173_PIN_46_SCL0__FUNC_SCL0>;
+					bias-disable;
+				};
+			};
+
+			i2c1_pins_a: i2c1@0 {
+				pins1 {
+					pinmux = <MT8173_PIN_125_SDA1__FUNC_SDA1>,
+						 <MT8173_PIN_126_SCL1__FUNC_SCL1>;
+					bias-disable;
+				};
+			};
+
+			i2c2_pins_a: i2c2@0 {
+				pins1 {
+					pinmux = <MT8173_PIN_43_SDA2__FUNC_SDA2>,
+						 <MT8173_PIN_44_SCL2__FUNC_SCL2>;
+					bias-disable;
+				};
+			};
+
+			i2c3_pins_a: i2c3@0 {
+				pins1 {
+					pinmux = <MT8173_PIN_106_SDA3__FUNC_SDA3>,
+						 <MT8173_PIN_107_SCL3__FUNC_SCL3>;
+					bias-disable;
+				};
+			};
+
+			i2c4_pins_a: i2c4@0 {
+				pins1 {
+					pinmux = <MT8173_PIN_133_SDA4__FUNC_SDA4>,
+						 <MT8173_PIN_134_SCL4__FUNC_SCL4>;
+					bias-disable;
+				};
+			};
+
+			i2c6_pins_a: i2c6@0 {
+				pins1 {
+					pinmux = <MT8173_PIN_100_MSDC2_DAT0__FUNC_SDA5>,
+						 <MT8173_PIN_101_MSDC2_DAT1__FUNC_SCL5>;
+					bias-disable;
+				};
+			};
 		};
 
 		watchdog: watchdog@10007000 {
@@ -229,6 +276,78 @@
 			clocks = <&uart_clk>;
 			status = "disabled";
 		};
+
+		i2c0: i2c@11007000 {
+			compatible = "mediatek,mt8173-i2c";
+			reg = <0 0x11007000 0 0x70>,
+			      <0 0x11000100 0 0x80>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C0>,
+				 <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			status = "disabled";
+		};
+
+		i2c1: i2c@11008000 {
+			compatible = "mediatek,mt8173-i2c";
+			reg = <0 0x11008000 0 0x70>,
+			      <0 0x11000180 0 0x80>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C1>,
+				 <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			status = "disabled";
+		};
+
+		i2c2: i2c@11009000 {
+			compatible = "mediatek,mt8173-i2c";
+			reg = <0 0x11009000 0 0x70>,
+			      <0 0x11000200 0 0x80>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C2>,
+				 <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			status = "disabled";
+		};
+
+		i2c3: i2c3@11010000 {
+			compatible = "mediatek,mt8173-i2c";
+			reg = <0 0x11010000 0 0x70>,
+			      <0 0x11000280 0 0x80>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C3>,
+				 <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			status = "disabled";
+		};
+
+		i2c4: i2c4@11011000 {
+			compatible = "mediatek,mt8173-i2c";
+			reg = <0 0x11011000 0 0x70>,
+			      <0 0x11000300 0 0x80>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C4>,
+				 <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			status = "disabled";
+		};
+
+		i2c6: i2c6@11013000 {
+			compatible = "mediatek,mt8173-i2c";
+			reg = <0 0x11013000 0 0x70>,
+			      <0 0x11000080 0 0x80>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C6>,
+				 <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			status = "disabled";
+		};
 	};
 
 };
-- 
1.8.1.1.dirty
