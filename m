From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v3 09/21] ARM: dts: lpc18xx: Add generic compatible string for
 I2C EEPROM
Date: Thu, 13 Apr 2017 22:04:33 -0300
Message-ID: <20170414010445.21727-10-javier@osg.samsung.com>
References: <20170414010445.21727-1-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170414010445.21727-1-javier@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Joachim Eastwood <manabian@gmail.com>, Russell King <linux@armlinux.org.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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

 arch/arm/boot/dts/lpc4337-ciaa.dts          | 6 +++---
 arch/arm/boot/dts/lpc4350-hitex-eval.dts    | 2 +-
 arch/arm/boot/dts/lpc4357-ea4357-devkit.dts | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/lpc4337-ciaa.dts b/arch/arm/boot/dts/lpc4337-ciaa.dts
index 7c16d639a1b4..beddaba85393 100644
--- a/arch/arm/boot/dts/lpc4337-ciaa.dts
+++ b/arch/arm/boot/dts/lpc4337-ciaa.dts
@@ -174,17 +174,17 @@
 	clock-frequency = <400000>;
 
 	eeprom@50 {
-		compatible = "microchip,24c512";
+		compatible = "microchip,24c512", "atmel,24c512";
 		reg = <0x50>;
 	};
 
 	eeprom@51 {
-		compatible = "microchip,24c02";
+		compatible = "microchip,24c02", "atmel,24c02";
 		reg = <0x51>;
 	};
 
 	eeprom@54 {
-		compatible = "microchip,24c512";
+		compatible = "microchip,24c512", "atmel,24c512";
 		reg = <0x54>;
 	};
 };
diff --git a/arch/arm/boot/dts/lpc4350-hitex-eval.dts b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
index 874c75d44013..8b973f537d3a 100644
--- a/arch/arm/boot/dts/lpc4350-hitex-eval.dts
+++ b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
@@ -429,7 +429,7 @@
 	};
 
 	eeprom@50 {
-		compatible = "nxp,24c02";
+		compatible = "nxp,24c02", "atmel,24c02";
 		reg = <0x50>;
 	};
 
diff --git a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
index 9b5fad622522..02b23fa29d75 100644
--- a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
@@ -490,7 +490,7 @@
 	};
 
 	eeprom@57 {
-		compatible = "microchip,24c64";
+		compatible = "microchip,24c64", "atmel,24c64";
 		reg = <0x57>;
 	};
 };
-- 
2.9.3
