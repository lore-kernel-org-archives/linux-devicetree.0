From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v4 12/20] arm64: dts: hi3660: add spi device nodes
Date: Thu, 15 Jun 2017 11:04:09 +0800
Message-ID: <20170615030417.14059-13-guodong.xu@linaro.org>
References: <20170615030417.14059-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615030417.14059-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, horms+renesas@verge.net.au, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hw.wangxiaoyin@hisilicon.com, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>

Add spi2 and spi3 device nodes for hi3660, and enable them for hikey960.

On HiKey960:
 - SPI2 is wired out through low speed expansion connector.
 - SPI3 is wired out through high speed expansion connector.

Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 12 +++++++++
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 30 +++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 9ecf6c6..ca448f0 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -142,3 +142,15 @@
 	label = "LS-UART1";
 	status = "okay";
 };
+
+&spi2 {
+	/* On Low speed expansion */
+	label = "LS-SPI0";
+	status = "okay";
+};
+
+&spi3 {
+	/* On High speed expansion */
+	label = "HS-SPI1";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 3b2a3a7..a6b91f1 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -713,5 +713,35 @@
 			clocks = <&sctrl HI3660_PCLK_AO_GPIO6>;
 			clock-names = "apb_pclk";
 		};
+
+		spi2: spi@ffd68000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0xffd68000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg_ctrl HI3660_CLK_GATE_SPI2>;
+			clock-names = "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi2_pmx_func>;
+			num-cs = <1>;
+			cs-gpios = <&gpio27 2 0>;
+			status = "disabled";
+		};
+
+		spi3: spi@ff3b3000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0xff3b3000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg_ctrl HI3660_CLK_GATE_SPI3>;
+			clock-names = "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi3_pmx_func>;
+			num-cs = <1>;
+			cs-gpios = <&gpio18 5 0>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.10.2
