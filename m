From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 0/3] iio: Add Cosmic Circuits ADC support
Date: Tue, 6 Jan 2015 12:29:00 -0300
Message-ID: <1420558143-26276-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series add the support for an ADC IP block from Cosmic Circuits.
The patchset is based on v3.19-rc3.

Rob/Mark: Jonathan has asked for an ack of the devicetree binding. Do you
think you can take a look to that?

Thanks a lot!
--
Changes from v5:

  * Fixed CC10001_ADC_CH_MASK macro definition, to separate the channel
    number from the channel map, as noted by Hartmut.
  * Return the real error code in devm_regulator_get failure.

Changes from v4:

  * Added a compile-time dependency on REGULATOR and HAVE_CLK.
  * Replaced the silly XOR operation for a proper mask out of the
    available channels.

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
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/cc10001_adc.c                      | 424 +++++++++++++++++++++
 5 files changed, 459 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/cc10001_adc.txt
 create mode 100644 drivers/iio/adc/cc10001_adc.c

-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
