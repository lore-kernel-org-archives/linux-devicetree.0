From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Add open drain support to st_lsm6dsx
Date: Wed, 21 Jun 2017 21:21:27 +0200
Message-ID: <20170621192129.10226-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lorenzo Bianconi (2):
  iio: imu: st_lsm6dsx: support open drain mode
  dt-bindings: iio: imu: st_lsm6dsx: support open drain mode

 .../devicetree/bindings/iio/imu/st_lsm6dsx.txt          |  8 ++++++++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c          | 17 +++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.13.1
