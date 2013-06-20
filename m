From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCHv2 0/3] Add support for the Nuvoton NAU7802 ADC to the cfa10049
Date: Thu, 20 Jun 2013 20:57:52 +0200
Message-ID: <1371754675-12242-1-git-send-email-alexandre.belloni@free-electrons.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: jimwall@q.com, brian-ZKiFAVwZFM2FeswfMrDH8w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Sorry for the delay, this is v2 of the patchset that adds support for the 3
Nuvoton NAU7802 ADCs present on the CFA-10049 board from Crystalfontz. The first
patch adds the driver, the next ones are adding them in the DT after switching
the second i2c bus to bitbanging following a lot of timeout issues we have on
that bus.

Since v1, I've taken into account the review from Jonathan Cameron, Lars-Peter
Clausen and Maxime Ripard:
 - channels are now statically allocated
 - no wrappers around i2c functions
 - sampling_freq is a shared attribute
 - setting gain is done through scale
 - cosmetics changes (s/idev/indio_dev/, blank lines before returns)
 - use of sign_extend32 to extend the sign
 - reading scale now returns IIO_VAL_FRACTIONAL_LOG2
 - no dt lookup for interrupts, this is done in of_i2c.c but that was mask due
 to a bug.

what I didn't address is setting the external reference voltage through a fixed
regulator and I kept the vldo attribute to set the internal voltage reference in
the DT as Jonathan seemed to be ok with that. If anybody is using a nau7802 with
an external reference, it will still be time to add the fixed regulator. It
shouldn't be difficult but I don't have any hardware to test.

Regards,

Alexandre Belloni (1):
  iio: Add Nuvoton NAU7802 ADC driver

Maxime Ripard (2):
  ARM: mxs: cfa10049: Switch bus i2c1 to bitbanging
  ARM: mxs: cfa10049: Add NAU7802 ADCs to the device tree

 .../bindings/iio/adc/nuvoton-nau7802.txt           |  17 +
 arch/arm/boot/dts/imx28-cfa10049.dts               | 126 +++--
 drivers/iio/adc/Kconfig                            |   9 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/nau7802.c                          | 603 +++++++++++++++++++++
 5 files changed, 713 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton-nau7802.txt
 create mode 100644 drivers/iio/adc/nau7802.c

-- 
1.8.1.2
