From: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: kirkwood: enable the PCIe for km_kirkwood
Date: Thu, 15 May 2014 11:48:54 +0200
Message-ID: <1400147335-20947-3-git-send-email-valentin.longchamp@keymile.com>
References: <1400147335-20947-1-git-send-email-valentin.longchamp@keymile.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400147335-20947-1-git-send-email-valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Linux device trees <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The PCIe controller is used on the KM kirkwood reference design.
This enables it.

Signed-off-by: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
---

 arch/arm/boot/dts/kirkwood-km_kirkwood.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/kirkwood-km_kirkwood.dts b/arch/arm/boot/dts/kirkwood-km_kirkwood.dts
index 61139bf..9f57796 100644
--- a/arch/arm/boot/dts/kirkwood-km_kirkwood.dts
+++ b/arch/arm/boot/dts/kirkwood-km_kirkwood.dts
@@ -17,6 +17,16 @@
 		stdout-path = &uart0;
 	};
 
+	mbus {
+		pcie-controller {
+			status = "okay";
+
+			pcie@1,0 {
+				status = "okay";
+			};
+		};
+	};
+
 	ocp@f1000000 {
 		pinctrl: pin-controller@10000 {
 			pinctrl-0 = < &pmx_i2c_gpio_sda &pmx_i2c_gpio_scl >;
-- 
1.8.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
