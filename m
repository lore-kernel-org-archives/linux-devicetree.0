From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/4] ARM: dts: vfxxx: Add device tree node for OCOTP
Date: Fri, 11 Mar 2016 14:29:29 +0530
Message-ID: <6fc72e6919ad21aeca5c4c52ea0a4eb08de888c4.1457684688.git.maitysanchayan@gmail.com>
References: <cover.1457684688.git.maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1457684688.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1457684688.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1457684688.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stefan-XLVq0VzYD2Y@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree node for the OCOTP peripheral on Vybrid.

Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/vfxxx.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 5e49fbd..db9157e 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -499,6 +499,22 @@
 				status = "disabled";
 			};
 
+			ocotp@400a5000 {
+				compatible = "fsl,vf610-ocotp";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0x400a5000 0xCF0>;
+				clocks = <&clks VF610_CLK_OCOTP>;
+
+				ocotp_cfg0: cfg0@410 {
+					reg = <0x410 0x4>;
+				};
+
+				ocotp_cfg1: cfg1@420 {
+					reg = <0x420 0x4>;
+				};
+			};
+
 			snvs0: snvs@400a7000 {
 			    compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
 				reg = <0x400a7000 0x2000>;
-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
