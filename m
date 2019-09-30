From: Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 4/5] ARM: dts: rockchip: Add RK3288 VOP gamma LUT address
Date: Mon, 30 Sep 2019 19:28:01 -0300
Message-ID: <20190930222802.32088-5-ezequiel@collabora.com>
References: <20190930222802.32088-1-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190930222802.32088-1-ezequiel@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, kernel@collabora.com, Sean Paul <seanpaul@chromium.org>, Boris Brezillon <boris.brezillon@collabora.com>, Douglas Anderson <dianders@chromium.org>, Jacopo Mondi <jacopo@jmondi.org>, Ilia Mirkin <imirkin@alum.mit.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>
List-Id: devicetree@vger.kernel.org

RK3288 SoC VOPs have optional support Gamma LUT setting,
which requires specifying the Gamma LUT address in the devicetree.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
Changes from v2:
* None.
Changes from v1:
* Drop reg-names, as suggested by Doug.
---
 arch/arm/boot/dts/rk3288.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index cc893e154fe5..c6fc633ace80 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1023,7 +1023,7 @@
 
 	vopb: vop@ff930000 {
 		compatible = "rockchip,rk3288-vop";
-		reg = <0x0 0xff930000 0x0 0x19c>;
+		reg = <0x0 0xff930000 0x0 0x19c>, <0x0 0xff931000 0x0 0x1000>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP0>, <&cru DCLK_VOP0>, <&cru HCLK_VOP0>;
 		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
@@ -1073,7 +1073,7 @@
 
 	vopl: vop@ff940000 {
 		compatible = "rockchip,rk3288-vop";
-		reg = <0x0 0xff940000 0x0 0x19c>;
+		reg = <0x0 0xff940000 0x0 0x19c>, <0x0 0xff941000 0x0 0x1000>;
 		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP1>, <&cru DCLK_VOP1>, <&cru HCLK_VOP1>;
 		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
-- 
2.22.0
