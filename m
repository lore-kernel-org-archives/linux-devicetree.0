From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Add support for falling-low_level interrupts
Date: Wed,  7 Jun 2017 20:17:09 +0200
Message-ID: <20170607181711.16195-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lorenzo Bianconi (2):
  iio: imu: st_lsm6dsx: support active-low interrupts
  Documentation: dt: iio: imu: st_lsm6dsx: support active-low interrupts

 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt |  3 ++-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c           | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.12.2
