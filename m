From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/7] ARM: dts: add gpio-ranges property to iMX6UL GPIO controllers
Date: Sat, 20 Aug 2016 01:06:27 +0300
Message-ID: <1471644388-10220-7-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1471644388-10220-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471644388-10220-1-git-send-email-vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Deepak Das <deepak_das-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

To establish a connection between GPIO controllers and pin multiplexor
controller add gpio-ranges properties to all GPIO controllers found
on iMX50 SoC. The change was done after human parsing of output from

% gawk -n '{ sub(/.*__/, ""); if ($1 ~ "^GPIO") print $1, $2/4}' imx6ul-pinfunc.h | sort -n

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/imx6ul.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 33b95d78831a..1fd7f4be9d79 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -411,6 +411,9 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+
+				gpio-ranges = <&iomuxc  0 23 10>, <&iomuxc 10 17 6>,
+					      <&iomuxc 16 33 16>;
 			};
 
 			gpio2: gpio@020a0000 {
@@ -422,6 +425,8 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+
+				gpio-ranges = <&iomuxc 0 49 16>, <&iomuxc 16 111 6>;
 			};
 
 			gpio3: gpio@020a4000 {
@@ -433,6 +438,8 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+
+				gpio-ranges = <&iomuxc 0 65 29>;
 			};
 
 			gpio4: gpio@020a8000 {
@@ -444,6 +451,8 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+
+				gpio-ranges = <&iomuxc 0 94 17>, <&iomuxc 17 117 12>;
 			};
 
 			gpio5: gpio@020ac000 {
@@ -455,6 +464,8 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+
+				gpio-ranges = <&iomuxc 0 7 10>, <&iomuxc 10 5 2>;
 			};
 
 			fec2: ethernet@020b4000 {
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
