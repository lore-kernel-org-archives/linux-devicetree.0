From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Add support to LPS33HW and LPS35HW pressure sensors
Date: Sat,  2 Sep 2017 19:39:13 +0200
Message-ID: <20170902173915.17341-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lorenzo Bianconi (2):
  iio: pressure: add support to LPS33HW and LPS35HW
  dt-bindings: iio: pressure: add LPS33HW and LPS35HW device bindings

 Documentation/devicetree/bindings/iio/st-sensors.txt |  2 ++
 drivers/iio/pressure/st_pressure.h                   |  4 ++++
 drivers/iio/pressure/st_pressure_core.c              |  2 ++
 drivers/iio/pressure/st_pressure_i2c.c               | 10 ++++++++++
 drivers/iio/pressure/st_pressure_spi.c               | 10 ++++++++++
 5 files changed, 28 insertions(+)

-- 
2.14.1
