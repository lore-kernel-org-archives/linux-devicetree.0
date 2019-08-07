From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] arm64: dts: rockchip: add rk3328 VPU node
Date: Wed, 7 Aug 2019 15:20:37 +0000
Message-ID: <HE1PR06MB4011E3DA40C22EA9FC337F53ACD40@HE1PR06MB4011.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>
List-Id: devicetree@vger.kernel.org

This patch add a VPU device node for rk3328.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index e9fefd8a7e02..4a175fff2861 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -278,6 +278,7 @@
 			};
 			pd_vpu@RK3328_PD_VPU {
 				reg = <RK3328_PD_VPU>;
+				clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
 			};
 		};
 
@@ -596,6 +597,17 @@
 		status = "disabled";
 	};
 
+	vpu: video-codec@ff350000 {
+		compatible = "rockchip,rk3328-vpu";
+		reg = <0x0 0xff350000 0x0 0x800>;
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vdpu";
+		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
+		clock-names = "aclk", "hclk";
+		iommus = <&vpu_mmu>;
+		power-domains = <&power RK3328_PD_VPU>;
+	};
+
 	vpu_mmu: iommu@ff350800 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff350800 0x0 0x40>;
@@ -604,7 +616,7 @@
 		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
 		clock-names = "aclk", "iface";
 		#iommu-cells = <0>;
-		status = "disabled";
+		power-domains = <&power RK3328_PD_VPU>;
 	};
 
 	rkvdec_mmu: iommu@ff360480 {
-- 
2.17.1
