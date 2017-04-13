From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 12/22] ARM: dts: socfpga: Add generic compatible string for I2C EEPROM
Date: Thu, 13 Apr 2017 15:28:29 -0300
Message-ID: <20170413182839.25381-13-javier@osg.samsung.com>
References: <20170413182839.25381-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170413182839.25381-1-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

Changes in v2: None

 arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
index 363ee62457fe..d61bba8d3937 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
@@ -294,7 +294,7 @@
 	clock-frequency = <100000>;
 
 	at24@50 {
-		compatible = "at24,24c02";
+		compatible = "at24,24c02","atmel,24c02";
 		pagesize = <8>;
 		reg = <0x50>;
 	};
-- 
2.9.3
