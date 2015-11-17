From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 0/7] Devicetree support for misc/eeprom/eeprom_93xx46.
Date: Mon, 16 Nov 2015 23:16:29 -0500
Message-ID: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agust-ynQEQJNshbs@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series of patches adds an initial set of devicetree bindings to the
eeprom_93xx46 driver which mirror the configuration options previously
available as a platform device.  These bindings are then extended to
include support for specific Atmel devices in this family and also to
support GPIO-based selection of the device (e.g. for use with an SPI bus
mux).

Additionally, an address aliasing issue with 16-bit read and write
accesses in the eeprom_93xx46 driver discovered during testing is fixed.

Cory Tusar (7):
  misc: eeprom: 93xx46: Fix 16-bit read and write accesses.
  misc: eeprom: 93xx46: Add DT bindings to eeprom_93xx46 driver.
  misc: eeprom: 93xx46: Implement eeprom_93xx46 DT bindings.
  misc: eeprom: 93xx46: Add DT binding for Atmel AT93C46D devices.
  misc: eeprom: 93xx46: Add quirks to support Atmel AT93C46D device.
  misc: eeprom: 93xx46: Add DT binding for a GPIO 'select' line.
  misc: eeprom: 93xx46: Add support for a GPIO 'select' line.

 .../devicetree/bindings/misc/eeprom-93xx46.txt     |  23 +++
 drivers/misc/eeprom/eeprom_93xx46.c                | 216 +++++++++++++++++----
 include/linux/eeprom_93xx46.h                      |   7 +
 3 files changed, 210 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/eeprom-93xx46.txt

-- 
2.4.10

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
