From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v3 21/21] powerpc/44x: Add generic compatible string for I2C EEPROM
Date: Thu, 13 Apr 2017 22:04:45 -0300
Message-ID: <20170414010445.21727-22-javier@osg.samsung.com>
References: <20170414010445.21727-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170414010445.21727-1-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linuxppc-dev@lists.ozlabs.org
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

Changes in v3: None
Changes in v2: None

 arch/powerpc/boot/dts/warp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/warp.dts b/arch/powerpc/boot/dts/warp.dts
index e576ee85c42f..19e0ec83b1a5 100644
--- a/arch/powerpc/boot/dts/warp.dts
+++ b/arch/powerpc/boot/dts/warp.dts
@@ -238,7 +238,7 @@
 
 				/* This will create 52 and 53 */
 				at24@52 {
-					compatible = "at,24c04";
+					compatible = "at,24c04", "atmel,24c04";
 					reg = <0x52>;
 				};
 			};
-- 
2.9.3
