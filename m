From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/5] arm: dts: lpc32xx: change include syntax to be C preprocessor friendly
Date: Tue, 13 Oct 2015 02:54:01 +0300
Message-ID: <1444694045-22000-2-git-send-email-vz@mleia.com>
References: <1444694045-22000-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444694045-22000-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The change replaces /include/ to #include in lpc32xx.dtsi and
derivatives, it is required, if C preprocessor is intended to be used
over dtsi/dts files, otherwise errors like one below are generated:

  Error: ea3250.dts:15.1-9 syntax error
  FATAL ERROR: Unable to parse input tree

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/ea3250.dts   | 2 +-
 arch/arm/boot/dts/lpc32xx.dtsi | 2 +-
 arch/arm/boot/dts/phy3250.dts  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ea3250.dts b/arch/arm/boot/dts/ea3250.dts
index a4ba31b..121d032 100644
--- a/arch/arm/boot/dts/ea3250.dts
+++ b/arch/arm/boot/dts/ea3250.dts
@@ -12,7 +12,7 @@
  */
 
 /dts-v1/;
-/include/ "lpc32xx.dtsi"
+#include "lpc32xx.dtsi"
 
 / {
 	model = "Embedded Artists LPC3250 board based on NXP LPC3250";
diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 3abebb7..f35e982 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -11,7 +11,7 @@
  * http://www.gnu.org/copyleft/gpl.html
  */
 
-/include/ "skeleton.dtsi"
+#include "skeleton.dtsi"
 
 / {
 	compatible = "nxp,lpc3220";
diff --git a/arch/arm/boot/dts/phy3250.dts b/arch/arm/boot/dts/phy3250.dts
index 90fdbd7..2a2d2cf 100644
--- a/arch/arm/boot/dts/phy3250.dts
+++ b/arch/arm/boot/dts/phy3250.dts
@@ -12,7 +12,7 @@
  */
 
 /dts-v1/;
-/include/ "lpc32xx.dtsi"
+#include "lpc32xx.dtsi"
 
 / {
 	model = "PHYTEC phyCORE-LPC3250 board based on NXP LPC3250";
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
