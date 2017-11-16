From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 2/2] ARM: dts: meson: drop "sana" clock from SAR ADC
Date: Thu, 16 Nov 2017 17:01:15 +0800
Message-ID: <20171116090115.29915-3-yixun.lan@amlogic.com>
References: <20171116090115.29915-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171116090115.29915-1-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Xingyu Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Xingyu Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>

The SAR ADC modules doesn't require The "sana" clock.

Acked-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Signed-off-by: Xingyu Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi  | 5 ++---
 arch/arm/boot/dts/meson8b.dtsi | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index b98d44fde6b6..f93d6cf6e094 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -289,9 +289,8 @@
 &saradc {
 	compatible = "amlogic,meson8-saradc", "amlogic,meson-saradc";
 	clocks = <&clkc CLKID_XTAL>,
-		<&clkc CLKID_SAR_ADC>,
-		<&clkc CLKID_SANA>;
-	clock-names = "clkin", "core", "sana";
+		<&clkc CLKID_SAR_ADC>;
+	clock-names = "clkin", "core";
 };
 
 &spifc {
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index bc278da7df0d..4aa444284f0c 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -185,9 +185,8 @@
 &saradc {
 	compatible = "amlogic,meson8b-saradc", "amlogic,meson-saradc";
 	clocks = <&clkc CLKID_XTAL>,
-		<&clkc CLKID_SAR_ADC>,
-		<&clkc CLKID_SANA>;
-	clock-names = "clkin", "core", "sana";
+		<&clkc CLKID_SAR_ADC>;
+	clock-names = "clkin", "core";
 };
 
 &uart_AO {
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
