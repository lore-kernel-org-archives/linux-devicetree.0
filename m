From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/12] ARM: dts: imx53-m53: Remove unneeded reg property
Date: Fri,  1 Dec 2017 17:24:36 -0200
Message-ID: <1512156285-18451-3-git-send-email-festevam@gmail.com>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512156285-18451-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

As described in
Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
there is no 'reg' property under stmpe_touchscreen, so remove it
to fix the following build warning with W=1:

arch/arm/boot/dts/imx53-m53evk.dtb: Warning (unit_address_vs_reg): Node /soc/aips@60000000/i2c@63fc4000/stmpe610@41/stmpe_touchscreen has a reg or ranges property, but no unit name

Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx53-m53.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx53-m53.dtsi b/arch/arm/boot/dts/imx53-m53.dtsi
index ec390aa5..7ce69c6 100644
--- a/arch/arm/boot/dts/imx53-m53.dtsi
+++ b/arch/arm/boot/dts/imx53-m53.dtsi
@@ -64,7 +64,6 @@
 
 		stmpe_touchscreen {
 			compatible = "st,stmpe-ts";
-			reg = <0>;
 			st,sample-time = <4>;
 			st,mod-12b = <1>;
 			st,ref-sel = <0>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
