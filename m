From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 3/9] arm64: dts: rockchip: add VOP and VOP iommu node for
 rk3399
Date: Wed,  9 Nov 2016 21:21:55 +0800
Message-ID: <1478697721-2323-4-git-send-email-wxt@rock-chips.com>
References: <1478697721-2323-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1478697721-2323-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Add the core display-subsystem node and the two display controllers
available on the rk3399.

Signed-off-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v2: None

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index e5b5b3d..f1d289a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1290,6 +1290,64 @@
 		status = "disabled";
 	};
 
+	vopl: vop@ff8f0000 {
+		compatible = "rockchip,rk3399-vop-lit";
+		reg = <0x0 0xff8f0000 0x0 0x3efc>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VOP1>, <&cru DCLK_VOP1>, <&cru HCLK_VOP1>;
+		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		resets = <&cru SRST_A_VOP1>, <&cru SRST_H_VOP1>, <&cru SRST_D_VOP1>;
+		reset-names = "axi", "ahb", "dclk";
+		iommus = <&vopl_mmu>;
+		status = "disabled";
+
+		vopl_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	vopl_mmu: iommu@ff8f3f00 {
+		compatible = "rockchip,iommu";
+		reg = <0x0 0xff8f3f00 0x0 0x100>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vopl_mmu";
+		#iommu-cells = <0>;
+		status = "disabled";
+	};
+
+	vopb: vop@ff900000 {
+		compatible = "rockchip,rk3399-vop-big";
+		reg = <0x0 0xff900000 0x0 0x3efc>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VOP0>, <&cru DCLK_VOP0>, <&cru HCLK_VOP0>;
+		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		resets = <&cru SRST_A_VOP0>, <&cru SRST_H_VOP0>, <&cru SRST_D_VOP0>;
+		reset-names = "axi", "ahb", "dclk";
+		iommus = <&vopb_mmu>;
+		status = "disabled";
+
+		vopb_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	vopb_mmu: iommu@ff903f00 {
+		compatible = "rockchip,iommu";
+		reg = <0x0 0xff903f00 0x0 0x100>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vopb_mmu";
+		#iommu-cells = <0>;
+		status = "disabled";
+	};
+
+	display_subsystem: display-subsystem {
+		compatible = "rockchip,display-subsystem";
+		ports = <&vopl_out>, <&vopb_out>;
+		status = "disabled";
+	};
+
 	pinctrl: pinctrl {
 		compatible = "rockchip,rk3399-pinctrl";
 		rockchip,grf = <&grf>;
-- 
2.7.4
