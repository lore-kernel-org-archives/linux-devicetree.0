From: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Subject: [PATCH v3 0/5] iio: mxs-lradc: add support to optional divider_by_two
Date: Mon, 22 Jul 2013 16:03:58 +0200
Message-ID: <1374501843-19651-1-git-send-email-hector.palacios@digi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, hector.palacios-i7dp0qKlBMg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Greetings,

This is v3 of the patchset that adds support to the optional 
divider_by_two of LRADC channels.

Changes in v3:
- Fix merge conflict with previous existing patch.
- Fix ampersand in function callback assignment.
- Removed unused parameters of function to read single sample.
- Ennumeration for two-dimensional array of scale (with divider
  by two disabled or enabled), for improved readability.
- Created struct with integer and nano parts of the scale 
  attribute, for improved readability.

Changes in v2:
- Fix the sample mask passed by the touchscreen driver to the input
  subsytem, to be 12 bits.
- Move the reference voltages to the Device Tree.
- Rebased to avoid conflict with Marek Vasut's prior patch.
- Use IIO_DEVICE_ATTR() macro for adding scale_available property to
  all channels.
- Make 'is_divided' unsigned int.

Notes:
- Other fixes were discussed in v1 but they were not part of this
  patchset changes, and should be handled in a separate patch.
- The 64bit math to calculate the integer and decimal parts of the
  scaling attribute is a bit unreadable but used in other similar
  drivers like ad7791, ad7793, and ad7192. If it is to be changed
  it should be done in parallel with these, in a different patch.

The first patch changes the realbits to 12. The 
second adds the channels reference voltages to the DT.
The following add the scale read operation, scale_available read 
operation, and scale write operation.

This was tested on a custom i.MX28 platform.
Could someone please test on an i.MX23?


Hector Palacios (5):
  iio: mxs-lradc: change the realbits to 12
  ARM: dts: add reference voltage property for MXS LRADC
  iio: mxs-lradc: add scale attribute to channels
  iio: mxs-lradc: add scale_available file to channels
  iio: mxs-lradc: add write_raw function to modify scale

 .../bindings/staging/iio/adc/mxs-lradc.txt         |   9 +-
 arch/arm/boot/dts/imx23.dtsi                       |   4 +
 arch/arm/boot/dts/imx28.dtsi                       |   4 +
 drivers/staging/iio/adc/mxs-lradc.c                | 255 ++++++++++++++++++---
 4 files changed, 242 insertions(+), 30 deletions(-)
