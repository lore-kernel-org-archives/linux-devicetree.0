From: =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl-VrBV9hrLPhE@public.gmane.org>
Subject: [PATCH v2 0/2] add driver for the ti-adc084s021 chip
Date: Sun, 30 Apr 2017 14:53:40 +0200
Message-ID: <1493556822-2601-1-git-send-email-marten.lindahl@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?M=C3=A5rten=20Lindahl?= <martenli-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Mårten Lindahl <martenli-VrBV9hrLPhE@public.gmane.org>

This adds support for the Texas Instruments ADC084S021 ADC chip.

---
Changes in v2:
- Split dt-bindings and iio/adc into separate patches
- Updated dt-bindings after Robs comments
- Removed most #defines to inlines
- Corrected channel macro
- Removed configuration array with only one item
- Updated func adc084s021_adc_conversion to use be16_to_cpu
- Added IIO_CHAN_INFO_SCALE to func adc084s021_read_raw
- Use iio_device_claim_direct_mode in func adc084s021_read_raw
- Removed documentation for standard driver functions
- Changed retval to ret everywhere
- Removed dynamic alloc for data buffer in trigger handler
- Keeping mutex for all iterations in trigger handler
- Removed usage of events in this driver
- Removed info log in probe
- Use spi_message_init_with_transfers for spi message structs
- Use preenable and postdisable functions for regulator
- Inserted blank line before last return in all functions

Mårten Lindahl (2):
  dt-bindings: iio: adc: add driver for the ti-adc084s021 chip
  iio: adc: add driver for the ti-adc084s021 chip

 .../devicetree/bindings/iio/adc/ti-adc084s021.txt  |  19 ++
 drivers/iio/adc/Kconfig                            |  12 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/ti-adc084s021.c                    | 294 +++++++++++++++++++++
 4 files changed, 326 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt
 create mode 100644 drivers/iio/adc/ti-adc084s021.c

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
