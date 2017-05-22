From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 12/20] ARM: dts: uniphier: Add generic compatible string for I2C EEPROM
Date: Mon, 22 May 2017 16:02:00 +0200
Message-ID: <20170522140208.24652-13-javier@dowhile0.org>
References: <20170522140208.24652-1-javier@dowhile0.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170522140208.24652-1-javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
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

 arch/arm/boot/dts/uniphier-pro4-ace.dts    | 2 +-
 arch/arm/boot/dts/uniphier-pro4-sanji.dts  | 2 +-
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-pro4-ace.dts b/arch/arm/boot/dts/uniphier-pro4-ace.dts
index fefc89149234..30ed82b2e90d 100644
--- a/arch/arm/boot/dts/uniphier-pro4-ace.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-ace.dts
@@ -88,7 +88,7 @@
 	status = "okay";
 
 	eeprom@54 {
-		compatible = "st,24c64";
+		compatible = "atmel,24c64";
 		reg = <0x54>;
 		pagesize = <32>;
 	};
diff --git a/arch/arm/boot/dts/uniphier-pro4-sanji.dts b/arch/arm/boot/dts/uniphier-pro4-sanji.dts
index 6c63c8bad825..42d0ea85a1e1 100644
--- a/arch/arm/boot/dts/uniphier-pro4-sanji.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-sanji.dts
@@ -83,7 +83,7 @@
 	status = "okay";
 
 	eeprom@54 {
-		compatible = "st,24c64";
+		compatible = "atmel,24c64";
 		reg = <0x54>;
 		pagesize = <32>;
 	};
diff --git a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
index cccc86658d20..f2368107699e 100644
--- a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
+++ b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
@@ -80,7 +80,7 @@
 	status = "okay";
 
 	eeprom@54 {
-		compatible = "st,24c64";
+		compatible = "atmel,24c64";
 		reg = <0x54>;
 		pagesize = <32>;
 	};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
