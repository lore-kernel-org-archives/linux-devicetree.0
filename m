From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH v2 1/5] misc: eeprom_93xx46: Fix 16-bit read and write accesses.
Date: Wed, 18 Nov 2015 22:29:37 -0500
Message-ID: <1447903781-3910-2-git-send-email-cory.tusar@pid1solutions.com>
References: <1447903781-3910-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447903781-3910-1-git-send-email-cory.tusar@pid1solutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, agust@denx.de, gregkh@linuxfoundation.org
Cc: jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

Compatible at93xx46 devices from both Microchip and Atmel expect a
word-based address, regardless of whether the device is strapped for 8-
or 16-bit operation.  However, the offset parameter passed in when
reading or writing at a specific location is always specified in terms
of bytes.

This commit fixes 16-bit read and write accesses by shifting the offset
parameter to account for this difference between a byte offset and a
word-based address.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
---
 drivers/misc/eeprom/eeprom_93xx46.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index ff63f05..e1bf0a5 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -54,7 +54,7 @@ eeprom_93xx46_bin_read(struct file *filp, struct kobject *kobj,
 		cmd_addr |= off & 0x7f;
 		bits = 10;
 	} else {
-		cmd_addr |= off & 0x3f;
+		cmd_addr |= (off >> 1) & 0x3f;
 		bits = 9;
 	}
 
@@ -155,7 +155,7 @@ eeprom_93xx46_write_word(struct eeprom_93xx46_dev *edev,
 		bits = 10;
 		data_len = 1;
 	} else {
-		cmd_addr |= off & 0x3f;
+		cmd_addr |= (off >> 1) & 0x3f;
 		bits = 9;
 		data_len = 2;
 	}
-- 
2.4.10
