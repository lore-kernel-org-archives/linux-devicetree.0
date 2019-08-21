From: Jonas Karlman <jonas@kwiboo.se>
Subject: [RESEND PATCH] arm64: dts: rockchip: add rk3328 VPU node
Date: Wed, 21 Aug 2019 17:54:38 +0000
Message-ID: <HE1PR06MB4011C8496657B2C267A66327ACAA0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>
List-Id: devicetree@vger.kernel.org

This patch add a VPU device node for rk3328.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
It would be great if this can be considered for v5.4,
related dt-bindings commit has been merged in media tree for v5.4.

Decoding using hantro driver has been tested on a Pine64 Rock64 RK3328 device.
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
