From: Xinliang Liu <xinliang.liu@linaro.org>
Subject: [PATCH v2 01/10] arm64: dts: hisilicon: Add display subsystem DT nodes for hi6220
Date: Sat, 28 Nov 2015 18:38:56 +0800
Message-ID: <1448707145-69348-2-git-send-email-xinliang.liu@linaro.org>
References: <1448707145-69348-1-git-send-email-xinliang.liu@linaro.org>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1448707145-69348-1-git-send-email-xinliang.liu@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@ffwll.ch, robh@kernel.org, daniel@fooishbar.org, architt@codeaurora.org, airlied@linux.ie, corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, andy.green@linaro.org, haojian.zhuang@linaro.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com, w.f@huawei.com, puck.chen@hisilicon.com, bintian.wang@huawei.com, benjamin.gaignard@linaro.org, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, zourongrong@huawei.com, lijianhua@huawei.com, sumit.semwal@linaro.org, Xinliang Liu <xinliang.liu@linaro.org>
List-Id: devicetree@vger.kernel.org

Add ade, dsi and adv7533 DT nodes for hikey board.

Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Signed-off-by: Andy Green <andy.green@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 21 ++++++++++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 44 ++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 8d43a0f..81236b3 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -31,4 +31,25 @@
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	soc {
+		i2c2: i2c@f7102000 {
+			status = "ok";
+
+			adv7533: adv7533@39 {
+				compatible = "adi,adv7533";
+				reg = <0x39>;
+				interrupt-parent = <&gpio1>;
+				interrupts = <1 2>;
+				pd-gpio = <&gpio0 4 0>;
+				adi,dsi-lanes = <4>;
+
+				port {
+					adv_in: endpoint {
+						remote-endpoint = <&dsi_out>;
+					};
+				};
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 82d2488..2d6cf03 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -208,5 +208,49 @@
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
+
+		display-subsystem {
+			compatible = "hisilicon,hi6220-dss";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			ade: ade@f4100000 {
+				compatible = "hisilicon,hi6220-ade";
+				reg = <0x0 0xf4100000 0x0 0x7800>,
+				      <0x0 0xf4410000 0x0 0x1000>;
+				reg-names = "ade_base",
+					    "media_base";
+				interrupts = <0 115 4>; /* ldi interrupt */
+
+				clocks = <&media_ctrl HI6220_ADE_CORE>,
+					 <&media_ctrl HI6220_CODEC_JPEG>,
+					 <&media_ctrl HI6220_ADE_PIX_SRC>,
+					 <&media_ctrl HI6220_PLL_SYS>,
+					 <&media_ctrl HI6220_PLL_SYS_MEDIA>;
+				/*clock name*/
+				clock-names  = "clk_ade_core",
+					       "aclk_codec_jpeg_src",
+					       "clk_ade_pix",
+					       "clk_syspll_src",
+					       "clk_medpll_src";
+				ade_core_clk_rate = <360000000>;
+				media_noc_clk_rate = <288000000>;
+			};
+
+			dsi: dsi@0xf4107800 {
+				compatible = "hisilicon,hi6220-dsi";
+				reg = <0x0 0xf4107800 0x0 0x100>;
+				clocks = <&media_ctrl  HI6220_DSI_PCLK>;
+				clock-names = "pclk_dsi";
+
+				port {
+					dsi_out: endpoint {
+						remote-endpoint = <&adv_in>;
+					};
+				};
+
+			};
+		};
 	};
 };
-- 
1.9.1

