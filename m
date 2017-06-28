From: mindentropy <mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Modified imx7d-sdb.dts file so that VLDO4 provides 2.8V for MIPI CSI/DSI
Date: Wed, 28 Jun 2017 23:15:18 +0530
Message-ID: <20170628174518.5950-1-mindentropy@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gautam Bhat <mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

 * According to mx7sabresd schematics the MIPI CSI/DSI voltage rails
   should be 2.8V but the voltage provided is a maximum of 3.3V and
   minimum of 1.8V. Providing such a higher voltage might damage the
   peripherals and violates the schematic settings.

Signed-off-by: Gautam Bhat <mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/imx7d-sdb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index 5be01a1bf840..1da1f97ec342 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -262,8 +262,8 @@
 			};
 
 			vgen6_reg: vldo4 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
 				regulator-always-on;
 			};
 		};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
