From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] arm: dts: phy3250: add lcd and backlight fixed regulators
Date: Sun, 20 Dec 2015 01:32:10 +0200
Message-ID: <1450567932-22994-2-git-send-email-vz@mleia.com>
References: <1450567932-22994-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450567932-22994-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Phytec PHY3250 board has GPIO controlled regulators for LCD and
backlight, add their descriptions to board DTS file.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/phy3250.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/phy3250.dts b/arch/arm/boot/dts/phy3250.dts
index 7d253bb..34e15fd 100644
--- a/arch/arm/boot/dts/phy3250.dts
+++ b/arch/arm/boot/dts/phy3250.dts
@@ -25,6 +25,28 @@
 		reg = <0x80000000 0x4000000>;
 	};
 
+	regulators {
+		backlight_reg: fixed-regulator@0 {
+			compatible = "regulator-fixed";
+			regulator-name = "backlight_reg";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			gpio = <&gpio 5 4 0>;
+			enable-active-high;
+			regulator-boot-on;
+		};
+
+		lcd_reg: fixed-regulator@1 {
+			compatible = "regulator-fixed";
+			regulator-name = "lcd_reg";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			gpio = <&gpio 5 0 0>;
+			enable-active-high;
+			regulator-boot-on;
+		};
+	};
+
 	ahb {
 		mac: ethernet@31060000 {
 			phy-mode = "rmii";
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
