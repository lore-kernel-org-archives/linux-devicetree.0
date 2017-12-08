From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] eeprom: at25: Add DT support for EEPROMs with odd address bits
Date: Fri,  8 Dec 2017 14:46:41 +0100
Message-ID: <1512740801-21142-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ivo Sieben <meltedpianoman@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Certain EEPROMS have a size that is larger than the number of address
bytes would allow, and store the MSB of the address in bit 3 of the
instruction byte.

This can be described in platform data using EE_INSTR_BIT3_IS_ADDR, or
in DT using the obsolete legacy "at25,addr-mode" property.
But currently there exists no non-deprecated way to describe this in DT.

Hence extend the existing "address-width" DT property to allow
specifying 9 address bits, and enable support for that in the driver.

This has been tested with a Microchip 25LC040A.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Do not consider odd address widths of 17 or 25 bits,
  - Move handling inside the switch() statement.
---
 Documentation/devicetree/bindings/eeprom/at25.txt | 4 +++-
 drivers/misc/eeprom/at25.c                        | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at25.txt b/Documentation/devicetree/bindings/eeprom/at25.txt
index e823d90b802f7f8f..b3bde97dc19913ea 100644
--- a/Documentation/devicetree/bindings/eeprom/at25.txt
+++ b/Documentation/devicetree/bindings/eeprom/at25.txt
@@ -11,7 +11,9 @@ Required properties:
 - spi-max-frequency : max spi frequency to use
 - pagesize : size of the eeprom page
 - size : total eeprom size in bytes
-- address-width : number of address bits (one of 8, 16, or 24)
+- address-width : number of address bits (one of 8, 9, 16, or 24).
+  For 9 bits, the MSB of the address is sent as bit 3 of the instruction
+  byte, before the address byte.
 
 Optional properties:
 - spi-cpha : SPI shifted clock phase, as per spi-bus bindings.
diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 5afe4cd165699060..9282ffd607ff2799 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -276,6 +276,9 @@ static int at25_fw_to_chip(struct device *dev, struct spi_eeprom *chip)
 			return -ENODEV;
 		}
 		switch (val) {
+		case 9:
+			chip->flags |= EE_INSTR_BIT3_IS_ADDR;
+			/* fall through */
 		case 8:
 			chip->flags |= EE_ADDR1;
 			break;
-- 
2.7.4
