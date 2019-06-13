From: Justin Swartz <justin.swartz-4mSLLtuPuFdOJuVFMUvaKw@public.gmane.org>
Subject: [PATCH] ARM: dts: rockchip: add display nodes for rk322x
Date: Thu, 13 Jun 2019 10:13:04 +0000
Message-ID: <20190613101305.30491-1-justin.swartz@risingedge.co.za>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Justin Swartz <justin.swartz-4mSLLtuPuFdOJuVFMUvaKw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add display_subsystem, hdmi_phy, vop, and hdmi device nodes plus
a few hdmi pinctrl entries to allow for HDMI output.

Signed-off-by: Justin Swartz <justin.swartz-4mSLLtuPuFdOJuVFMUvaKw@public.gmane.org>
---
 arch/arm/boot/dts/rk322x.dtsi | 83 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index da102fff96a2..7eb883eec126 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -143,6 +143,11 @@
 		#clock-cells = <0>;
 	};
 
+	display_subsystem: display-subsystem {
+		compatible = "rockchip,display-subsystem";
+		ports = <&vop_out>;
+	};
+
 	i2s1: i2s1@100b0000 {
 		compatible = "rockchip,rk3228-i2s", "rockchip,rk3066-i2s";
 		reg = <0x100b0000 0x4000>;
@@ -529,6 +534,17 @@
 		status = "disabled";
 	};
 
+	hdmi_phy: hdmi-phy@12030000 {
+		compatible = "rockchip,rk3228-hdmi-phy";
+		reg = <0x12030000 0x10000>;
+		clocks = <&cru PCLK_HDMI_PHY>, <&xin24m>, <&cru DCLK_HDMI_PHY>;
+		clock-names = "sysclk", "refoclk", "refpclk";
+		#clock-cells = <0>;
+		clock-output-names = "hdmiphy_phy";
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
 	gpu: gpu@20000000 {
 		compatible = "rockchip,rk3228-mali", "arm,mali-400";
 		reg = <0x20000000 0x10000>;
@@ -572,6 +588,28 @@
 		status = "disabled";
 	};
 
+	vop: vop@20050000 {
+		compatible = "rockchip,rk3228-vop";
+		reg = <0x20050000 0x1ffc>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_VOP>;
+		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		resets = <&cru SRST_VOP_A>, <&cru SRST_VOP_H>, <&cru SRST_VOP_D>;
+		reset-names = "axi", "ahb", "dclk";
+		iommus = <&vop_mmu>;
+		status = "disabled";
+
+		vop_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			vop_out_hdmi: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_in_vop>;
+			};
+		};
+	};
+
 	vop_mmu: iommu@20053f00 {
 		compatible = "rockchip,iommu";
 		reg = <0x20053f00 0x100>;
@@ -579,7 +617,7 @@
 		interrupt-names = "vop_mmu";
 		clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
 		clock-names = "aclk", "iface";
-		iommu-cells = <0>;
+		#iommu-cells = <0>;
 		status = "disabled";
 	};
 
@@ -594,6 +632,34 @@
 		status = "disabled";
 	};
 
+	hdmi: hdmi@200a0000 {
+		compatible = "rockchip,rk3228-dw-hdmi";
+		reg = <0x200a0000 0x20000>;
+		reg-io-width = <4>;
+		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_HDMI_HDCP>, <&cru PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_CEC>;
+		clock-names = "isfr", "iahb", "cec";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmii2c_xfer &hdmi_hpd &hdmi_cec>;
+		resets = <&cru SRST_HDMI_P>;
+		reset-names = "hdmi";
+		phys = <&hdmi_phy>;
+		phy-names = "hdmi";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			hdmi_in: port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hdmi_in_vop: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vop_out_hdmi>;
+				};
+			};
+		};
+	};
+
 	sdmmc: dwmmc@30000000 {
 		compatible = "rockchip,rk3228-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x30000000 0x4000>;
@@ -922,6 +988,21 @@
 			};
 		};
 
+		hdmi {
+			hdmi_hpd: hdmi-hpd {
+				rockchip,pins = <0 RK_PB7 1 &pcfg_pull_down>;
+			};
+
+			hdmii2c_xfer: hdmii2c-xfer {
+				rockchip,pins = <0 RK_PA6 2 &pcfg_pull_none>,
+						<0 RK_PA7 2 &pcfg_pull_none>;
+			};
+
+			hdmi_cec: hdmi-cec {
+				rockchip,pins = <0 RK_PC4 1 &pcfg_pull_none>;
+			};
+		};
+
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
 				rockchip,pins = <0 RK_PA0 1 &pcfg_pull_none>,
-- 
2.11.0
