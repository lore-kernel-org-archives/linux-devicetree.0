From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] fix L3GD20H gyroscope sensor support
Date: Mon, 19 Jun 2017 22:04:29 +0200
Message-ID: <20170619200431.9615-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robert.dolca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lorenzo Bianconi (2):
  iio: gyro: st_gyro: fix L3GD20H support
  dt-bindings: iio: gyro: add L3GD20H sensor device binding

 Documentation/devicetree/bindings/iio/st-sensors.txt |  1 +
 drivers/iio/gyro/st_gyro.h                           |  1 +
 drivers/iio/gyro/st_gyro_core.c                      | 13 +++++++------
 drivers/iio/gyro/st_gyro_i2c.c                       |  5 +++++
 drivers/iio/gyro/st_gyro_spi.c                       |  1 +
 5 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.13.1
