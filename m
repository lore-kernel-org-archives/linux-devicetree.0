From: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
Subject: [PATCH v4 0/2] iio: adc: hx711: Add IIO driver for AVIA HX711 ADC
Date: Wed, 21 Dec 2016 16:24:14 +0100
Message-ID: <20161221152414.GA14532@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, ak-n176/SwNRljddJNmlsFzeA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds IIO driver support for the AVIA HX711 ADC which is 
mostly used in weighting cells.

The first patch adds the new DT binding for which a new vendor avia
was also added.

The second patch is the simple IIO driver implemented as ADC.
The protocol is specific to this device and implemented using GPIOs.

Documentation of the chip can be found here:

https://cdn.sparkfun.com/datasheets/Sensors/ForceFlex/hx711_english.pdf

Changes in v4:
Thanks to the thorough reviews and suggestions of Jonathan and Lars-Peter
the driver was reworked to better meet the standard ABI of IIO. 

* Patch 1: "iio: adc: hx711: Add DT binding for avia,hx711"
  - added attribute for regulator

* Patch 2: "iio: adc: hx711: Add IIO driver for AVIA HX711"
  - two read channels for physical channels A and B
  - remove gain attribute and use scale as read raw
  - offer scale_available attribute
  - introduced regulator as analog supply; mainly needed for calculating
    the scale
  - simplyfied use of GPIOs
  - measuring input and output with oszilloscope and revised timing behavior
  - many minor changes

Changes in v3:
moved gain from devicetree to sysfs, according to comment of Lars-Peter
Thanks for reviewing and giving suggestions

* Patch 1: "iio: adc: hx711: Add DT binding for avia,hx711"
  - removed property gain

* Patch 2: "iio: adc: hx711: Add IIO driver for AVIA HX711"
  - removed property gain from devicetree
  - added device attribute (rw) for gain
  - support reading from both channels now

Changes in v2:
Lots of updates thanks to Peters review.

* Patch 1: "iio: adc: hx711: Add DT binding for avia,hx711"
  - typo
  - removed unneded section

* Patch 2: "iio: adc: hx711: Add IIO driver for AVIA HX711"
  - updated help text in Kconfig
  - removed dead code
  - removed unused power management
  - reduced channel spec to what is actually used
  - added error handling in case reset of chip not possible

Andreas Klinger (2):
  iio: adc: hx711: Add DT binding for avia,hx711
  iio: adc: hx711: Add IIO driver for AVIA HX711

 .../devicetree/bindings/iio/adc/avia-hx711.txt     |  18 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/adc/Kconfig                            |  19 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/hx711.c                            | 466 +++++++++++++++++++++
 5 files changed, 505 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
 create mode 100644 drivers/iio/adc/hx711.c

-- 
2.1.4
