From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 5/8] ARM: dts: rockchip: Add missing unit name to memory nodes in rk3036 boards
Date: Fri,  9 Sep 2016 10:01:06 -0400
Message-ID: <1473429669-6185-6-git-send-email-javier@osg.samsung.com>
References: <1473429669-6185-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473429669-6185-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: devicetree@vger.kernel.org

This patch fixes the following DTC warnings:

"Node /memory has a reg or ranges property, but no unit name"

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/boot/dts/rk3036-evb.dts   | 2 +-
 arch/arm/boot/dts/rk3036-kylin.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3036-evb.dts b/arch/arm/boot/dts/rk3036-evb.dts
index 8db9e9b197a2..2f5f15524fba 100644
--- a/arch/arm/boot/dts/rk3036-evb.dts
+++ b/arch/arm/boot/dts/rk3036-evb.dts
@@ -46,7 +46,7 @@
 	model = "Rockchip RK3036 Evaluation board";
 	compatible = "rockchip,rk3036-evb", "rockchip,rk3036";
 
-	memory {
+	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/rk3036-kylin.dts b/arch/arm/boot/dts/rk3036-kylin.dts
index 1df1557a46c3..3de958ec29c0 100644
--- a/arch/arm/boot/dts/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rk3036-kylin.dts
@@ -46,7 +46,7 @@
 	model = "Rockchip RK3036 KylinBoard";
 	compatible = "rockchip,rk3036-kylin", "rockchip,rk3036";
 
-	memory {
+	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x20000000>;
 	};
-- 
2.7.4
