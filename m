From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 4/5] arm: dts: lpc32xx: add reg property to cpu device node
Date: Tue, 13 Oct 2015 19:20:37 +0300
Message-ID: <1444753237-6451-1-git-send-email-vz@mleia.com>
References: <1444694045-22000-5-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444694045-22000-5-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

According to device tree bindings for ARM cpus cpu node must contain a
reg property for enumeration scheme.

The change adds reg = <0x0> indicating that the processor does not
have CPU identification register and updates cell settings.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
Changes from v1 to v2:
- instead of removing address/size cells properties update them
  in accordance to ARM CPU device tree bindings, thanks to Joachim for review

The change replaces 4/5 "arm: dts: lpc32xx: remove unneeded cell settings from cpus"

 arch/arm/boot/dts/lpc32xx.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index dcb52cb..343a94f 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -18,12 +18,13 @@
 	interrupt-parent = <&mic>;
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			compatible = "arm,arm926ej-s";
 			device_type = "cpu";
+			reg = <0x0>;
 		};
 	};
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
