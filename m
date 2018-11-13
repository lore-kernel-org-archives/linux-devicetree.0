From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/6] ARM: dts: rockchip: convert rk3188 to opp-v2
Date: Tue, 13 Nov 2018 14:05:55 +0100
Message-ID: <20181113130559.31221-3-heiko@sntech.de>
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

The fact that OPPs specified only on cpu0 work is Linux specific and
normally cpu frequencies should be specified for each cpu core.
To facilitate this without needing to duplicate the frequency table
each time, convert to opp-v2 before adding references to all cores.

Signed-off-by: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
---
 arch/arm/boot/dts/rk3188.dtsi | 55 ++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index fd896b0a46e3..9d8c4c560e51 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -23,37 +23,70 @@
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
 			reg = <0x0>;
-			operating-points = <
-				/* kHz    uV */
-				1608000 1350000
-				1416000 1250000
-				1200000 1150000
-				1008000 1075000
-				 816000  975000
-				 600000  950000
-				 504000  925000
-				 312000  875000
-			>;
 			clock-latency = <40000>;
 			clocks = <&cru ARMCLK>;
+			operating-points-v2 = <&cpu0_opp_table>;
 		};
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
 			reg = <0x1>;
+			operating-points-v2 = <&cpu0_opp_table>;
 		};
 		cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
 			reg = <0x2>;
+			operating-points-v2 = <&cpu0_opp_table>;
 		};
 		cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
 			reg = <0x3>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+	};
+
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-312000000 {
+			opp-hz = /bits/ 64 <312000000>;
+			opp-microvolt = <875000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-504000000 {
+			opp-hz = /bits/ 64 <504000000>;
+			opp-microvolt = <925000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <950000>;
+			opp-suspend;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <975000>;
+		};
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1075000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-1416000000 {
+			opp-hz = /bits/ 64 <1416000000>;
+			opp-microvolt = <1250000>;
+		};
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <1350000>;
 		};
 	};
 
-- 
2.18.0
