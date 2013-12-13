From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v6 9/9] ARM: dts: add usb udc support to bcm281xx
Date: Fri, 13 Dec 2013 11:51:23 -0500
Message-ID: <1386953483-21631-10-git-send-email-mporter@linaro.org>
References: <1386953483-21631-1-git-send-email-mporter@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386953483-21631-1-git-send-email-mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds USB OTG/PHY and clock support to BCM281xx and enables
UDC support on the bcm11351-brt and bcm28155-ap boards.

Signed-off-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/bcm11351-brt.dts |  6 ++++++
 arch/arm/boot/dts/bcm11351.dtsi    | 18 ++++++++++++++++++
 arch/arm/boot/dts/bcm28155-ap.dts  |  8 ++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/bcm11351-brt.dts b/arch/arm/boot/dts/bcm11351-brt.dts
index 23cd16d..396b704 100644
--- a/arch/arm/boot/dts/bcm11351-brt.dts
+++ b/arch/arm/boot/dts/bcm11351-brt.dts
@@ -44,5 +44,11 @@
 		status = "okay";
 	};
 
+	usbotg: usb@3f120000 {
+		status = "okay";
+	};
 
+	usbphy: usb-phy@3f130000 {
+		status = "okay";
+	};
 };
diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index 1246885..0fbb455 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -243,4 +243,22 @@
 			#clock-cells = <0>;
 		};
 	};
+
+	usbotg: usb@3f120000 {
+		compatible = "snps,dwc2";
+		reg = <0x3f120000 0x10000>;
+		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&usb_otg_ahb_clk>;
+		clock-names = "otg";
+		phys = <&usbphy>;
+		phy-names = "usb2-phy";
+		status = "disabled";
+	};
+
+	usbphy: usb-phy@3f130000 {
+		compatible = "brcm,kona-usb2-phy";
+		reg = <0x3f130000 0x28>;
+		#phy-cells = <0>;
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/bcm28155-ap.dts b/arch/arm/boot/dts/bcm28155-ap.dts
index 08e47c2..a3bc436 100644
--- a/arch/arm/boot/dts/bcm28155-ap.dts
+++ b/arch/arm/boot/dts/bcm28155-ap.dts
@@ -43,4 +43,12 @@
 		cd-gpios = <&gpio 14 0>;
 		status = "okay";
 	};
+
+	usbotg: usb@3f120000 {
+		status = "okay";
+	};
+
+	usbphy: usb-phy@3f130000 {
+		status = "okay";
+	};
 };
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
