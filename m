From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] ARM: dts: rockchip: fix rk3288 cpu opp node reference
Date: Sun, 24 Feb 2019 21:51:22 +0000
Message-ID: <AM3PR03MB0966C52CCF14FCEDE6615265AC790@AM3PR03MB0966.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>
List-Id: devicetree@vger.kernel.org

The following error can be seen during boot:

  of: /cpus/cpu@501: Couldn't find opp node

Change cpu nodes to use operating-points-v2 in order to fix this.

Fixes: ce76de984649 ("ARM: dts: rockchip: convert rk3288 to operating-points-v2")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm/boot/dts/rk3288.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index ca7d52daa8fb..09868dcee34b 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -70,7 +70,7 @@
 			compatible = "arm,cortex-a12";
 			reg = <0x501>;
 			resets = <&cru SRST_CORE1>;
-			operating-points = <&cpu_opp_table>;
+			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 			clock-latency = <40000>;
 			clocks = <&cru ARMCLK>;
@@ -80,7 +80,7 @@
 			compatible = "arm,cortex-a12";
 			reg = <0x502>;
 			resets = <&cru SRST_CORE2>;
-			operating-points = <&cpu_opp_table>;
+			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 			clock-latency = <40000>;
 			clocks = <&cru ARMCLK>;
@@ -90,7 +90,7 @@
 			compatible = "arm,cortex-a12";
 			reg = <0x503>;
 			resets = <&cru SRST_CORE3>;
-			operating-points = <&cpu_opp_table>;
+			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 			clock-latency = <40000>;
 			clocks = <&cru ARMCLK>;
-- 
2.17.1
