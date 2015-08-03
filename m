From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] MAX6675 IIO temperature driver
Date: Mon,  3 Aug 2015 16:56:47 -0400
Message-ID: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux IIO List <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds a driver for the MAX6675 SPI thermocouple converter.
The device supports temperature measurements via type-K thermocouples
and implements cold-junction compensation within the part. The datasheet
can be found at http://datasheets.maximintegrated.com/en/ds/MAX6675.pdf

Matt Porter (3):
  iio: temperature: add max6675 dt binding
  iio: temperature: add max6675 thermocouple converter driver
  MAINTAINERS: add max6675 driver

 .../bindings/iio/temperature/max6675.txt           |  19 +++
 MAINTAINERS                                        |   7 +
 drivers/iio/temperature/Kconfig                    |  11 ++
 drivers/iio/temperature/Makefile                   |   1 +
 drivers/iio/temperature/max6675.c                  | 155 +++++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/max6675.txt
 create mode 100644 drivers/iio/temperature/max6675.c

-- 
2.1.4
