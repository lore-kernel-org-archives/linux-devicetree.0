From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH v4 10/20] ARM: dts: koelsch: Add generic compatible string for I2C EEPROM
Date: Mon, 22 May 2017 16:01:58 +0200
Message-ID: <20170522140208.24652-11-javier@dowhile0.org>
References: <20170522140208.24652-1-javier@dowhile0.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170522140208.24652-1-javier@dowhile0.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---

Changes in v4:
- Only use the atmel manufacturer in the compatible string instead of
  keeping the deprecated ones (Rob Herring).

Changes in v3:
- Add Geert Uytterhoeven reviewed-by tag.

Changes in v2: None

 arch/arm/boot/dts/r8a7791-koelsch.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 001e6116c47c..4234667da2b8 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -702,7 +702,7 @@
 	};
 
 	eeprom@50 {
-		compatible = "renesas,24c02";
+		compatible = "atmel,24c02";
 		reg = <0x50>;
 		pagesize = <16>;
 	};
-- 
2.9.3
