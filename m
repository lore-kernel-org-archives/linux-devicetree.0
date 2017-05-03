From: =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl-VrBV9hrLPhE@public.gmane.org>
Subject: [PATCH v3 0/2] add driver for the ti-adc084s021 chip
Date: Wed,  3 May 2017 14:01:43 +0200
Message-ID: <1493812905-28904-1-git-send-email-marten.lindahl@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?M=C3=A5rten=20Lindahl?= <martenli-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Mårten Lindahl <martenli-VrBV9hrLPhE@public.gmane.org>

This adds support for the Texas Instruments ADC084S021 ADC chip.

---
Changes in v3:
- Removed unnecessary comment about channel specification
- Skipped usage of 'address' in iio_chan_spec config macro
- Mask and shift channel readings only for _read_raw function
- Enable/disable regulator in _read_raw function
- Improved setup of ADC channel readings
- Use SPI config of speed_hz and bits_per_word
- Use devm_iio_triggered_buffer_setup and devm_iio_device_register
- Removed error message for failed devm_iio_device_register
- Removed driver _remove callback function

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
 drivers/iio/adc/ti-adc084s021.c                    | 302 +++++++++++++++++++++
 4 files changed, 334 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt
 create mode 100644 drivers/iio/adc/ti-adc084s021.c

-- 
2.1.4
