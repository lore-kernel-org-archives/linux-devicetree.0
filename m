From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/2] ARM: dts: rockchip: correct regulator PM properties
Date: Tue, 18 Aug 2015 11:44:15 -0700
Message-ID: <1439923455-109818-2-git-send-email-briannorris@chromium.org>
References: <1439923455-109818-1-git-send-email-briannorris@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439923455-109818-1-git-send-email-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

This DTS file was submitted with non-upstream bindings. I happened
across this while reviewing the jaq DTS.

Signed-off-by: Brian Norris <briannorris@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
---
Tested on jaq, not minnie

 arch/arm/boot/dts/rk3288-veyron-minnie.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index 0e30bd6bf92b..6f619c154dc6 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -128,12 +128,16 @@
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			regulator-name = "vcc33_touch";
-			regulator-suspend-mem-disabled;
+			regulator-state-mem {
+				regulator-on-in-suspend;
+			};
 		};
 
 		vcc5v_touch: SWITCH_REG2 {
 			regulator-name = "vcc5v_touch";
-			regulator-suspend-mem-disabled;
+			regulator-state-mem {
+				regulator-on-in-suspend;
+			};
 		};
 	};
 };
-- 
2.5.0.276.gf5e568e
