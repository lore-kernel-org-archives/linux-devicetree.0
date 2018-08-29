From: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] arm64: dts: rockchip: perfection vop property define for px30
Date: Wed, 29 Aug 2018 11:17:13 +0800
Message-ID: <1535512642-81253-1-git-send-email-hjc@rock-chips.com>
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
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Liang Chen <cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add display ports for display-subsystem and add reset property
for vop node, if missing this two define, drm driver can't
probe sucess.

Signed-off-by: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index dc3b22c..b2f1716 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -157,6 +157,7 @@
 
 	display_subsystem: display-subsystem {
 		compatible = "rockchip,display-subsystem";
+		ports = <&vopb_out>, <&vopl_out>;
 		status = "disabled";
 	};
 
@@ -795,10 +796,16 @@
 		clocks = <&cru ACLK_VOPB>, <&cru DCLK_VOPB>,
 			 <&cru HCLK_VOPB>;
 		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		resets = <&cru SRST_VOPB_A>, <&cru SRST_VOPB_H>, <&cru SRST_VOPB>;
+		reset-names = "axi", "ahb", "dclk";
 		iommus = <&vopb_mmu>;
 		power-domains = <&power PX30_PD_VO>;
 		rockchip,grf = <&grf>;
 		status = "disabled";
+		vopb_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 
 	vopb_mmu: iommu@ff460f00 {
@@ -820,10 +827,16 @@
 		clocks = <&cru ACLK_VOPL>, <&cru DCLK_VOPL>,
 			 <&cru HCLK_VOPL>;
 		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		resets = <&cru SRST_VOPL_A>, <&cru SRST_VOPL_H>, <&cru SRST_VOPL>;
+		reset-names = "axi", "ahb", "dclk";
 		iommus = <&vopl_mmu>;
 		power-domains = <&power PX30_PD_VO>;
 		rockchip,grf = <&grf>;
 		status = "disabled";
+		vopl_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 
 	vopl_mmu: iommu@ff470f00 {
-- 
2.7.4
