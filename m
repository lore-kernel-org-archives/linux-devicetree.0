From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 3/7] dt-bindings: add compatibles for rk3066/rk3188 power
 controllers
Date: Sun, 23 Sep 2018 17:23:52 +0200
Message-ID: <20180923152356.30154-4-heiko@sntech.de>
References: <20180923152356.30154-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180923152356.30154-1-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-rockchip@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, chauveau.julien@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the compatible values for the power-domain controllers found on
rk3066 and rk3188.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/soc/rockchip/power_domain.txt         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt b/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
index 5d49d0a2ff29..8304eceb62e4 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
+++ b/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
@@ -7,7 +7,9 @@ Required properties for power domain controller:
 - compatible: Should be one of the following.
 	"rockchip,px30-power-controller" - for PX30 SoCs.
 	"rockchip,rk3036-power-controller" - for RK3036 SoCs.
+	"rockchip,rk3066-power-controller" - for RK3066 SoCs.
 	"rockchip,rk3128-power-controller" - for RK3128 SoCs.
+	"rockchip,rk3188-power-controller" - for RK3188 SoCs.
 	"rockchip,rk3228-power-controller" - for RK3228 SoCs.
 	"rockchip,rk3288-power-controller" - for RK3288 SoCs.
 	"rockchip,rk3328-power-controller" - for RK3328 SoCs.
@@ -23,7 +25,9 @@ Required properties for power domain sub nodes:
 - reg: index of the power domain, should use macros in:
 	"include/dt-bindings/power/px30-power.h" - for PX30 type power domain.
 	"include/dt-bindings/power/rk3036-power.h" - for RK3036 type power domain.
+	"include/dt-bindings/power/rk3066-power.h" - for RK3066 type power domain.
 	"include/dt-bindings/power/rk3128-power.h" - for RK3128 type power domain.
+	"include/dt-bindings/power/rk3188-power.h" - for RK3188 type power domain.
 	"include/dt-bindings/power/rk3228-power.h" - for RK3228 type power domain.
 	"include/dt-bindings/power/rk3288-power.h" - for RK3288 type power domain.
 	"include/dt-bindings/power/rk3328-power.h" - for RK3328 type power domain.
-- 
2.18.0
