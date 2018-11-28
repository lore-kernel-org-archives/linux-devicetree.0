From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: dts: uniphier: add MIO DMAC nodes
Date: Wed, 28 Nov 2018 11:42:30 +0900
Message-ID: <1543372950-16122-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add MIO-DMAC (Media IO DMA Controller) nodes, and use them as
the DMA engine of SD/eMMC controllers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/uniphier-ld4.dtsi  | 14 ++++++++++++++
 arch/arm/boot/dts/uniphier-pro4.dtsi | 16 ++++++++++++++++
 arch/arm/boot/dts/uniphier-sld8.dtsi | 14 ++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-ld4.dtsi b/arch/arm/boot/dts/uniphier-ld4.dtsi
index b73d594..c2706ce 100644
--- a/arch/arm/boot/dts/uniphier-ld4.dtsi
+++ b/arch/arm/boot/dts/uniphier-ld4.dtsi
@@ -235,6 +235,16 @@
 			};
 		};
 
+		dmac: dma-controller@5a000000 {
+			compatible = "socionext,uniphier-mio-dmac";
+			reg = <0x5a000000 0x1000>;
+			interrupts = <0 68 4>, <0 68 4>, <0 69 4>, <0 70 4>,
+				     <0 71 4>, <0 72 4>, <0 73 4>;
+			clocks = <&mio_clk 7>;
+			resets = <&mio_rst 7>;
+			#dma-cells = <1>;
+		};
+
 		sd: sdhc@5a400000 {
 			compatible = "socionext,uniphier-sd-v2.91";
 			status = "disabled";
@@ -246,6 +256,8 @@
 			clocks = <&mio_clk 0>;
 			reset-names = "host", "bridge";
 			resets = <&mio_rst 0>, <&mio_rst 3>;
+			dma-names = "rx-tx";
+			dmas = <&dmac 4>;
 			bus-width = <4>;
 			cap-sd-highspeed;
 			sd-uhs-sdr12;
@@ -263,6 +275,8 @@
 			clocks = <&mio_clk 1>;
 			reset-names = "host", "bridge", "hw";
 			resets = <&mio_rst 1>, <&mio_rst 4>, <&mio_rst 6>;
+			dma-names = "rx-tx";
+			dmas = <&dmac 6>;
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			cap-mmc-hw-reset;
diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
index 0beb606..97d051e 100644
--- a/arch/arm/boot/dts/uniphier-pro4.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
@@ -269,6 +269,16 @@
 			};
 		};
 
+		dmac: dma-controller@5a000000 {
+			compatible = "socionext,uniphier-mio-dmac";
+			reg = <0x5a000000 0x1000>;
+			interrupts = <0 68 4>, <0 68 4>, <0 69 4>, <0 70 4>,
+				     <0 71 4>, <0 72 4>, <0 73 4>, <0 74 4>;
+			clocks = <&mio_clk 7>;
+			resets = <&mio_rst 7>;
+			#dma-cells = <1>;
+		};
+
 		sd: sdhc@5a400000 {
 			compatible = "socionext,uniphier-sd-v2.91";
 			status = "disabled";
@@ -280,6 +290,8 @@
 			clocks = <&mio_clk 0>;
 			reset-names = "host", "bridge";
 			resets = <&mio_rst 0>, <&mio_rst 3>;
+			dma-names = "rx-tx";
+			dmas = <&dmac 4>;
 			bus-width = <4>;
 			cap-sd-highspeed;
 			sd-uhs-sdr12;
@@ -297,6 +309,8 @@
 			clocks = <&mio_clk 1>;
 			reset-names = "host", "bridge", "hw";
 			resets = <&mio_rst 1>, <&mio_rst 4>, <&mio_rst 6>;
+			dma-names = "rx-tx";
+			dmas = <&dmac 5>;
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			cap-mmc-hw-reset;
@@ -313,6 +327,8 @@
 			clocks = <&mio_clk 2>;
 			reset-names = "host", "bridge";
 			resets = <&mio_rst 2>, <&mio_rst 5>;
+			dma-names = "rx-tx";
+			dmas = <&dmac 6>;
 			bus-width = <4>;
 			cap-sd-highspeed;
 		};
diff --git a/arch/arm/boot/dts/uniphier-sld8.dtsi b/arch/arm/boot/dts/uniphier-sld8.dtsi
index f7fcf6b..efce027 100644
--- a/arch/arm/boot/dts/uniphier-sld8.dtsi
+++ b/arch/arm/boot/dts/uniphier-sld8.dtsi
@@ -239,6 +239,16 @@
 			};
 		};
 
+		dmac: dma-controller@5a000000 {
+			compatible = "socionext,uniphier-mio-dmac";
+			reg = <0x5a000000 0x1000>;
+			interrupts = <0 68 4>, <0 68 4>, <0 69 4>, <0 70 4>,
+				     <0 71 4>, <0 72 4>, <0 73 4>;
+			clocks = <&mio_clk 7>;
+			resets = <&mio_rst 7>;
+			#dma-cells = <1>;
+		};
+
 		sd: sdhc@5a400000 {
 			compatible = "socionext,uniphier-sd-v2.91";
 			status = "disabled";
@@ -250,6 +260,8 @@
 			clocks = <&mio_clk 0>;
 			reset-names = "host", "bridge";
 			resets = <&mio_rst 0>, <&mio_rst 3>;
+			dma-names = "rx-tx";
+			dmas = <&dmac 4>;
 			bus-width = <4>;
 			cap-sd-highspeed;
 			sd-uhs-sdr12;
@@ -267,6 +279,8 @@
 			clocks = <&mio_clk 1>;
 			reset-names = "host", "bridge", "hw";
 			resets = <&mio_rst 1>, <&mio_rst 4>, <&mio_rst 6>;
+			dma-names = "rx-tx";
+			dmas = <&dmac 6>;
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			cap-mmc-hw-reset;
-- 
2.7.4
