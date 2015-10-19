From: Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 03/11] dts: pinctrl: Add GPIO to Pinctrl pin mapping in DT
Date: Mon, 19 Oct 2015 11:13:10 +0530
Message-ID: <1445233398-27129-4-git-send-email-pramodku@broadcom.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445233398-27129-1-git-send-email-pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jason Uy <jasonuy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ASIU gpio controller's pins are muxed with pin-cntroller.
Add this mapping through property "gpio-ranges".

Signed-off-by: Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 53 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index e1ac07a..6621f13 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -84,10 +84,59 @@
 		#gpio-cells = <2>;
 		gpio-controller;
 
-		pinmux = <&pinctrl>;
-
 		interrupt-controller;
 		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+		gpio-ranges = <&pinctrl 0 42 1>,
+				<&pinctrl 1 44 3>,
+				<&pinctrl 4 48 1>,
+				<&pinctrl 5 50 3>,
+				<&pinctrl 8 126 1>,
+				<&pinctrl 9 155 1>,
+				<&pinctrl 10 152 1>,
+				<&pinctrl 11 154 1>,
+				<&pinctrl 12 153 1>,
+				<&pinctrl 13 127 3>,
+				<&pinctrl 16 140 1>,
+				<&pinctrl 17 145 7>,
+				<&pinctrl 24 130 10>,
+				<&pinctrl 34 141 4>,
+				<&pinctrl 38 54 1>,
+				<&pinctrl 39 56 3>,
+				<&pinctrl 42 60 3>,
+				<&pinctrl 45 64 3>,
+				<&pinctrl 48 68 2>,
+				<&pinctrl 50 84 6>,
+				<&pinctrl 56 94 6>,
+				<&pinctrl 62 72 1>,
+				<&pinctrl 63 70 1>,
+				<&pinctrl 64 80 1>,
+				<&pinctrl 65 74 3>,
+				<&pinctrl 68 78 1>,
+				<&pinctrl 69 82 1>,
+				<&pinctrl 70 156 17>,
+				<&pinctrl 87 104 12>,
+				<&pinctrl 99 102 2>,
+				<&pinctrl 101 90 4>,
+				<&pinctrl 105 116 6>,
+				<&pinctrl 111 100 2>,
+				<&pinctrl 113 122 4>,
+				<&pinctrl 123 11 1>,
+				<&pinctrl 124 38 4>,
+				<&pinctrl 128 43 1>,
+				<&pinctrl 129 47 1>,
+				<&pinctrl 130 49 1>,
+				<&pinctrl 131 53 1>,
+				<&pinctrl 132 55 1>,
+				<&pinctrl 133 59 1>,
+				<&pinctrl 134 63 1>,
+				<&pinctrl 135 67 1>,
+				<&pinctrl 136 71 1>,
+				<&pinctrl 137 73 1>,
+				<&pinctrl 138 77 1>,
+				<&pinctrl 139 79 1>,
+				<&pinctrl 140 81 1>,
+				<&pinctrl 141 83 1>,
+				<&pinctrl 142 10 1>;
 	};
 
 	amba {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
