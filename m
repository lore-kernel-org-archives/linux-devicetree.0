From: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RECEND PATCH V7 11/12] arm64: dts: add syscon for whale2 platform
Date: Thu,  4 Jan 2018 15:08:03 +0800
Message-ID: <1515049684-23481-1-git-send-email-zhang.chunyan@linaro.org>
References: <20171207125715.16160-1-chunyan.zhang@spreadtrum.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171207125715.16160-1-chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>

Some clocks on SC9860 are in the same address area with syscon
devices, the proper syscon node will be quoted under the
definitions of those clocks in DT.

Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
---
 arch/arm64/boot/dts/sprd/whale2.dtsi | 46 +++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index 7c217c5..6ea3a75 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -17,6 +17,51 @@
 		#size-cells = <2>;
 		ranges;
 
+		ap_ahb_regs: syscon@20210000 {
+			compatible = "syscon";
+			reg = <0 0x20210000 0 0x10000>;
+		};
+
+		pmu_regs: syscon@402b0000 {
+			compatible = "syscon";
+			reg = <0 0x402b0000 0 0x10000>;
+		};
+
+		aon_regs: syscon@402e0000 {
+			compatible = "syscon";
+			reg = <0 0x402e0000 0 0x10000>;
+		};
+
+		ana_regs: syscon@40400000 {
+			compatible = "syscon";
+			reg = <0 0x40400000 0 0x10000>;
+		};
+
+		agcp_regs: syscon@415e0000 {
+			compatible = "syscon";
+			reg = <0 0x415e0000 0 0x1000000>;
+		};
+
+		vsp_regs: syscon@61100000 {
+			compatible = "syscon";
+			reg = <0 0x61100000 0 0x10000>;
+		};
+
+		cam_regs: syscon@62100000 {
+			compatible = "syscon";
+			reg = <0 0x62100000 0 0x10000>;
+		};
+
+		disp_regs: syscon@63100000 {
+			compatible = "syscon";
+			reg = <0 0x63100000 0 0x10000>;
+		};
+
+		ap_apb_regs: syscon@70b00000 {
+			compatible = "syscon";
+			reg = <0 0x70b00000 0 0x40000>;
+		};
+
 		ap-apb {
 			compatible = "simple-bus";
 			#address-cells = <1>;
@@ -59,7 +104,6 @@
 				status = "disabled";
 			};
 		};
-
 	};
 
 	ext_26m: ext-26m {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
