From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] Documentation: dt: iio: imu: st_lsm6dsx: add st,drdy-int-pin property
Date: Sun, 22 Jan 2017 19:32:25 +0100
Message-ID: <20170122183225.2539-3-lorenzo.bianconi@st.com>
References: <20170122183225.2539-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170122183225.2539-1-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add st,drdy-int-pin property to select interrupt pin of the package

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
---
 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
index ed3cdac..cf81afd 100644
--- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
@@ -7,6 +7,8 @@ Required properties:
 - reg: i2c address of the sensor / spi cs line
 
 Optional properties:
+- st,drdy-int-pin: the pin on the package that will be used to signal
+  "data ready" (valid values: 1 or 2).
 - interrupt-parent: should be the phandle for the interrupt controller
 - interrupts: interrupt mapping for IRQ. It should be configured with
   flags IRQ_TYPE_LEVEL_HIGH or IRQ_TYPE_EDGE_RISING.
-- 
2.9.3
