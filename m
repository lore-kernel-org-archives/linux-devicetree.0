From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH v2 08/22] ARM: dts: keystone: Add generic compatible string for I2C EEPROM
Date: Thu, 13 Apr 2017 15:28:25 -0300
Message-ID: <20170413182839.25381-9-javier@osg.samsung.com>
References: <20170413182839.25381-1-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413182839.25381-1-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
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

 arch/arm/boot/dts/keystone-k2e-evm.dts  | 2 +-
 arch/arm/boot/dts/keystone-k2hk-evm.dts | 2 +-
 arch/arm/boot/dts/keystone-k2l-evm.dts  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2e-evm.dts b/arch/arm/boot/dts/keystone-k2e-evm.dts
index ae1ebe7ee021..0540e49dcece 100644
--- a/arch/arm/boot/dts/keystone-k2e-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2e-evm.dts
@@ -69,7 +69,7 @@
 
 &i2c0 {
 	dtt@50 {
-		compatible = "at,24c1024";
+		compatible = "at,24c1024","atmel,24c1024";
 		reg = <0x50>;
 	};
 };
diff --git a/arch/arm/boot/dts/keystone-k2hk-evm.dts b/arch/arm/boot/dts/keystone-k2hk-evm.dts
index 2156ff92d08f..c278d2c10c67 100644
--- a/arch/arm/boot/dts/keystone-k2hk-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2hk-evm.dts
@@ -145,7 +145,7 @@
 
 &i2c0 {
 	dtt@50 {
-		compatible = "at,24c1024";
+		compatible = "at,24c1024","atmel,24c1024";
 		reg = <0x50>;
 	};
 };
diff --git a/arch/arm/boot/dts/keystone-k2l-evm.dts b/arch/arm/boot/dts/keystone-k2l-evm.dts
index 056b42f99d7a..d0e62890cd95 100644
--- a/arch/arm/boot/dts/keystone-k2l-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2l-evm.dts
@@ -42,7 +42,7 @@
 
 &i2c0 {
 	dtt@50 {
-		compatible = "at,24c1024";
+		compatible = "at,24c1024","atmel,24c1024";
 		reg = <0x50>;
 	};
 };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
