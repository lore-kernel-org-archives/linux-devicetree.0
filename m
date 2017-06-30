From: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH] ARM: dts: imx: Correct B850v3 clock assignment
Date: Fri, 30 Jun 2017 15:43:37 +0200
Message-ID: <20170630134337.18245-1-romain.perier@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

The IPU that drives HDMI must have its pre_sel set to pll2_pfd_396m
to avoid stepping on the LVDS output's toes, as the PLL can't be clocked
to the pixel clock and to the LVDS serial clock (3.5*pixel clock) at the
same time.

As we are using ipu1_di0 and ipu2_di0, ensure both are switched to
to pll2_pfd2_396m to avoid issues. The LDB driver will switch the
required IPU to ldb_di1 when it uses it to drive LVDS.

Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Signed-off-by: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-b850v3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
index 2c1e98e..46bdc67 100644
--- a/arch/arm/boot/dts/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/imx6q-b850v3.dts
@@ -57,7 +57,7 @@
 	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
 			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>,
 			  <&clks IMX6QDL_CLK_IPU1_DI0_PRE_SEL>,
-			  <&clks IMX6QDL_CLK_IPU1_DI1_PRE_SEL>;
+			  <&clks IMX6QDL_CLK_IPU2_DI0_PRE_SEL>;
 	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>,
 				 <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>,
 				 <&clks IMX6QDL_CLK_PLL2_PFD2_396M>,
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
