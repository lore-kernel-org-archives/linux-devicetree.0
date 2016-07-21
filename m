From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Add driver for Domintech DMARD06 accelerometer
Date: Thu, 21 Jul 2016 23:32:20 +0300
Message-ID: <1469133140-14722-1-git-send-email-mamlinav@gmail.com>
References: <1468846092-18914-1-git-send-email-mamlinav@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468846092-18914-1-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds driver for Domintech DMARD06 low-g tri-axial
digital accelerometer and vendor prefix for Domintech Co., Ltd.

Changes since v1:
 - Rewrite driver to iio subsystem

Aleksei Mamlin (2):
  devicetree: bindings: Add vendor prefix for Domintech Co., Ltd.
  iio: accel: Add support for Domintech DMARD06 accelerometer

 .../devicetree/bindings/iio/accel/dmard06.txt      |  17 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/accel/Kconfig                          |  11 ++
 drivers/iio/accel/Makefile                         |   1 +
 drivers/iio/accel/dmard06.c                        | 219 +++++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/dmard06.txt
 create mode 100644 drivers/iio/accel/dmard06.c

-- 
2.7.3
