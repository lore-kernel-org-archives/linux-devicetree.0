From: Yaodong Liu <my375229675@gmail.com>
Subject: [PATCH] ARM: dts: rockchip: disable arm_global_timer for rk3066a
Date: Sun, 15 Apr 2018 12:35:55 +0800
Message-ID: <1523766955-9001-1-git-send-email-my375229675@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yaodong Liu <my375229675@gmail.com>
List-Id: devicetree@vger.kernel.org

The arm_global_timer provides unstable clock to sched_clock, it will
be selected by default instead of rockchip_timer. The same issue has
been fixed in rk3188.

So we must disable arm_global_timer to get the correct clocksource.

Signed-off-by: Yaodong Liu <my375229675@gmail.com>
---
 arch/arm/boot/dts/rk3066a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 06523ca..1920f93 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -749,3 +749,7 @@
 &emac {
 	compatible = "rockchip,rk3066-emac";
 };
+
+&global_timer {
+	status = "disabled";
+};
-- 
2.7.4
