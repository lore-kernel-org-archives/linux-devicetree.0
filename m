From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/3] iio: Add Cosmic Circuits ADC support
Date: Tue, 25 Nov 2014 16:52:44 -0300
Message-ID: <1416945167-28165-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fourth round of this series. Jonathan: If nobody has further comments,
I'd like to get this merged for v3.19.

Changes from v3:

  * Fixed a few style nitpicks as per Hartmut's feedback.

  * Used GENMASK() to build the channel mask, which fixes a very nasty
    bug. Also found by Hartmut.

Changes from v2:

  * Changed a devicetree property from adc-available-channels to
    adc-reserved-channels, so it can be made optional.

  * Renamed the driver from cc_10001_xxx to cc10001_xxx so it's consistent
    with the rest of the kernel style.

  * Some more minor cosmetic fixes.

Changes from v1:

  * Removed unneeded header includes.

  * Changed all the names and macros prefix: s/CC_10001_/CC10001_.

  * Used .update_scan_mode callback to preallocate the buffer.

  * Used indio_dev for the struct iio_dev.

  * Only read the regulator voltage when needed.

  * Fixed probe() error handling.

  * Used for_each_set_bit() instead of open-coding it.

  * Name the power-down register as _POWER_UP, to make the code
    less silly.

  * Error out when no valid sample can be read (i.e. when end-of-conversion
    poll times out).

  * ... plus some assorted code cleaning based on the feedback.

Ezequiel Garcia (1):
  DT: Add a vendor prefix for Cosmic Circuits

Phani Movva (2):
  iio: adc: Cosmic Circuits 10001 ADC driver
  DT: iio: adc: Add CC_10001 binding documentation

 .../devicetree/bindings/iio/adc/cc10001_adc.txt    |  22 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/adc/Kconfig                            |  12 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/cc10001_adc.c                      | 424 +++++++++++++++++++++
 5 files changed, 460 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/cc10001_adc.txt
 create mode 100644 drivers/iio/adc/cc10001_adc.c

-- 
2.1.0
