From: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH 0/3] iio: adc: sama5d2_adc hw triggers and buffers
Date: Wed, 19 Apr 2017 11:20:42 +0300
Message-ID: <1492590045-17329-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch implements the hardware triggers support and
buffer management for sama5d2.
The DT modifications ( [PATCH 1/3] ARM: dts: at91: sama5d2_xplained:
enable ADTRG pin) are for demonstration purposes of the feature,
setting the pinctrl for the ADC hw trigger pin,should go through at91
maintainers.
I also increased the buffer size for the trigger name in the generic_buffer
application to cope with longer names and avoid stack smashing problem.
This is in patch [PATCH 3/3] iio: tools: generic_buffer: increase trigger length


Eugen Hristev (3):
  ARM: dts: at91: sama5d2_xplained: enable ADTRG pin
  iio: adc: at91-sama5d2_adc: add hw trigger and buffer support
  iio: tools: generic_buffer: increase trigger length

 arch/arm/boot/dts/at91-sama5d2_xplained.dts |  16 ++-
 drivers/iio/adc/at91-sama5d2_adc.c          | 208 +++++++++++++++++++++++++++-
 tools/iio/iio_utils.h                       |   2 +-
 3 files changed, 220 insertions(+), 6 deletions(-)

-- 
2.7.4
