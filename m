From: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/3] iio: add Intersil isl76683 light sensor support
Date: Tue,  7 Nov 2017 16:36:20 +0100
Message-ID: <1510068983-25769-1-git-send-email-chf.fritz@googlemail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds initial support for isl76683 light sensor.

Christoph Fritz (3):
  iio: light: add support for Intersil isl76683 sensor
  dt-bindings: iio: add Intersil isl76683 light sensor bindings
  iio: light: isl76683 add way to adjust irq threshold

 .../ABI/testing/sysfs-bus-iio-light-isl76683       |  17 +
 .../devicetree/bindings/iio/light/isl76683.txt     |  26 +
 drivers/iio/light/Kconfig                          |  12 +
 drivers/iio/light/Makefile                         |   1 +
 drivers/iio/light/isl76683.c                       | 743 +++++++++++++++++++++
 5 files changed, 799 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-light-isl76683
 create mode 100644 Documentation/devicetree/bindings/iio/light/isl76683.txt
 create mode 100644 drivers/iio/light/isl76683.c

-- 
2.1.4
