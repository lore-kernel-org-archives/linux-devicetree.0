From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v3 11/21] ARM: dts: koelsch: Add generic compatible string for I2C EEPROM
Date: Thu, 13 Apr 2017 22:04:35 -0300
Message-ID: <20170414010445.21727-12-javier@osg.samsung.com>
References: <20170414010445.21727-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170414010445.21727-1-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---

Changes in v3:
- Add Geert Uytterhoeven reviewed-by tag.

Changes in v2: None

 arch/arm/boot/dts/r8a7791-koelsch.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 001e6116c47c..dc8ed02de707 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -702,7 +702,7 @@
 	};
 
 	eeprom@50 {
-		compatible = "renesas,24c02";
+		compatible = "renesas,24c02", "atmel,24c02";
 		reg = <0x50>;
 		pagesize = <16>;
 	};
-- 
2.9.3
