From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/2] ARM: dts: rockchip: add cpu opp table for rv1108
Date: Mon, 21 Aug 2017 17:06:44 +0800
Message-ID: <1503306404-28876-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add cpu opp table for rv1108 to support frequency
from 408MHZ to 1008MHZ.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 arch/arm/boot/dts/rv1108-evb.dts | 4 ++++
 arch/arm/boot/dts/rv1108.dtsi    | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
index 32fb09a..e517aa3 100644
--- a/arch/arm/boot/dts/rv1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -104,6 +104,10 @@
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&vdd_core>;
+};
+
 &i2c0 {
 	status = "okay";
 	i2c-scl-rising-time-ns = <275>;
diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 064cec3..6ebf07c 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -69,6 +69,15 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0xf00>;
+			operating-points = <
+				/* KHz    uV */
+				408000	975000
+				600000	975000
+				816000	1025000
+				1008000	1150000
+			>;
+			clock-latency = <40000>;
+			clocks = <&cru ARMCLK>;
 		};
 	};
 
-- 
2.7.4
