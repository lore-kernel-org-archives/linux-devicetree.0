From: Xinliang Liu <xinliang.liu@linaro.org>
Subject: [PATCH v7 11/11] arm64: dts: hisilicon: Add display subsystem DT nodes for hi6220
Date: Fri,  4 Mar 2016 18:54:37 +0800
Message-ID: <1457088877-131022-12-git-send-email-xinliang.liu@linaro.org>
References: <1457088877-131022-1-git-send-email-xinliang.liu@linaro.org>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1457088877-131022-1-git-send-email-xinliang.liu@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@ffwll.ch, robh@kernel.org, daniel@fooishbar.org, architt@codeaurora.org, airlied@linux.ie, corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com, emil.l.velikov@gmail.com, mark.rutland@arm.com
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, andy.green@linaro.org, haojian.zhuang@linaro.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com, w.f@huawei.com, puck.chen@hisilicon.com, bintian.wang@huawei.com, benjamin.gaignard@linaro.org, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, zourongrong@huawei.com, lijianhua@huawei.com, sumit.semwal@linaro.org, guodong.xu@linaro.org, Xinliang Liu <xinliang.liu@linaro.org>
List-Id: devicetree@vger.kernel.org

Add ade, dsi and adv7533 DT nodes for hikey board.

Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 40 +++++++++++++++++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 55 ++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 818525197508..40239fba0572 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -39,3 +39,43 @@
 &uart3 {
 	label = "LS-UART1";
 };
+
+&ade {
+	status = "okay";
+};
+
+&dsi {
+	status = "ok";
+
+	ports {
+		/* 1 for output port */
+		port@1 {
+			reg = <1>;
+
+			dsi_out0: endpoint@0 {
+				remote-endpoint = <&adv7533_in>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "ok";
+
+	adv7533: adv7533@39 {
+		compatible = "adi,adv7533";
+		reg = <0x39>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 2>;
+		pd-gpio = <&gpio0 4 0>;
+		adi,dsi-lanes = <4>;
+
+		port {
+			adv7533_in: endpoint {
+				remote-endpoint = <&dsi_out0>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index ad1f1ebcb05c..991568bb3ea1 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -162,6 +162,11 @@
 			#clock-cells = <1>;
 		};
 
+		medianoc_ade: medianoc_ade@f4520000 {
+			compatible = "syscon";
+			reg = <0x0 0xf4520000 0x0 0x4000>;
+		};
+
 		uart0: uart@f8015000 {	/* console */
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xf8015000 0x0 0x1000>;
@@ -209,5 +214,55 @@
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
+
+		ade: ade@f4100000 {
+			compatible = "hisilicon,hi6220-ade";
+			reg = <0x0 0xf4100000 0x0 0x7800>;
+			reg-names = "ade_base";
+			hisilicon,noc-syscon = <&medianoc_ade>;
+			resets = <&media_ctrl MEDIA_ADE>;
+			interrupts = <0 115 4>; /* ldi interrupt */
+
+			clocks = <&media_ctrl HI6220_ADE_CORE>,
+				 <&media_ctrl HI6220_CODEC_JPEG>,
+				 <&media_ctrl HI6220_ADE_PIX_SRC>;
+			/*clock name*/
+			clock-names  = "clk_ade_core",
+				       "clk_codec_jpeg",
+				       "clk_ade_pix";
+
+			assigned-clocks = <&media_ctrl HI6220_ADE_CORE>,
+				<&media_ctrl HI6220_CODEC_JPEG>;
+			assigned-clock-rates = <360000000>, <288000000>;
+			dma-coherent;
+			status = "disabled";
+
+			port {
+				ade_out: endpoint {
+					remote-endpoint = <&dsi_in>;
+				};
+			};
+		};
+
+		dsi: dsi@f4107800 {
+			compatible = "hisilicon,hi6220-dsi";
+			reg = <0x0 0xf4107800 0x0 0x100>;
+			clocks = <&media_ctrl  HI6220_DSI_PCLK>;
+			clock-names = "pclk";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* 0 for input port */
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&ade_out>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
2.7.1

