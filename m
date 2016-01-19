From: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 3/3] arm64: dts: add Hi6220 spi configuration nodes
Date: Tue, 19 Jan 2016 18:51:21 +0800
Message-ID: <1453200681-26406-3-git-send-email-zhongkaihua@huawei.com>
References: <1453200681-26406-1-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453200681-26406-1-git-send-email-zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

arm64: dts: add Hi6220 spi configuration nodes

Signed-off-by: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts   |  1 +
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi        | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/hisilicon/hikey-pinctrl.dtsi | 21 +++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 4fb0bdc..2313ae0 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -23,6 +23,7 @@
 		serial1 = &uart1; /* BT UART */
 		serial2 = &uart2; /* LS Expansion UART0 */
 		serial3 = &uart3; /* LS Expansion UART1 */
+		spi0 = &spi_0;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index c1ae42b..facc0f0 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -489,5 +489,25 @@
 			clock-names = "apb_pclk";
 			status = "ok";
 		};
+
+		spi_0: spi@f7106000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0xf7106000 0x0 0x1000>;
+			interrupts = <0 50 4>;
+			bus-id = <0>;
+			enable-dma = <0>;
+			/*dmas = <&dma0 12 &dma0 13>;*/
+			/*dma-names = "rx", "tx";*/
+
+			clocks = <&sys_ctrl HI6220_SPI_CLK>;
+			clock-names = "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0_pmx_func &spi0_cfg_func>;
+			num-cs = <1>;
+			cs-gpios = <&gpio6 2 0>;
+
+			status = "ok";
+		};
+
 	};
 };
diff --git a/arch/arm64/boot/dts/hisilicon/hikey-pinctrl.dtsi b/arch/arm64/boot/dts/hisilicon/hikey-pinctrl.dtsi
index 28806df..0916e84 100644
--- a/arch/arm64/boot/dts/hisilicon/hikey-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hikey-pinctrl.dtsi
@@ -221,6 +221,15 @@
 					0xfc   MUX_M0	/* I2C2_SDA     (IOMG063) */
 				>;
 			};
+
+			spi0_pmx_func: spi0_pmx_func {
+				pinctrl-single,pins = <
+					0x1a0  MUX_M1   /* SPI0_DI      (IOMG104) */
+					0x1a4  MUX_M1	/* SPI0_DO	(IOMG105) */
+					0x1a8  MUX_M1	/* SPI0_CS_N	(IOMG106) */
+					0x1ac  MUX_M1	/* SPI0_CLK	(IOMG107) */
+				>;
+			};
 		};
 
 		pmx1: pinmux@f7010800 {
@@ -625,6 +634,18 @@
 				pinctrl-single,bias-pullup    = <PULL_DIS  PULL_UP   PULL_DIS  PULL_UP>;
 				pinctrl-single,drive-strength = <DRIVE1_02MA DRIVE_MASK>;
 			};
+
+			spi0_cfg_func: spi0_cfg_func {
+				pinctrl-single,pins = <
+					0x1b0  0x0	/* SPI0_DI	(IOCFG108) */
+					0x1b4  0x0	/* SPI0_DO	(IOCFG109) */
+					0x1b8  0x0	/* SPI0_CS_N	(IOCFG110) */
+					0x1bc  0x0	/* SPI0_CLK	(IOCFG111) */
+				>;
+				pinctrl-single,bias-pulldown  = <PULL_DIS  PULL_DOWN PULL_DIS PULL_DOWN>;
+				pinctrl-single,bias-pullup    = <PULL_DIS  PULL_UP   PULL_DIS PULL_UP>;
+				pinctrl-single,drive-strength = <DRIVE1_02MA DRIVE_MASK>;
+			};
 		};
 
 		pmx2: pinmux@f8001800 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
