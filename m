From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 6/8] ARM: ux500: Add sdi devices to the VAPE PM domain
Date: Tue, 14 Oct 2014 11:12:59 +0200
Message-ID: <1413277981-27451-7-git-send-email-ulf.hansson@linaro.org>
References: <1413277981-27451-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413277981-27451-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jinkun Hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The mmci driver handle these devices properly from a runtime PM
perspective, including register context save/restore. Therefore let's
add them into VAPE PM domain for ux500.

Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index d416974..41009c1 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -11,6 +11,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/mfd/dbx500-prcmu.h>
+#include <dt-bindings/arm/ux500_pm_domains.h>
 #include "skeleton.dtsi"
 
 / {
@@ -840,6 +841,7 @@
 
 			clocks = <&prcc_kclk 1 5>, <&prcc_pclk 1 5>;
 			clock-names = "sdi", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 
 			status = "disabled";
 		};
@@ -855,6 +857,7 @@
 
 			clocks = <&prcc_kclk 2 4>, <&prcc_pclk 2 6>;
 			clock-names = "sdi", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 
 			status = "disabled";
 		};
@@ -870,6 +873,7 @@
 
 			clocks = <&prcc_kclk 3 4>, <&prcc_pclk 3 4>;
 			clock-names = "sdi", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 
 			status = "disabled";
 		};
@@ -885,6 +889,7 @@
 
 			clocks = <&prcc_kclk 2 5>, <&prcc_pclk 2 7>;
 			clock-names = "sdi", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 
 			status = "disabled";
 		};
@@ -900,6 +905,7 @@
 
 			clocks = <&prcc_kclk 2 2>, <&prcc_pclk 2 4>;
 			clock-names = "sdi", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 
 			status = "disabled";
 		};
@@ -915,6 +921,7 @@
 
 			clocks = <&prcc_kclk 3 7>, <&prcc_pclk 3 7>;
 			clock-names = "sdi", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 
 			status = "disabled";
 		};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
