From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH v2 18/22] powerpc/fsl: Add generic compatible string for I2C EEPROM
Date: Thu, 13 Apr 2017 15:28:35 -0300
Message-ID: <20170413182839.25381-19-javier@osg.samsung.com>
References: <20170413182839.25381-1-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413182839.25381-1-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Larysch <fl-J+Jo6bLUB7M@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
---

Changes in v2: None

 arch/powerpc/boot/dts/fsl/b4qds.dtsi    |  8 ++++----
 arch/powerpc/boot/dts/fsl/c293pcie.dts  |  2 +-
 arch/powerpc/boot/dts/fsl/p1010rdb.dtsi |  2 +-
 arch/powerpc/boot/dts/fsl/p1023rdb.dts  |  2 +-
 arch/powerpc/boot/dts/fsl/p2041rdb.dts  |  4 ++--
 arch/powerpc/boot/dts/fsl/p3041ds.dts   |  4 ++--
 arch/powerpc/boot/dts/fsl/p4080ds.dts   |  4 ++--
 arch/powerpc/boot/dts/fsl/p5020ds.dts   |  4 ++--
 arch/powerpc/boot/dts/fsl/p5040ds.dts   |  4 ++--
 arch/powerpc/boot/dts/fsl/t208xqds.dtsi |  8 ++++----
 arch/powerpc/boot/dts/fsl/t4240qds.dts  | 12 ++++++------
 arch/powerpc/boot/dts/fsl/t4240rdb.dts  |  6 +++---
 12 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/b4qds.dtsi b/arch/powerpc/boot/dts/fsl/b4qds.dtsi
index 3785ef826d07..2813e8bb5d1e 100644
--- a/arch/powerpc/boot/dts/fsl/b4qds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4qds.dtsi
@@ -166,19 +166,19 @@
 					reg = <0>;
 
 					eeprom@50 {
-						compatible = "at24,24c64";
+						compatible = "at24,24c64","atmel,24c64";
 						reg = <0x50>;
 					};
 					eeprom@51 {
-						compatible = "at24,24c256";
+						compatible = "at24,24c256","atmel,24c256";
 						reg = <0x51>;
 					};
 					eeprom@53 {
-						compatible = "at24,24c256";
+						compatible = "at24,24c256","atmel,24c256";
 						reg = <0x53>;
 					};
 					eeprom@57 {
-						compatible = "at24,24c256";
+						compatible = "at24,24c256","atmel,24c256";
 						reg = <0x57>;
 					};
 					rtc@68 {
diff --git a/arch/powerpc/boot/dts/fsl/c293pcie.dts b/arch/powerpc/boot/dts/fsl/c293pcie.dts
index 66709788429d..2b931b1b5767 100644
--- a/arch/powerpc/boot/dts/fsl/c293pcie.dts
+++ b/arch/powerpc/boot/dts/fsl/c293pcie.dts
@@ -153,7 +153,7 @@
 &soc {
 	i2c@3000 {
 		eeprom@50 {
-			compatible = "st,24c1024";
+			compatible = "st,24c1024","atmel,24c1024";
 			reg = <0x50>;
 		};
 
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi b/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
index a8e4ba070104..868da24bdbf1 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
@@ -89,7 +89,7 @@
 &board_soc {
 	i2c@3000 {
 		eeprom@50 {
-			compatible = "st,24c256";
+			compatible = "st,24c256","atmel,24c256";
 			reg = <0x50>;
 		};
 
diff --git a/arch/powerpc/boot/dts/fsl/p1023rdb.dts b/arch/powerpc/boot/dts/fsl/p1023rdb.dts
index 9716ca64651c..241988d48290 100644
--- a/arch/powerpc/boot/dts/fsl/p1023rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/p1023rdb.dts
@@ -79,7 +79,7 @@
 
 		i2c@3000 {
 			eeprom@53 {
-				compatible = "at24,24c04";
+				compatible = "at24,24c04","atmel,24c04";
 				reg = <0x53>;
 			};
 
diff --git a/arch/powerpc/boot/dts/fsl/p2041rdb.dts b/arch/powerpc/boot/dts/fsl/p2041rdb.dts
index e50fea95a853..65b004ff2789 100644
--- a/arch/powerpc/boot/dts/fsl/p2041rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/p2041rdb.dts
@@ -127,7 +127,7 @@
 				reg = <0x48>;
 			};
 			eeprom@50 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x50>;
 			};
 			rtc@68 {
@@ -142,7 +142,7 @@
 
 		i2c@118100 {
 			eeprom@50 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x50>;
 			};
 		};
diff --git a/arch/powerpc/boot/dts/fsl/p3041ds.dts b/arch/powerpc/boot/dts/fsl/p3041ds.dts
index 40748e415adb..5690a1feeb5a 100644
--- a/arch/powerpc/boot/dts/fsl/p3041ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p3041ds.dts
@@ -124,11 +124,11 @@
 
 		i2c@118100 {
 			eeprom@51 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x51>;
 			};
 			eeprom@52 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x52>;
 			};
 		};
diff --git a/arch/powerpc/boot/dts/fsl/p4080ds.dts b/arch/powerpc/boot/dts/fsl/p4080ds.dts
index 816b9788d5f6..d95cd96ce783 100644
--- a/arch/powerpc/boot/dts/fsl/p4080ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p4080ds.dts
@@ -125,11 +125,11 @@
 
 		i2c@118100 {
 			eeprom@51 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x51>;
 			};
 			eeprom@52 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x52>;
 			};
 			rtc@68 {
diff --git a/arch/powerpc/boot/dts/fsl/p5020ds.dts b/arch/powerpc/boot/dts/fsl/p5020ds.dts
index cd6f37386111..92a1a9253af1 100644
--- a/arch/powerpc/boot/dts/fsl/p5020ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p5020ds.dts
@@ -124,11 +124,11 @@
 
 		i2c@118100 {
 			eeprom@51 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x51>;
 			};
 			eeprom@52 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x52>;
 			};
 		};
diff --git a/arch/powerpc/boot/dts/fsl/p5040ds.dts b/arch/powerpc/boot/dts/fsl/p5040ds.dts
index 45084738cf4e..64e4a5f05cdf 100644
--- a/arch/powerpc/boot/dts/fsl/p5040ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p5040ds.dts
@@ -133,11 +133,11 @@
 
 		i2c@118100 {
 			eeprom@51 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x51>;
 			};
 			eeprom@52 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x52>;
 			};
 		};
diff --git a/arch/powerpc/boot/dts/fsl/t208xqds.dtsi b/arch/powerpc/boot/dts/fsl/t208xqds.dtsi
index ec080bd01b09..d5c277d838bb 100644
--- a/arch/powerpc/boot/dts/fsl/t208xqds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xqds.dtsi
@@ -147,17 +147,17 @@
 					reg = <0x0>;
 
 					eeprom@50 {
-						compatible = "at24,24c512";
+						compatible = "at24,24c512","atmel,24c512";
 						reg = <0x50>;
 					};
 
 					eeprom@51 {
-						compatible = "at24,24c02";
+						compatible = "at24,24c02","atmel,24c02";
 						reg = <0x51>;
 					};
 
 					eeprom@57 {
-						compatible = "at24,24c02";
+						compatible = "at24,24c02","atmel,24c02";
 						reg = <0x57>;
 					};
 
@@ -174,7 +174,7 @@
 					reg = <0x1>;
 
 					eeprom@55 {
-						compatible = "at24,24c02";
+						compatible = "at24,24c02","atmel,24c02";
 						reg = <0x55>;
 					};
 				};
diff --git a/arch/powerpc/boot/dts/fsl/t4240qds.dts b/arch/powerpc/boot/dts/fsl/t4240qds.dts
index 9573ceada07c..bc0d54dc5b72 100644
--- a/arch/powerpc/boot/dts/fsl/t4240qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t4240qds.dts
@@ -377,27 +377,27 @@
 					reg = <0>;
 
 					eeprom@51 {
-						compatible = "at24,24c256";
+						compatible = "at24,24c256","atmel,24c256";
 						reg = <0x51>;
 					};
 					eeprom@52 {
-						compatible = "at24,24c256";
+						compatible = "at24,24c256","atmel,24c256";
 						reg = <0x52>;
 					};
 					eeprom@53 {
-						compatible = "at24,24c256";
+						compatible = "at24,24c256","atmel,24c256";
 						reg = <0x53>;
 					};
 					eeprom@54 {
-						compatible = "at24,24c256";
+						compatible = "at24,24c256","atmel,24c256";
 						reg = <0x54>;
 					};
 					eeprom@55 {
-						compatible = "at24,24c256";
+						compatible = "at24,24c256","atmel,24c256";
 						reg = <0x55>;
 					};
 					eeprom@56 {
-						compatible = "at24,24c256";
+						compatible = "at24,24c256","atmel,24c256";
 						reg = <0x56>;
 					};
 					rtc@68 {
diff --git a/arch/powerpc/boot/dts/fsl/t4240rdb.dts b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
index 8166c660712a..67df9020a52a 100644
--- a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
@@ -130,15 +130,15 @@
 				reg = <0x2f>;
 			};
 			eeprom@52 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x52>;
 			};
 			eeprom@54 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x54>;
 			};
 			eeprom@56 {
-				compatible = "at24,24c256";
+				compatible = "at24,24c256","atmel,24c256";
 				reg = <0x56>;
 			};
 			rtc@68 {
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
