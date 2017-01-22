From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] iio: imu: st_lsm6dsx: add capability to select interrupt pin
Date: Sun, 22 Jan 2017 19:32:23 +0100
Message-ID: <20170122183225.2539-1-lorenzo.bianconi@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changes since v1:
- rely on the -ENOSYS return value from of_property_read_u32 to check if OF
  has been enabled

Lorenzo Bianconi (2):
  iio: imu: st_lsm6dsx: add possibility to select drdy pin
  Documentation: dt: iio: imu: st_lsm6dsx: add st,drdy-int-pin property

 .../devicetree/bindings/iio/imu/st_lsm6dsx.txt     |  2 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c       | 59 +++++++++++++++++++---
 2 files changed, 55 insertions(+), 6 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
