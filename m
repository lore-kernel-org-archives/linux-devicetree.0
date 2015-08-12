From: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 0/2] iio: proximity: add PulsedLight LIDAR sensor support
Date: Tue, 11 Aug 2015 23:01:14 -0700
Message-ID: <1439359276-19028-1-git-send-email-mranostay@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for this range finding LIDAR module, and reports
distance back in meters to centimeter resolution with +/- 2.5 CM of accuracy
at ~40 meters.

Changes from v4:
* moved comment to read command function
* remove un-needed buffer indexing
* renamed device and driver name to pulsedlight-lidar-lite-v2 to resolve
  confusion that v1 will likely not work with this driver

Matt Ranostay (2):
  devicetree: add PulsedLight vendor + device docs
  iio: proximity: add support for PulsedLight LIDAR

 .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/proximity/Kconfig                      |  12 +
 drivers/iio/proximity/Makefile                     |   1 +
 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c  | 292 +++++++++++++++++++++
 5 files changed, 307 insertions(+)
 create mode 100644 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
