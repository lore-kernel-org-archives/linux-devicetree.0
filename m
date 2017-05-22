From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 06/20] ARM: dts: imx: Add generic compatible string for I2C EEPROM
Date: Mon, 22 May 2017 16:01:54 +0200
Message-ID: <20170522140208.24652-7-javier@dowhile0.org>
References: <20170522140208.24652-1-javier@dowhile0.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170522140208.24652-1-javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>

---

Changes in v4:
- Only use the atmel manufacturer in the compatible string instead of
  keeping the deprecated ones (Rob Herring).

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi | 2 +-
 arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi   | 2 +-
 arch/arm/boot/dts/imx28-evk.dts                   | 2 +-
 arch/arm/boot/dts/imx53-tqma53.dtsi               | 2 +-
 arch/arm/boot/dts/imx6q-cm-fx6.dts                | 2 +-
 arch/arm/boot/dts/imx6q-utilite-pro.dts           | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi
index 4f3e0f473581..0b8490b21a38 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi
+++ b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi
@@ -40,7 +40,7 @@
 	status = "okay";
 
 	at24@52 {
-		compatible = "at,24c32";
+		compatible = "atmel,24c32";
 		pagesize = <32>;
 		reg = <0x52>;
 	};
diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi b/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi
index 82fec935ce83..c973c5d91875 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi
@@ -193,7 +193,7 @@
 	status = "okay";
 
 	at24@52 {
-		compatible = "at,24c32";
+		compatible = "atmel,24c32";
 		pagesize = <32>;
 		reg = <0x52>;
 	};
diff --git a/arch/arm/boot/dts/imx28-evk.dts b/arch/arm/boot/dts/imx28-evk.dts
index a5ba669b4eaa..b88c087f1fea 100644
--- a/arch/arm/boot/dts/imx28-evk.dts
+++ b/arch/arm/boot/dts/imx28-evk.dts
@@ -203,7 +203,7 @@
 				};
 
 				at24@51 {
-					compatible = "at24,24c32";
+					compatible = "atmel,24c32";
 					pagesize = <32>;
 					reg = <0x51>;
 				};
diff --git a/arch/arm/boot/dts/imx53-tqma53.dtsi b/arch/arm/boot/dts/imx53-tqma53.dtsi
index 85972f2201c2..eecdc1c55eef 100644
--- a/arch/arm/boot/dts/imx53-tqma53.dtsi
+++ b/arch/arm/boot/dts/imx53-tqma53.dtsi
@@ -272,7 +272,7 @@
 	};
 
 	eeprom: 24c64@50 {
-		compatible = "at,24c64";
+		compatible = "atmel,24c64";
 		pagesize = <32>;
 		reg = <0x50>;
 	};
diff --git a/arch/arm/boot/dts/imx6q-cm-fx6.dts b/arch/arm/boot/dts/imx6q-cm-fx6.dts
index 66cac5328b86..a8af3822d9df 100644
--- a/arch/arm/boot/dts/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/imx6q-cm-fx6.dts
@@ -215,7 +215,7 @@
 	clock-frequency = <100000>;
 
 	eeprom@50 {
-		compatible = "at24,24c02";
+		compatible = "atmel,24c02";
 		reg = <0x50>;
 		pagesize = <16>;
 	};
diff --git a/arch/arm/boot/dts/imx6q-utilite-pro.dts b/arch/arm/boot/dts/imx6q-utilite-pro.dts
index d900ad6ec5f8..16d5be1aeb3c 100644
--- a/arch/arm/boot/dts/imx6q-utilite-pro.dts
+++ b/arch/arm/boot/dts/imx6q-utilite-pro.dts
@@ -130,7 +130,7 @@
 			#size-cells = <0>;
 
 			eeprom@50 {
-				compatible = "at24,24c02";
+				compatible = "atmel,24c02";
 				reg = <0x50>;
 				pagesize = <16>;
 			};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
