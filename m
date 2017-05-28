From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RfC v4 4/6] ARM(64): dts: meson: add GPIO interrupt-controller
 support
Date: Sun, 28 May 2017 21:11:34 +0200
Message-ID: <5294644a-967e-dba8-d287-d932b38244d1@gmail.com>
References: <49ab677f-3165-d6f5-75f5-a963879e8ecf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49ab677f-3165-d6f5-75f5-a963879e8ecf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for the GPIO interupt controller of certain Amlogic Meson
Soc's.

Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi             | 8 ++++++++
 arch/arm/boot/dts/meson8b.dtsi            | 8 ++++++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 69930773..b4c4175d 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -126,6 +126,14 @@
 };
 
 &cbus {
+	gpio_intc: interrupt-controller@9880 {
+		compatible = "amlogic,meson-gpio-intc";
+		reg = <0x9880 0x10>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		parent-interrupts = <64 65 66 67 68 79 70 71>;
+	};
+
 	pinctrl_cbus: pinctrl@9880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0x9880 0x10>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index d9f116a4..1bce64a6 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -151,6 +151,14 @@
 		interrupts = <0 0 1>;
 	};
 
+	gpio_intc: interrupt-controller@9880 {
+		compatible = "amlogic,meson-gpio-intc";
+		reg = <0x9880 0x10>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		parent-interrupts = <64 65 66 67 68 79 70 71>;
+	};
+
 	pinctrl_cbus: pinctrl@9880 {
 		compatible = "amlogic,meson8b-cbus-pinctrl";
 		reg = <0x9880 0x10>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 436b8750..66dde761 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -312,6 +312,14 @@
 				status = "disabled";
 			};
 
+			gpio_intc: interrupt-controller@9880 {
+				compatible = "amlogic,meson-gpio-intc";
+				reg = <0x0 0x09880 0x0 0x10>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				parent-interrupts = <64 65 66 67 68 79 70 71>;
+			};
+
 			watchdog@98d0 {
 				compatible = "amlogic,meson-gx-wdt", "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0x098d0 0x0 0x10>;
-- 
2.13.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
