From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/7] ARM: dts: lpc32xx: ea3250: avoid extension of device nodes by absolute path
Date: Wed, 27 Apr 2016 00:10:28 +0300
Message-ID: <1461705034-355-2-git-send-email-vz@mleia.com>
References: <1461705034-355-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461705034-355-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The change simplifies layout of EA3250 board description by
referencing device nodes of LPC32xx controllers by label.

No functional change intended.

Acked-by: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
Changes from v1 to v2:
* added Sylvain's acked-by.

 arch/arm/boot/dts/ea3250.dts | 226 +++++++++++++++++++++----------------------
 1 file changed, 110 insertions(+), 116 deletions(-)

diff --git a/arch/arm/boot/dts/ea3250.dts b/arch/arm/boot/dts/ea3250.dts
index a4a281f..7cf815a 100644
--- a/arch/arm/boot/dts/ea3250.dts
+++ b/arch/arm/boot/dts/ea3250.dts
@@ -25,119 +25,6 @@
 		reg = <0x80000000 0x4000000>;
 	};
 
-	ahb {
-		mac: ethernet@31060000 {
-			phy-mode = "rmii";
-			use-iram;
-		};
-
-		/* 128MB Flash via SLC NAND controller */
-		slc: flash@20020000 {
-			status = "okay";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			nxp,wdr-clks = <14>;
-			nxp,wwidth = <260000000>;
-			nxp,whold = <104000000>;
-			nxp,wsetup = <200000000>;
-			nxp,rdr-clks = <14>;
-			nxp,rwidth = <34666666>;
-			nxp,rhold = <104000000>;
-			nxp,rsetup = <200000000>;
-			nand-on-flash-bbt;
-			gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
-
-			mtd0@00000000 {
-				label = "ea3250-boot";
-				reg = <0x00000000 0x00080000>;
-				read-only;
-			};
-
-			mtd1@00080000 {
-				label = "ea3250-uboot";
-				reg = <0x00080000 0x000c0000>;
-				read-only;
-			};
-
-			mtd2@00140000 {
-				label = "ea3250-kernel";
-				reg = <0x00140000 0x00400000>;
-			};
-
-			mtd3@00540000 {
-				label = "ea3250-rootfs";
-				reg = <0x00540000 0x07ac0000>;
-			};
-		};
-
-		apb {
-			uart5: serial@40090000 {
-				status = "okay";
-			};
-
-			uart3: serial@40080000 {
-				status = "okay";
-			};
-
-			uart6: serial@40098000 {
-				status = "okay";
-			};
-
-			i2c1: i2c@400A0000 {
-				clock-frequency = <100000>;
-
-				eeprom@50 {
-					compatible = "at,24c256";
-					reg = <0x50>;
-				};
-
-				eeprom@57 {
-					compatible = "at,24c64";
-					reg = <0x57>;
-				};
-
-				uda1380: uda1380@18 {
-					compatible = "nxp,uda1380";
-					reg = <0x18>;
-					power-gpio = <&gpio 0x59 0>;
-					reset-gpio = <&gpio 0x51 0>;
-					dac-clk = "wspll";
-				};
-
-				pca9532: pca9532@60 {
-					compatible = "nxp,pca9532";
-					gpio-controller;
-					#gpio-cells = <2>;
-					reg = <0x60>;
-				};
-			};
-
-			i2c2: i2c@400A8000 {
-				clock-frequency = <100000>;
-			};
-
-			sd@20098000 {
-				wp-gpios = <&pca9532 5 0>;
-				cd-gpios = <&pca9532 4 0>;
-				cd-inverted;
-				bus-width = <4>;
-				status = "okay";
-			};
-		};
-
-		fab {
-			uart1: serial@40014000 {
-				status = "okay";
-			};
-
-			/* 3-axis accelerometer X,Y,Z (or AD-IN instead of Z) */
-			adc@40048000 {
-				status = "okay";
-			};
-		};
-	};
-
 	gpio_keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
@@ -258,12 +145,44 @@
 	};
 };
 
-/* Here, choose exactly one from: ohci, usbd */
-&ohci /* &usbd */ {
-	transceiver = <&isp1301>;
+/* 3-axis accelerometer X,Y,Z (or AD-IN instead of Z) */
+&adc {
 	status = "okay";
 };
 
+&i2c1 {
+	clock-frequency = <100000>;
+
+	uda1380: uda1380@18 {
+		compatible = "nxp,uda1380";
+		reg = <0x18>;
+		power-gpio = <&gpio 0x59 0>;
+		reset-gpio = <&gpio 0x51 0>;
+		dac-clk = "wspll";
+	};
+
+	eeprom@50 {
+		compatible = "at,24c256";
+		reg = <0x50>;
+	};
+
+	eeprom@57 {
+		compatible = "at,24c64";
+		reg = <0x57>;
+	};
+
+	pca9532: pca9532@60 {
+		compatible = "nxp,pca9532";
+		gpio-controller;
+		#gpio-cells = <2>;
+		reg = <0x60>;
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+};
+
 &i2cusb {
 	clock-frequency = <100000>;
 
@@ -272,3 +191,78 @@
 		reg = <0x2d>;
 	};
 };
+
+&mac {
+	phy-mode = "rmii";
+	use-iram;
+};
+
+/* Here, choose exactly one from: ohci, usbd */
+&ohci /* &usbd */ {
+	transceiver = <&isp1301>;
+	status = "okay";
+};
+
+&sd {
+	wp-gpios = <&pca9532 5 0>;
+	cd-gpios = <&pca9532 4 0>;
+	cd-inverted;
+	bus-width = <4>;
+	status = "okay";
+};
+
+/* 128MB Flash via SLC NAND controller */
+&slc {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	status = "okay";
+
+	nxp,wdr-clks = <14>;
+	nxp,wwidth = <260000000>;
+	nxp,whold = <104000000>;
+	nxp,wsetup = <200000000>;
+	nxp,rdr-clks = <14>;
+	nxp,rwidth = <34666666>;
+	nxp,rhold = <104000000>;
+	nxp,rsetup = <200000000>;
+	nand-on-flash-bbt;
+	gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
+
+	mtd0@00000000 {
+		label = "ea3250-boot";
+		reg = <0x00000000 0x00080000>;
+		read-only;
+	};
+
+	mtd1@00080000 {
+		label = "ea3250-uboot";
+		reg = <0x00080000 0x000c0000>;
+		read-only;
+	};
+
+	mtd2@00140000 {
+		label = "ea3250-kernel";
+		reg = <0x00140000 0x00400000>;
+	};
+
+	mtd3@00540000 {
+		label = "ea3250-rootfs";
+		reg = <0x00540000 0x07ac0000>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&uart6 {
+	status = "okay";
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
