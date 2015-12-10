From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: [PATCH v4 1/5] misc: eeprom_93xx46: Fix 16-bit read and write accesses.
Date: Wed,  9 Dec 2015 23:00:51 -0500
Message-ID: <1449720055-25965-2-git-send-email-cory.tusar@pid1solutions.com>
References: <1449720055-25965-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449720055-25965-1-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Compatible at93xx46 devices from both Microchip and Atmel expect a
word-based address, regardless of whether the device is strapped for 8-
or 16-bit operation.  However, the offset parameter passed in when
reading or writing at a specific location is always specified in terms
of bytes.

This commit fixes 16-bit read and write accesses by shifting the offset
parameter to account for this difference between a byte offset and a
word-based address.

Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Tested-by: Chris Healy <chris.healy-c8ZVq/bFV1I@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
