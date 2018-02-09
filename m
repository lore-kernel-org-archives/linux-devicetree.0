From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH v5 0/2] iio: ad5272: Add support for Analog Devices digital potentiometers
Date: Fri,  9 Feb 2018 08:57:25 +0800
Message-ID: <1518137847-63381-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add documentation and driver for the Analog Devices 5272.

Driver currently doesn't support programing the RDAC position to 
non-volatile memory. 

Changes from v4:
- Remove references to drie in bindings
- Fix C&P error in binding doc for reset input. 
- fix typo in comment of driver.

Changes from v3:
- move SPDX-License-Identifier to line 1
- add AD5274 to Kconfig description
- Add missing empty line before return

Changes from v2:
- docs: Fix polarity of reset-gpio example to match driver
- Use a cached aligned buffer for i2c
- remove old invalid comment from c&p

Changes from v1:
- Use spdx license id
- Use sizeof for i2c buffer lens
- Condense code a little when setting up i2c buf
- check val2 in raw write
- Add reset function. Perform a software reset if
  gpio reset pin is not defined
- remove THIS_MODULE assignment
- change of data to use index as per i2c device table


Phil Reid (2):
  dt-bindings: ad5272: Add bindings for Analog Devices digital
    potentiometers
  iio: ad5272: Add support for Analog Devices digital potentiometers

 .../bindings/iio/potentiometer/ad5272.txt          |  27 +++
 drivers/iio/potentiometer/Kconfig                  |  10 +
 drivers/iio/potentiometer/Makefile                 |   1 +
 drivers/iio/potentiometer/ad5272.c                 | 227 +++++++++++++++++++++
 4 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/potentiometer/ad5272.txt
 create mode 100644 drivers/iio/potentiometer/ad5272.c

-- 
1.8.3.1
