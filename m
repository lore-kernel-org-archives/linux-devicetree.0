From: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/3] Add Broadcom iproc-static-adc controller driver
Date: Wed, 22 Jun 2016 11:41:50 +0530
Message-ID: <1466575913-5027-1-git-send-email-raveendra.padasalagi@broadcom.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset contains initial driver for Broadcom's
iproc static adc controller. The patchset is based on v4.7-rc1
tag and its tested on Broadcom Cygnus SoC.

The patches can be fetched from iproc-adc-v3 branch of
https://github.com/Broadcom/arm64-linux.git

Changes since v2:
 - Addressed various comments given by Jonathan Cameron and
   Peter Meerwald-Stadler on driver source code related to linux
   coding style and clean-up of code. Lot of source code change
   happened especially due to redefining the #defines.
 - Added code to support IIO_CHAN_INFO_SCALE mask to return
   scale value in iproc_adc_read_raw().
 - Removed #address-cells, #size-cells properties in DT binding
   document and dts file as adc will not have any child nodes as
   noticed by Rob Herring.

Changes since v1:
 - Modified Kconfig file to add more informative information
   in Broadcom Adc driver configuration menu.
 - Added Broadcom Adc driver menu config in the alphabetical
   order in Kconfig
 - Addressed various comments given by Peter Meerwald-Stadler
   on driver source code, Including issues related to linux
   coding style and race conditions.

Raveendra Padasalagi (3):
  Documentation: DT: Add iproc-static-adc binding
  iio: Add driver for Broadcom iproc-static-adc
  ARM:dts-Add dt node for Broadcom iproc-static-adc

 .../bindings/iio/adc/brcm,iproc-static-adc.txt     |  38 ++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |  11 +
 drivers/iio/adc/Kconfig                            |  12 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/bcm_iproc_adc.c                    | 648 +++++++++++++++++++++
 5 files changed, 710 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt
 create mode 100644 drivers/iio/adc/bcm_iproc_adc.c

-- 
1.9.1
