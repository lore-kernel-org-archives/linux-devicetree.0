From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 3/6] ARM: dts: rockchip: add cpu-core resets for rk3188
Date: Tue, 13 Nov 2018 14:05:56 +0100
Message-ID: <20181113130559.31221-4-heiko@sntech.de>
References: <20181113130559.31221-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181113130559.31221-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>

Specify the reset handles for each cpu core.

Signed-off-by: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
---
 arch/arm/boot/dts/rk3188.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 9d8c4c560e51..f1f7a36b46d4 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -26,6 +26,7 @@
 			clock-latency = <40000>;
 			clocks = <&cru ARMCLK>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			resets = <&cru SRST_CORE0>;
 		};
 		cpu@1 {
 			device_type = "cpu";
@@ -33,6 +34,7 @@
 			next-level-cache = <&L2>;
 			reg = <0x1>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			resets = <&cru SRST_CORE1>;
 		};
 		cpu@2 {
 			device_type = "cpu";
@@ -40,6 +42,7 @@
 			next-level-cache = <&L2>;
 			reg = <0x2>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			resets = <&cru SRST_CORE2>;
 		};
 		cpu@3 {
 			device_type = "cpu";
@@ -47,6 +50,7 @@
 			next-level-cache = <&L2>;
 			reg = <0x3>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			resets = <&cru SRST_CORE3>;
 		};
 	};
 
-- 
2.18.0
