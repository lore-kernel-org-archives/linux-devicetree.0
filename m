From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Add support to UVIS25 uv sensor
Date: Wed, 25 Oct 2017 20:16:07 +0200
Message-ID: <20171025181609.3803-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lorenzo Bianconi (2):
  iio: light: add support to UVIS25 sensor
  dt-bindings: iio: light: add UVIS25 device bindings

 .../devicetree/bindings/iio/light/st_uvis25.txt    |  23 ++
 drivers/iio/light/Kconfig                          |  22 ++
 drivers/iio/light/Makefile                         |   6 +
 drivers/iio/light/st_uvis25.h                      |  63 +++++
 drivers/iio/light/st_uvis25_buffer.c               | 147 ++++++++++++
 drivers/iio/light/st_uvis25_core.c                 | 264 +++++++++++++++++++++
 drivers/iio/light/st_uvis25_i2c.c                  |  76 ++++++
 drivers/iio/light/st_uvis25_spi.c                  | 109 +++++++++
 8 files changed, 710 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/st_uvis25.txt
 create mode 100644 drivers/iio/light/st_uvis25.h
 create mode 100644 drivers/iio/light/st_uvis25_buffer.c
 create mode 100644 drivers/iio/light/st_uvis25_core.c
 create mode 100644 drivers/iio/light/st_uvis25_i2c.c
 create mode 100644 drivers/iio/light/st_uvis25_spi.c

-- 
2.14.2
