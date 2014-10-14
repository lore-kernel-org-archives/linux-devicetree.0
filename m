From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 8/8] ARM: ux500: Add i2c devices to the VAPE PM domain
Date: Tue, 14 Oct 2014 11:13:01 +0200
Message-ID: <1413277981-27451-9-git-send-email-ulf.hansson@linaro.org>
References: <1413277981-27451-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413277981-27451-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jinkun Hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The i2c-nomadik driver handle these devices properly from a runtime PM
perspective. Therefore, let's add them into VAPE PM domain for ux500.

Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index c51c11f..bfd3f1c 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -641,6 +641,7 @@
 			clock-frequency = <400000>;
 			clocks = <&prcc_kclk 3 3>, <&prcc_pclk 3 3>;
 			clock-names = "i2cclk", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 		};
 
 		i2c@80122000 {
@@ -656,6 +657,7 @@
 
 			clocks = <&prcc_kclk 1 2>, <&prcc_pclk 1 2>;
 			clock-names = "i2cclk", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 		};
 
 		i2c@80128000 {
@@ -671,6 +673,7 @@
 
 			clocks = <&prcc_kclk 1 6>, <&prcc_pclk 1 6>;
 			clock-names = "i2cclk", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 		};
 
 		i2c@80110000 {
@@ -686,6 +689,7 @@
 
 			clocks = <&prcc_kclk 2 0>, <&prcc_pclk 2 0>;
 			clock-names = "i2cclk", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 		};
 
 		i2c@8012a000 {
@@ -701,6 +705,7 @@
 
 			clocks = <&prcc_kclk 1 9>, <&prcc_pclk 1 10>;
 			clock-names = "i2cclk", "apb_pclk";
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 		};
 
 		ssp@80002000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
