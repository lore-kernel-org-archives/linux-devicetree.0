From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 12/12] arm64: dts: hi3660: add spi device nodes
Date: Thu, 25 May 2017 16:18:54 +0800
Message-ID: <20170525081854.4701-13-guodong.xu@linaro.org>
References: <20170525081854.4701-1-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170525081854.4701-1-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

Add spi2 and spi3 device nodes for hi3660, and enable them for hikey960.

On HiKey960:
 - SPI2 is wired out through low speed expansion connector.
 - SPI3 is wired out through high speed expansion connector.

Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
