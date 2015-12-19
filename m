From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] arm: dts: phy3250: add SD fixed regulator
Date: Sun, 20 Dec 2015 01:32:11 +0200
Message-ID: <1450567932-22994-3-git-send-email-vz@mleia.com>
References: <1450567932-22994-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450567932-22994-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The change adds fixed voltage regulator for SD controller, ARM MMCI
controller driver uses it to control card power management.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/phy3250.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/phy3250.dts b/arch/arm/boot/dts/phy3250.dts
index 34e15fd..5465b9e 100644
--- a/arch/arm/boot/dts/phy3250.dts
+++ b/arch/arm/boot/dts/phy3250.dts
@@ -45,6 +45,15 @@
 			enable-active-high;
 			regulator-boot-on;
 		};
+
+		sd_reg: fixed-regulator@2 {
+			compatible = "regulator-fixed";
+			regulator-name = "sd_reg";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			gpio = <&gpio 5 5 0>;
+			enable-active-high;
+		};
 	};
 
 	ahb {
@@ -162,6 +171,7 @@
 				cd-gpios = <&gpio 3 1 0>;
 				cd-inverted;
 				bus-width = <4>;
+				vqmmc-supply = <&sd_reg>;
 				status = "okay";
 			};
 		};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
