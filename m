From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH] arm64: dts: rockchip: add the power domain node for rk3399
Date: Thu, 30 Jun 2016 09:56:00 +0800
Message-ID: <1467251760-14695-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: dianders@chromium.org, jay.xu@rock-chips.com, briannorris@chromium.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

From: Elaine Zhang <zhangqing@rock-chips.com>

In order to meet low power requirements, a power management unit (PMU) is
designed for controlling power resources in RK3399. The RK3399 PMU is
dedicated for managing the power of the whole chip.

1. add pd node for RK3399 Soc
2. create power domain tree
3. add qos node for domain

>From the DT/binds and driver can get more detail information:
The driver:
drivers/soc/rockchip/pm_domains.c
The document:
Documentation/devicetree/bindings/soc/rockchip/power_domain.txt

---

Tested on vop and gpu devices added for next kernel.
PD:
localhost / # cat sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          slaves
/device                                             runtime status
----------------------------------------------------------------------
pd_gpu                          on
/devices/platform/ff9a0000.gpu                      active
pd_vopl                         off
/devices/platform/ff8f0000.vop                      suspended
pd_vopb                         off
/devices/platform/ff900000.vop                      suspended
pd_vo                           off             pd_vopb, pd_vopl
pd_hdcp                         off
...
pd_iep                          off
pd_vcodec                       off
pd_vdu                          off

QOS:
localhost / # cat sys/kernel/debug/pm_qos/
cpu_dma_latency     network_latency
memory_bandwidth    network_throughput

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 153 +++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index a6dd623..cc4035e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -45,6 +45,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/power/rk3399-power.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -594,6 +595,158 @@
 		status = "disabled";
 	};
 
+	qos_gpu: qos_gpu@ffae0000 {
+		compatible = "syscon";
+		reg = <0x0 0xffae0000 0x0 0x20>;
+	};
+	qos_video_m0: qos_video_m0@ffab8000 {
+		compatible = "syscon";
+		reg = <0x0 0xffab8000 0x0 0x20>;
+	};
+	qos_video_m1_r: qos_video_m1_r@ffac0000 {
+		compatible = "syscon";
+		reg = <0x0 0xffac0000 0x0 0x20>;
+	};
+	qos_video_m1_w: qos_video_m1_w@ffac0080 {
+		compatible = "syscon";
+		reg = <0x0 0xffac0080 0x0 0x20>;
+	};
+	qos_rga_r: qos_rga_r@ffab0000 {
+		compatible = "syscon";
+		reg = <0x0 0xffab0000 0x0 0x20>;
+	};
+	qos_rga_w: qos_rga_w@ffab0080 {
+		compatible = "syscon";
+		reg = <0x0 0xffab0080 0x0 0x20>;
+	};
+	qos_iep: qos_iep@ffa98000 {
+		compatible = "syscon";
+		reg = <0x0 0xffa98000 0x0 0x20>;
+	};
+	qos_vop_big_r: qos_vop_big_r@ffac8000 {
+		compatible = "syscon";
+		reg = <0x0 0xffac8000 0x0 0x20>;
+	};
+	qos_vop_big_w: qos_vop_big_w@ffac8080 {
+		compatible = "syscon";
+		reg = <0x0 0xffac8080 0x0 0x20>;
+	};
+	qos_vop_little: qos_vop_little@ffad0000 {
+		compatible = "syscon";
+		reg = <0x0 0xffad0000 0x0 0x20>;
+	};
+	qos_isp0_m0: qos_isp0_m0@ffaa0000 {
+		compatible = "syscon";
+		reg = <0x0 0xffaa0000 0x0 0x20>;
+	};
+	qos_isp0_m1: qos_isp0_m1@ffaa0080 {
+		compatible = "syscon";
+		reg = <0x0 0xffaa0080 0x0 0x20>;
+	};
+	qos_isp1_m0: qos_isp1_m0@ffaa8000 {
+		compatible = "syscon";
+		reg = <0x0 0xffaa8000 0x0 0x20>;
+	};
+	qos_isp1_m1: qos_isp1_m1@ffaa8080 {
+		compatible = "syscon";
+		reg = <0x0 0xffaa8080 0x0 0x20>;
+	};
+	qos_hdcp: qos_hdcp@ffa90000 {
+		compatible = "syscon";
+		reg = <0x0 0xffa90000 0x0 0x20>;
+	};
+
+	pmu: power-management@ff310000 {
+		compatible = "rockchip,rk3399-pmu", "syscon", "simple-mfd";
+		reg = <0x0 0xff310000 0x0 0x1000>;
+
+		power: power-controller {
+			status = "okay";
+			compatible = "rockchip,rk3399-power-controller";
+			#power-domain-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			pd_vdu {
+				reg = <RK3399_PD_VDU>;
+				clocks = <&cru ACLK_VDU>,
+					 <&cru HCLK_VDU>;
+				pm_qos = <&qos_video_m1_r>,
+					 <&qos_video_m1_w>;
+			};
+			pd_vcodec {
+				reg = <RK3399_PD_VCODEC>;
+				clocks = <&cru ACLK_VCODEC>,
+					 <&cru HCLK_VCODEC>;
+				pm_qos = <&qos_video_m0>;
+			};
+			pd_iep {
+				reg = <RK3399_PD_IEP>;
+				clocks = <&cru ACLK_IEP>,
+					 <&cru HCLK_IEP>;
+				pm_qos = <&qos_iep>;
+			};
+			pd_rga {
+				reg = <RK3399_PD_RGA>;
+				clocks = <&cru ACLK_RGA>,
+					 <&cru HCLK_RGA>;
+				pm_qos = <&qos_rga_r>,
+					 <&qos_rga_w>;
+			};
+			pd_vio {
+				reg = <RK3399_PD_VIO>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				pd_isp0 {
+					reg = <RK3399_PD_ISP0>;
+					clocks = <&cru ACLK_ISP0>,
+						 <&cru HCLK_ISP0>;
+					pm_qos = <&qos_isp0_m0>,
+						 <&qos_isp0_m1>;
+				};
+				pd_isp1 {
+					reg = <RK3399_PD_ISP1>;
+					clocks = <&cru ACLK_ISP1>,
+						 <&cru HCLK_ISP1>;
+					pm_qos = <&qos_isp1_m0>,
+						 <&qos_isp1_m1>;
+				};
+				pd_hdcp {
+					reg = <RK3399_PD_HDCP>;
+					clocks = <&cru ACLK_HDCP>,
+						 <&cru HCLK_HDCP>,
+						 <&cru PCLK_HDCP>;
+					pm_qos = <&qos_hdcp>;
+				};
+				pd_vo {
+					reg = <RK3399_PD_VO>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					pd_vopb {
+						reg = <RK3399_PD_VOPB>;
+						clocks = <&cru ACLK_VOP0>,
+							 <&cru HCLK_VOP0>;
+						pm_qos = <&qos_vop_big_r>,
+							 <&qos_vop_big_w>;
+					};
+					pd_vopl {
+						reg = <RK3399_PD_VOPL>;
+						clocks = <&cru ACLK_VOP1>,
+							 <&cru HCLK_VOP1>;
+						pm_qos = <&qos_vop_little>;
+					};
+				};
+			};
+			pd_gpu {
+				reg = <RK3399_PD_GPU>;
+				clocks = <&cru ACLK_GPU>;
+				pm_qos = <&qos_gpu>;
+			};
+		};
+	};
+
 	pmugrf: syscon@ff320000 {
 		compatible = "rockchip,rk3399-pmugrf", "syscon", "simple-mfd";
 		reg = <0x0 0xff320000 0x0 0x1000>;
-- 
1.9.1
