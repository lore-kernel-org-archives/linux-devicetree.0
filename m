From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] Add support for UVIS25 uv sensor
Date: Thu, 23 Nov 2017 23:59:04 +0100
Message-ID: <20171123225906.31838-1-lorenzo.bianconi83@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changes since v1:
- use regmap API
- rename devicetree binding file to match compatible string
- move buffer/trigger code in st_uvis25_core.c
- improve comments
- fix potential race st_uvis25_read_oneshot()
- address Peter's comments

Lorenzo Bianconi (2):
  iio: light: add support for UVIS25 sensor
  dt-bindings: iio: light: add UVIS25 device bindings

 .../devicetree/bindings/iio/light/uvis25.txt       |  23 ++
 drivers/iio/light/Kconfig                          |  24 ++
 drivers/iio/light/Makefile                         |   3 +
 drivers/iio/light/st_uvis25.h                      |  37 +++
 drivers/iio/light/st_uvis25_core.c                 | 360 +++++++++++++++++++++
 drivers/iio/light/st_uvis25_i2c.c                  |  69 ++++
 drivers/iio/light/st_uvis25_spi.c                  |  68 ++++
 7 files changed, 584 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/uvis25.txt
 create mode 100644 drivers/iio/light/st_uvis25.h
 create mode 100644 drivers/iio/light/st_uvis25_core.c
 create mode 100644 drivers/iio/light/st_uvis25_i2c.c
 create mode 100644 drivers/iio/light/st_uvis25_spi.c

-- 
2.15.0
