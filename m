From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH v2 07/16] ARM: dts: imx6qdl-sr-som-brcm: rename sdio clock
Date: Tue, 28 Nov 2017 15:02:30 +0000
Message-ID: <E1eJhP4-0006Nk-PT@rmk-PC.armlinux.org.uk>
References: <20171128150045.GV31757@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171128150045.GV31757-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The SDIO clock is really the Broadcom clock.  Rename it as such.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-sr-som-brcm.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-sr-som-brcm.dtsi b/arch/arm/boot/dts/imx6qdl-sr-som-brcm.dtsi
index 809d7896775c..b55af61dfeca 100644
--- a/arch/arm/boot/dts/imx6qdl-sr-som-brcm.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sr-som-brcm.dtsi
@@ -40,7 +40,7 @@
  */
 #include <dt-bindings/gpio/gpio.h>
 / {
-	clk_sdio: sdio-clock {
+	clk_brcm: brcm-clock {
 		compatible = "gpio-gate-clock";
 		#clock-cells = <0>;
 		pinctrl-names = "default";
@@ -64,7 +64,7 @@
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio5 26 GPIO_ACTIVE_LOW>,
 			      <&gpio6 0 GPIO_ACTIVE_LOW>;
-		clocks = <&clk_sdio>;
+		clocks = <&clk_brcm>;
 		clock-names = "ext_clock";
 	};
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
