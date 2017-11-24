From: Javier Martinez Canillas <javierm@redhat.com>
Subject: [RESEND PATCH 2/4] ARM: dts: keystone: Add generic compatible string for I2C EEPROM
Date: Fri, 24 Nov 2017 17:27:48 +0100
Message-ID: <20171124162750.18756-2-javierm@redhat.com>
References: <20171124162750.18756-1-javierm@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171124162750.18756-1-javierm@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: olof@lixom.net, arm@kernel.org, arnd@arndb.de, Javier Martinez Canillas <javierm@redhat.com>, devicetree@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 arch/arm/boot/dts/keystone-k2e-evm.dts  | 2 +-
 arch/arm/boot/dts/keystone-k2hk-evm.dts | 2 +-
 arch/arm/boot/dts/keystone-k2l-evm.dts  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2e-evm.dts b/arch/arm/boot/dts/keystone-k2e-evm.dts
index f1f32c54e72f..2c59f4cb3b44 100644
--- a/arch/arm/boot/dts/keystone-k2e-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2e-evm.dts
@@ -82,7 +82,7 @@
 
 &i2c0 {
 	dtt@50 {
-		compatible = "at,24c1024";
+		compatible = "atmel,24c1024";
 		reg = <0x50>;
 	};
 };
diff --git a/arch/arm/boot/dts/keystone-k2hk-evm.dts b/arch/arm/boot/dts/keystone-k2hk-evm.dts
index 6dd13b98aaba..13759db99d81 100644
--- a/arch/arm/boot/dts/keystone-k2hk-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2hk-evm.dts
@@ -158,7 +158,7 @@
 
 &i2c0 {
 	dtt@50 {
-		compatible = "at,24c1024";
+		compatible = "atmel,24c1024";
 		reg = <0x50>;
 	};
 };
diff --git a/arch/arm/boot/dts/keystone-k2l-evm.dts b/arch/arm/boot/dts/keystone-k2l-evm.dts
index 528667618db4..e6de1ae33c73 100644
--- a/arch/arm/boot/dts/keystone-k2l-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2l-evm.dts
@@ -55,7 +55,7 @@
 
 &i2c0 {
 	dtt@50 {
-		compatible = "at,24c1024";
+		compatible = "atmel,24c1024";
 		reg = <0x50>;
 	};
 };
-- 
2.14.3
