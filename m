From: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6ul-liteboard: Support poweroff
Date: Tue,  1 Aug 2017 16:14:56 +0200
Message-ID: <20170801141456.10844-1-m.niestroj@grinn-global.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Support proper system power-off, which disables main regulator. This
results in much lower power consumption and support of power-on issued
by button press.

Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
---
 arch/arm/boot/dts/imx6ul-liteboard.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul-liteboard.dts b/arch/arm/boot/dts/imx6ul-liteboard.dts
index ed1d891d6a89..c4fb5ea28e86 100644
--- a/arch/arm/boot/dts/imx6ul-liteboard.dts
+++ b/arch/arm/boot/dts/imx6ul-liteboard.dts
@@ -145,3 +145,7 @@
 	wakeup-source;
 	status = "okay";
 };
+
+&snvs_poweroff {
+	status = "okay";
+};
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
