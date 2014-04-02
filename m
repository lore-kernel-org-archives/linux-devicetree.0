From: stefan-XLVq0VzYD2Y@public.gmane.org
Subject: [PATCH v2 2/2] ARM: dts: SPEAr: fix wrong stmpe-ts bindings
Date: Wed,  2 Apr 2014 19:05:38 +0200
Message-ID: <d4a7f6bcdf6ec00970aabb9ff501c7d342f37bd7.1396457876.git.stefan@agner.ch>
References: <cover.1396457876.git.stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1396457876.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Fix bindings for STMPE touchscreen controller to match the documented
bindings and the actual bindings used by the driver.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
---
 arch/arm/boot/dts/spear1310-evb.dts | 18 +++++++++---------
 arch/arm/boot/dts/spear1340-evb.dts | 18 +++++++++---------
 arch/arm/boot/dts/spear320-hmi.dts  | 20 ++++++++++----------
 3 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/spear1310-evb.dts b/arch/arm/boot/dts/spear1310-evb.dts
index b56a801..fe2ece2 100644
--- a/arch/arm/boot/dts/spear1310-evb.dts
+++ b/arch/arm/boot/dts/spear1310-evb.dts
@@ -369,15 +369,15 @@
 
 					stmpe_touchscreen {
 						compatible = "st,stmpe-ts";
-						ts,sample-time = <4>;
-						ts,mod-12b = <1>;
-						ts,ref-sel = <0>;
-						ts,adc-freq = <1>;
-						ts,ave-ctrl = <1>;
-						ts,touch-det-delay = <2>;
-						ts,settling = <2>;
-						ts,fraction-z = <7>;
-						ts,i-drive = <1>;
+						st,sample-time = <4>;
+						st,mod-12b = <1>;
+						st,ref-sel = <0>;
+						st,adc-freq = <1>;
+						st,ave-ctrl = <1>;
+						st,touch-det-delay = <2>;
+						st,settling = <2>;
+						st,fraction-z = <7>;
+						st,i-drive = <1>;
 					};
 				};
 
diff --git a/arch/arm/boot/dts/spear1340-evb.dts b/arch/arm/boot/dts/spear1340-evb.dts
index d6c30ae..d3dcba9 100644
--- a/arch/arm/boot/dts/spear1340-evb.dts
+++ b/arch/arm/boot/dts/spear1340-evb.dts
@@ -480,15 +480,15 @@
 
 					stmpe_touchscreen {
 						compatible = "st,stmpe-ts";
-						ts,sample-time = <4>;
-						ts,mod-12b = <1>;
-						ts,ref-sel = <0>;
-						ts,adc-freq = <1>;
-						ts,ave-ctrl = <1>;
-						ts,touch-det-delay = <2>;
-						ts,settling = <2>;
-						ts,fraction-z = <7>;
-						ts,i-drive = <1>;
+						st,sample-time = <4>;
+						st,mod-12b = <1>;
+						st,ref-sel = <0>;
+						st,adc-freq = <1>;
+						st,ave-ctrl = <1>;
+						st,touch-det-delay = <2>;
+						st,settling = <2>;
+						st,fraction-z = <7>;
+						st,i-drive = <1>;
 					};
 				};
 
diff --git a/arch/arm/boot/dts/spear320-hmi.dts b/arch/arm/boot/dts/spear320-hmi.dts
index 3075d2d..2a5d013 100644
--- a/arch/arm/boot/dts/spear320-hmi.dts
+++ b/arch/arm/boot/dts/spear320-hmi.dts
@@ -256,17 +256,17 @@
 					};
 
 					stmpe610-ts {
-						compatible = "stmpe,ts";
+						compatible = "st,stmpe-ts";
 						reg = <0>;
-						ts,sample-time = <4>;
-						ts,mod-12b = <1>;
-						ts,ref-sel = <0>;
-						ts,adc-freq = <1>;
-						ts,ave-ctrl = <1>;
-						ts,touch-det-delay = <3>;
-						ts,settling = <4>;
-						ts,fraction-z = <7>;
-						ts,i-drive = <1>;
+						st,sample-time = <4>;
+						st,mod-12b = <1>;
+						st,ref-sel = <0>;
+						st,adc-freq = <1>;
+						st,ave-ctrl = <1>;
+						st,touch-det-delay = <3>;
+						st,settling = <4>;
+						st,fraction-z = <7>;
+						st,i-drive = <1>;
 					};
 				};
 			};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
