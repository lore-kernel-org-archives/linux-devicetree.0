From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 4/6] pintrl: meson: add DT node for GPIO IRQ on Meson 8 /
 8b
Date: Fri, 12 May 2017 21:13:47 +0200
Message-ID: <b8298e56-347d-7c1a-cf0c-815b914d45b2@gmail.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the DT node for GPIO IRQ support on AMlogic Meson 8 and 8b.

Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2:
- remove syscon
---
 arch/arm/boot/dts/meson8.dtsi  | 13 +++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index ebc763ea..1962e16e 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -91,6 +91,19 @@
 		clock-frequency = <141666666>;
 	};
 
+	gpio_irq@c1109880 {
+		compatible = "amlogic,meson-gpio-interrupt";
+		reg = <0xc1109880 0x10>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+			     <GIC_SPI 65 IRQ_TYPE_NONE>,
+			     <GIC_SPI 66 IRQ_TYPE_NONE>,
+			     <GIC_SPI 67 IRQ_TYPE_NONE>,
+			     <GIC_SPI 68 IRQ_TYPE_NONE>,
+			     <GIC_SPI 69 IRQ_TYPE_NONE>,
+			     <GIC_SPI 70 IRQ_TYPE_NONE>,
+			     <GIC_SPI 71 IRQ_TYPE_NONE>;
+	};
+
 	pinctrl_cbus: pinctrl@c1109880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0xc1109880 0x10>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 828aa49c..e48017be 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -183,6 +183,19 @@
 			status = "disabled";
 		};
 
+		gpio_irq@c1109880 {
+			compatible = "amlogic,meson-gpio-interrupt";
+			reg = <0xc1109880 0x10>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+				     <GIC_SPI 65 IRQ_TYPE_NONE>,
+				     <GIC_SPI 66 IRQ_TYPE_NONE>,
+				     <GIC_SPI 67 IRQ_TYPE_NONE>,
+				     <GIC_SPI 68 IRQ_TYPE_NONE>,
+				     <GIC_SPI 69 IRQ_TYPE_NONE>,
+				     <GIC_SPI 70 IRQ_TYPE_NONE>,
+				     <GIC_SPI 71 IRQ_TYPE_NONE>;
+		};
+
 		pinctrl_cbus: pinctrl@c1109880 {
 			compatible = "amlogic,meson8b-cbus-pinctrl";
 			reg = <0xc1109880 0x10>;
-- 
2.12.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
