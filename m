From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC][PATCH 1/4] arm64: dts: Add display subsystem DT nodes for hi6220-hikey
Date: Mon,  8 Aug 2016 16:03:43 -0700
Message-ID: <1470697426-16426-1-git-send-email-john.stultz@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add ade and dsi DT nodes for hikey board.

Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts |  8 ++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 55 ++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 593c7e4..c2f014e 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -372,3 +372,11 @@
 &uart3 {
 	label = "LS-UART1";
 };
+
+&ade {
+	status = "ok";
+};
+
+&dsi {
+	status = "ok";
+};
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 4f27041..d0b887a 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -262,6 +262,11 @@
 			#clock-cells = <1>;
 		};
 
+		medianoc_ade: medianoc_ade@f4520000 {
+			compatible = "syscon";
+			reg = <0x0 0xf4520000 0x0 0x4000>;
+		};
+
 		stub_clock: stub_clock {
 			compatible = "hisilicon,hi6220-stub-clk";
 			hisilicon,hi6220-clk-sram = <&sram>;
@@ -850,5 +855,55 @@
 				};
 			};
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
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
