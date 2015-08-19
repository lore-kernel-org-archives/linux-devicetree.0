From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 2/3] ARM: dts: rockchip: correct regulator PM properties
Date: Wed, 19 Aug 2015 15:18:40 -0700
Message-ID: <1440022721-73712-2-git-send-email-briannorris@chromium.org>
References: <1440022721-73712-1-git-send-email-briannorris@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440022721-73712-1-git-send-email-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This DTS file was submitted with non-upstream bindings. I happened
across this while reviewing the jaq DTS.

Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Did not test minnie

v1 -> v2:
 - use "off-in-suspend", as that's the equivalent to the downstream
   'regulator-suspend-mem-disabled'

 arch/arm/boot/dts/rk3288-veyron-minnie.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index 0e30bd6bf92b..8fd8ef2c72da 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -128,12 +128,16 @@
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			regulator-name = "vcc33_touch";
-			regulator-suspend-mem-disabled;
+			regulator-state-mem {
+				regulator-off-in-suspend;
+			};
 		};
 
 		vcc5v_touch: SWITCH_REG2 {
 			regulator-name = "vcc5v_touch";
-			regulator-suspend-mem-disabled;
+			regulator-state-mem {
+				regulator-off-in-suspend;
+			};
 		};
 	};
 };
-- 
2.5.0.276.gf5e568e

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
