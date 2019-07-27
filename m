From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ARM: dts: rockchip: Add missing unit address to memory node on rk3288-veyron
Date: Sat, 27 Jul 2019 16:27:36 +0200
Message-ID: <20190727142736.23188-2-krzk@kernel.org>
References: <20190727142736.23188-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727142736.23188-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: devicetree@vger.kernel.org

Fix DTC warning:

    arch/arm/boot/dts/rk3288-veyron.dtsi:21.9-24.4:
    Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/rk3288-veyron.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 8fc8eac699bf..02243ff46a65 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -18,7 +18,7 @@
 	 * The default coreboot on veyron devices ignores memory@0 nodes
 	 * and would instead create another memory node.
 	 */
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
-- 
2.17.1
