From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] ARM: dts: rockchip: rv1108-evb: Use the correct regulator properties
Date: Tue, 29 Jan 2019 17:54:24 -0200
Message-ID: <20190129195424.10161-4-otavio@ossystems.com.br>
References: <20190129195424.10161-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129195424.10161-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Jason Zhu <jason.zhu@rock-chips.com>, Vicent Chi <vicent.chi@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Philipp Tomsic <philipp.tomsich@theobroma-systems.com>, Tony Xie <tony.xie@rock-chips.com>, Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The following properties:

- regulator-state-enabled
- regulator-state-disabled
- regulator-state-uv

are not valid ones as per
Documentation/devicetree/bindings/regulator/regulator.txt

Fix it by using the correct properties as per the dt bindings.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/rv1108-evb.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
index 203d83e3bbf5..30f3d0470ad9 100644
--- a/arch/arm/boot/dts/rv1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -97,8 +97,8 @@
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-state-mem {
-					regulator-state-enabled;
-					regulator-state-uv = <900000>;
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
 				};
 			};
 
@@ -107,7 +107,7 @@
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <2000000>;
 				regulator-state-mem {
-					regulator-state-disabled;
+					regulator-off-in-suspend;
 				};
 			};
 
@@ -116,7 +116,7 @@
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-state-mem {
-					regulator-state-enabled;
+					regulator-on-in-suspend;
 				};
 			};
 
@@ -127,8 +127,8 @@
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-state-mem {
-					regulator-state-enabled;
-					regulator-state-uv = <3300000>;
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
 				};
 			};
 
@@ -139,7 +139,7 @@
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-state-mem {
-					regulator-state-disabled;
+					regulator-off-in-suspend;
 				};
 			};
 
@@ -150,7 +150,7 @@
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-state-mem {
-					regulator-state-disabled;
+					regulator-off-in-suspend;
 				};
 			};
 
@@ -161,8 +161,8 @@
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-state-mem {
-					regulator-state-enabled;
-					regulator-state-uv = <1000000>;
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1000000>;
 				};
 			};
 		};
-- 
2.20.1
