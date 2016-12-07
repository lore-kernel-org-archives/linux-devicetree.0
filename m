From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] arm: dts: rockchip: add qos node for rk3288
Date: Wed,  7 Dec 2016 10:17:45 +0800
Message-ID: <1481077065-11309-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

when pd power on/off, the qos regs need to save and restore.

Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 arch/arm/boot/dts/rk3288.dtsi | 84 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 4fad13368a7b..2628edc871fa 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -699,6 +699,76 @@
 		reg = <0xff720000 0x1000>;
 	};
 
+	qos_gpu_r: qos@ffaa0000 {
+		compatible = "syscon";
+		reg = <0xffaa0000 0x20>;
+	};
+
+	qos_gpu_w: qos@ffaa0080 {
+		compatible = "syscon";
+		reg = <0xffaa0080 0x20>;
+	};
+
+	qos_vio1_vop: qos@ffad0000 {
+		compatible = "syscon";
+		reg = <0xffad0000 0x20>;
+	};
+
+	qos_vio1_isp_w0: qos@ffad0100 {
+		compatible = "syscon";
+		reg = <0xffad0100 0x20>;
+	};
+
+	qos_vio1_isp_w1: qos@ffad0180 {
+		compatible = "syscon";
+		reg = <0xffad0180 0x20>;
+	};
+
+	qos_vio0_vop: qos@ffad0400 {
+		compatible = "syscon";
+		reg = <0xffad0400 0x20>;
+	};
+
+	qos_vio0_vip: qos@ffad0480 {
+		compatible = "syscon";
+		reg = <0xffad0480 0x20>;
+	};
+
+	qos_vio0_iep: qos@ffad0500 {
+		compatible = "syscon";
+		reg = <0xffad0500 0x20>;
+	};
+
+	qos_vio2_rga_r: qos@ffad0800 {
+		compatible = "syscon";
+		reg = <0xffad0800 0x20>;
+	};
+
+	qos_vio2_rga_w: qos@ffad0880 {
+		compatible = "syscon";
+		reg = <0xffad0880 0x20>;
+	};
+
+	qos_vio1_isp_r: qos@ffad0900 {
+		compatible = "syscon";
+		reg = <0xffad0900 0x20>;
+	};
+
+	qos_video: qos@ffae0000 {
+		compatible = "syscon";
+		reg = <0xffae0000 0x20>;
+	};
+
+	qos_hevc_r: qos@ffaf0000 {
+		compatible = "syscon";
+		reg = <0xffaf0000 0x20>;
+	};
+
+	qos_hevc_w: qos@ffaf0080 {
+		compatible = "syscon";
+		reg = <0xffaf0080 0x20>;
+	};
+
 	pmu: power-management@ff730000 {
 		compatible = "rockchip,rk3288-pmu", "syscon", "simple-mfd";
 		reg = <0xff730000 0x100>;
@@ -762,6 +832,15 @@
 					 <&cru SCLK_ISP_JPE>,
 					 <&cru SCLK_ISP>,
 					 <&cru SCLK_RGA>;
+				pm_qos = <&qos_vio0_iep>,
+					 <&qos_vio1_vop>,
+					 <&qos_vio1_isp_w0>,
+					 <&qos_vio1_isp_w1>,
+					 <&qos_vio0_vop>,
+					 <&qos_vio0_vip>,
+					 <&qos_vio2_rga_r>,
+					 <&qos_vio2_rga_w>,
+					 <&qos_vio1_isp_r>;
 			};
 
 			/*
@@ -773,6 +852,8 @@
 				clocks = <&cru ACLK_HEVC>,
 					 <&cru SCLK_HEVC_CABAC>,
 					 <&cru SCLK_HEVC_CORE>;
+				pm_qos = <&qos_hevc_r>,
+					 <&qos_hevc_w>;
 			};
 
 			/*
@@ -784,6 +865,7 @@
 				reg = <RK3288_PD_VIDEO>;
 				clocks = <&cru ACLK_VCODEC>,
 					 <&cru HCLK_VCODEC>;
+				pm_qos = <&qos_video>;
 			};
 
 			/*
@@ -793,6 +875,8 @@
 			pd_gpu@RK3288_PD_GPU {
 				reg = <RK3288_PD_GPU>;
 				clocks = <&cru ACLK_GPU>;
+				pm_qos = <&qos_gpu_r>,
+					 <&qos_gpu_w>;
 			};
 		};
 
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
