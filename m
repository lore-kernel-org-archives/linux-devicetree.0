From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] arm: dts: lpc32xx: fix improper usage of ranges property
Date: Tue, 13 Oct 2015 02:54:02 +0300
Message-ID: <1444694045-22000-3-git-send-email-vz@mleia.com>
References: <1444694045-22000-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444694045-22000-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The change corrects invalid custom translations to 1:1 translations,
otherwise during initialization there are too many failed attempts to
translate addresses from subnodes, which anyway result in fallback 1:1
translations, also it is found that due to this problem proper usage
of ranges property in subnodes (e.g. for defining flash partitions)
can not be done.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index f35e982..3ef804c 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -31,7 +31,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
-		ranges = <0x20000000 0x20000000 0x30000000>;
+		ranges;
 
 		/*
 		 * Enable either SLC or MLC
@@ -89,7 +89,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
-			ranges = <0x20000000 0x20000000 0x30000000>;
+			ranges;
 
 			ssp0: ssp@20084000 {
 				compatible = "arm,pl022", "arm,primecell";
@@ -207,7 +207,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
-			ranges = <0x20000000 0x20000000 0x30000000>;
+			ranges;
 
 			/*
 			 * MIC Interrupt controller includes:
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
