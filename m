From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: [PATCH v2 1/2] Documentation: devicetree: root node serial-number property documentation
Date: Fri, 17 Apr 2015 20:43:54 +0200
Message-ID: <1429296235-14123-1-git-send-email-contact@paulk.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Open firmware is already using the serial-number property for passing the
device's serial number from the bootloader to the kernel. In addition, lshw
already has support for scanning this property.

The serial number is a string that somewhat represents the device's serial
number. It might come from some form of storage (e.g. an eeprom) and be
programmed at factory-time by the manufacturer or come from identification
bits available in e.g. the SoC (note that the soc_id property in the SoC bus
should hold a full account of those bits).

The serial number is taken as-is from the bootloader, so it is up to the
bootloader to define where the serial number comes from and what length it
should be. Some use cases for the serial number require it to have a maximum
length (e.g. for USB serial number) and some other cases imply more restrictions
on what the serial number should look like (e.g. in Android, the ro.serialno
property is usually a 16-bytes (plus one null byte) representation of a 64 bit
number).

Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
---
 Documentation/devicetree/booting-without-of.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
index 7768518..95fc385 100644
--- a/Documentation/devicetree/booting-without-of.txt
+++ b/Documentation/devicetree/booting-without-of.txt
@@ -828,6 +828,10 @@ address which can extend beyond that limit.
   name may clash with standard defined ones, you prefix them with your
   vendor name and a comma.
 
+  Additional properties for the root node:
+
+    - serial-number : a string representing the device's serial number
+
   b) The /cpus node
 
   This node is the parent of all individual CPU nodes. It doesn't
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
