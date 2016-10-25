From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] add support to lng2dm accel sensor
Date: Tue, 25 Oct 2016 23:09:02 +0200
Message-ID: <1477429744-27713-1-git-send-email-lorenzo.bianconi@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lorenzo Bianconi (2):
  iio: accel: st_accel: add support to lng2dm
  Documentation: dt: iio: accel: add lng2dm sensor device binding

 .../devicetree/bindings/iio/st-sensors.txt         |  1 +
 drivers/iio/accel/Kconfig                          |  3 +-
 drivers/iio/accel/st_accel.h                       |  1 +
 drivers/iio/accel/st_accel_core.c                  | 73 ++++++++++++++++++++++
 drivers/iio/accel/st_accel_i2c.c                   |  5 ++
 drivers/iio/accel/st_accel_spi.c                   |  1 +
 6 files changed, 83 insertions(+), 1 deletion(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
