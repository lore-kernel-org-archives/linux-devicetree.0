From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/4] Support for analog peripherals on LPC18xx familiy
Date: Sun,  6 Mar 2016 12:13:11 +0100
Message-ID: <1457262795-20282-1-git-send-email-manabian@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds support for the analog (ADC and DAC) peripherals
found on NXP LPC18xx/43xx SoCs. The ADC is a SAR converter with 10-bit
resolution and 8 muxed inputs. The DAC is a simple single channel 10-
bit DAC.

Note that these drivers do not support all the features found on the
peripherals. DMA and interrupts are not supported in either drivers.
The ADC driver also lack 'burst-mode' and hardware triggers. So for
now the ADC is limited to single shot samples.

Both drivers tested on Embedded Artists' LPC4357 Developer's Kit.

Based on iio/testing branch from 29.02.15.

This version address the comments from Peter Meerwald-Stadler and
adds locking to adc read.

Changes since v1:
 - Fix nits on adc/dac from Peter Meerwald-Stadler
 - Add locking around lpc18xx_adc_read_chan()


Joachim Eastwood (4):
  iio: adc: add NXP LPC18xx ADC driver
  dt: document NXP LPC1850 ADC driver bindings
  iio: dac: add NXP LPC18xx DAC driver
  dt: document NXP LPC1850 DAC driver bindings

 .../devicetree/bindings/iio/adc/lpc1850-adc.txt    |  21 ++
 .../devicetree/bindings/iio/dac/lpc1850-dac.txt    |  20 ++
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/lpc18xx_adc.c                      | 228 +++++++++++++++++++++
 drivers/iio/dac/Kconfig                            |  10 +
 drivers/iio/dac/Makefile                           |   1 +
 drivers/iio/dac/lpc18xx_dac.c                      | 204 ++++++++++++++++++
 8 files changed, 495 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/lpc1850-adc.txt
 create mode 100644 Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt
 create mode 100644 drivers/iio/adc/lpc18xx_adc.c
 create mode 100644 drivers/iio/dac/lpc18xx_dac.c

-- 
1.8.0
