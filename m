From: Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 1/3] ARM: dts: rockchip: phycore: Remove 1.8 GHz operation
 point
Date: Tue, 13 Feb 2018 10:44:32 +0100
Message-ID: <1518515074-22526-1-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Rockchip recommends to run the CPU cores only with operations points of
1.6 GHz or lower.

Removed the cpu0 node with too high operation points and use the default
values instead.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm/boot/dts/rk3288-phycore-som.dtsi | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-phycore-som.dtsi b/arch/arm/boot/dts/rk3288-phycore-som.dtsi
index 99cfae8..5eae477 100644
--- a/arch/arm/boot/dts/rk3288-phycore-som.dtsi
+++ b/arch/arm/boot/dts/rk3288-phycore-som.dtsi
@@ -110,26 +110,6 @@
 	};
 };
 
-&cpu0 {
-	cpu0-supply = <&vdd_cpu>;
-	operating-points = <
-		/* KHz    uV */
-		1800000	1400000
-		1608000	1350000
-		1512000 1300000
-		1416000 1200000
-		1200000 1100000
-		1008000 1050000
-		 816000 1000000
-		 696000  950000
-		 600000  900000
-		 408000  900000
-		 312000  900000
-		 216000  900000
-		 126000  900000
-	>;
-};
-
 &emmc {
 	status = "okay";
 	bus-width = <8>;
-- 
2.7.4
