From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/18] MIPS: dts: qca: ar9132: use short references for dt nodes
Date: Thu, 17 Mar 2016 06:34:12 +0300
Message-ID: <1458185665-4521-6-git-send-email-antonynpavlov@gmail.com>
References: <1458185665-4521-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458185665-4521-1-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Here are some Sascha Hauer's arguments for using aliases in the dts
files:

 - using aliases reduces the number of indentations in dts files;

 - dts files become independent of the layout of the dtsi files
   (it becomes possible to introduce another bus {} hierarchy between
   a toplevel bus and the devices when you have to);

 - less chances for typos. if &i2c2 does not exist you get an error.
   If instead you duplicate the whole path in the dts file a typo
   in the path will just create another node.

Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/mips/boot/dts/qca/ar9132.dtsi               |  8 +-
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 94 ++++++++++++------------
 2 files changed, 49 insertions(+), 53 deletions(-)

diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index 3c2ed9e..3bff63b 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -52,7 +52,7 @@
 				#qca,ddr-wb-channel-cells = <1>;
 			};
 
-			uart@18020000 {
+			uart: uart@18020000 {
 				compatible = "ns8250";
 				reg = <0x18020000 0x20>;
 				interrupts = <3>;
@@ -94,7 +94,7 @@
 				clock-output-names = "cpu", "ddr", "ahb";
 			};
 
-			wdt@18060008 {
+			wdt: wdt@18060008 {
 				compatible = "qca,ar7130-wdt";
 				reg = <0x18060008 0x8>;
 
@@ -125,7 +125,7 @@
 			};
 		};
 
-		usb@1b000100 {
+		usb: usb@1b000100 {
 			compatible = "qca,ar7100-ehci", "generic-ehci";
 			reg = <0x1b000100 0x100>;
 
@@ -140,7 +140,7 @@
 			status = "disabled";
 		};
 
-		spi@1f000000 {
+		spi: spi@1f000000 {
 			compatible = "qca,ar9132-spi", "qca,ar7100-spi";
 			reg = <0x1f000000 0x10>;
 
diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
index c3069c3..eb632a2 100644
--- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
+++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
@@ -20,55 +20,6 @@
 		clock-frequency = <40000000>;
 	};
 
-	ahb {
-		apb {
-			uart@18020000 {
-				status = "okay";
-			};
-
-			pll-controller@18050000 {
-				clocks = <&extosc>;
-			};
-		};
-
-		usb@1b000100 {
-			status = "okay";
-		};
-
-		spi@1f000000 {
-			status = "okay";
-			num-cs = <1>;
-
-			flash@0 {
-				#address-cells = <1>;
-				#size-cells = <1>;
-				compatible = "s25sl064a";
-				reg = <0>;
-				spi-max-frequency = <25000000>;
-
-				partition@0 {
-					label = "u-boot";
-					reg = <0x000000 0x020000>;
-				};
-
-				partition@1 {
-					label = "firmware";
-					reg = <0x020000 0x7D0000>;
-				};
-
-				partition@2 {
-					label = "art";
-					reg = <0x7F0000 0x010000>;
-					read-only;
-				};
-			};
-		};
-	};
-
-	usb-phy {
-		status = "okay";
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys-polled";
 		#address-cells = <1>;
@@ -114,3 +65,48 @@
 		};
 	};
 };
+
+&uart {
+	status = "okay";
+};
+
+&pll {
+	clocks = <&extosc>;
+};
+
+&usb {
+	status = "okay";
+};
+
+&usb_phy {
+	status = "okay";
+};
+
+&spi {
+	status = "okay";
+	num-cs = <1>;
+
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "s25sl064a";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x000000 0x020000>;
+		};
+
+		partition@1 {
+			label = "firmware";
+			reg = <0x020000 0x7D0000>;
+		};
+
+		partition@2 {
+			label = "art";
+			reg = <0x7F0000 0x010000>;
+			read-only;
+		};
+	};
+};
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
