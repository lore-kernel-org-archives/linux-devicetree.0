From: Javier Martinez Canillas <javierm@redhat.com>
Subject: [RESEND PATCH 4/4] ARM: dts: socfpga: Add generic compatible string for I2C EEPROM
Date: Fri, 24 Nov 2017 17:27:50 +0100
Message-ID: <20171124162750.18756-4-javierm@redhat.com>
References: <20171124162750.18756-1-javierm@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171124162750.18756-1-javierm@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: olof@lixom.net, arm@kernel.org, arnd@arndb.de, Javier Martinez Canillas <javierm@redhat.com>, devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
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

 arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
index 655fe87e272d..2459d133f1be 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
@@ -237,7 +237,7 @@
 	clock-frequency = <100000>;
 
 	at24@50 {
-		compatible = "at24,24c02";
+		compatible = "atmel,24c02";
 		pagesize = <8>;
 		reg = <0x50>;
 	};
-- 
2.14.3
