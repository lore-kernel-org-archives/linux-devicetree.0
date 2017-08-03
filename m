From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/5] arm64: zynqmp: Added clocks to DT for ep108
Date: Thu,  3 Aug 2017 13:36:49 +0200
Message-ID: <49b8208079976bb46e67c0013540cc327afa3594.1501760202.git.michal.simek@xilinx.com>
References: <cover.1501760202.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1501760202.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <cover.1501760202.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
References: <cover.1501760202.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: VNSL Durga <vnsl.durga.challa-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Naga Sureshkumar Relli <naga.sureshkumar.relli-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: VNSL Durga <vnsl.durga.challa-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Added clks for ep108 platform.

Signed-off-by: VNSL Durga <vnsldurg-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

 arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi
index c03bde79d7d8..31d25327cfb9 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi
@@ -29,12 +29,56 @@
 		#clock-cells = <0>;
 		clock-frequency = <75000000>;
 	};
+
+	clk100: clk100 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	clk600: clk600 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <600000000>;
+	};
 };
 
 &can0 {
 	clocks = <&misc_clk &misc_clk>;
 };
 
+&fpd_dma_chan1 {
+	clocks = <&clk600>, <&clk100>;
+};
+
+&fpd_dma_chan2 {
+	clocks = <&clk600>, <&clk100>;
+};
+
+&fpd_dma_chan3 {
+	clocks = <&clk600>, <&clk100>;
+};
+
+&fpd_dma_chan4 {
+	clocks = <&clk600>, <&clk100>;
+};
+
+&fpd_dma_chan5 {
+	clocks = <&clk600>, <&clk100>;
+};
+
+&fpd_dma_chan6 {
+	clocks = <&clk600>, <&clk100>;
+};
+
+&fpd_dma_chan7 {
+	clocks = <&clk600>, <&clk100>;
+};
+
+&fpd_dma_chan8 {
+	clocks = <&clk600>, <&clk100>;
+};
+
 &gem0 {
 	clocks = <&misc_clk>, <&misc_clk>, <&misc_clk>;
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
