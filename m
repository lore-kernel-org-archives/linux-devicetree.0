From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] Add driver for Domintech DMARD06 accelerometer
Date: Mon, 25 Jul 2016 18:21:16 +0300
Message-ID: <1469460078-6460-1-git-send-email-mamlinav@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds driver for Domintech DMARD05, DMARD06 and DMARD07
accelerometers and vendor prefix for Domintech Co., Ltd.

Changes since v1:
 - Add Rob's Acked-by to vendor-prefix bindings
 - Remove dmard06_i2c_read function, use i2c_smbus_read_byte_data instead
 - Remove dmard06_read_chip_id function, check chip id directly on probe
 - Use sign_extend32 in dmard06_read_raw function
 - Replace error variable with ret
 - Remove unnecessary messages
 - Fix typo in documentation bindings
 - Add support for DMARD05 and DMARD07 chips
 - Add PM ops

Aleksei Mamlin (2):
  devicetree: bindings: Add vendor prefix for Domintech Co., Ltd.
  iio: accel: Add support for Domintech DMARD06 accelerometer

 .../devicetree/bindings/iio/accel/dmard06.txt      |  19 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/accel/Kconfig                          |  11 +
 drivers/iio/accel/Makefile                         |   1 +
 drivers/iio/accel/dmard06.c                        | 241 +++++++++++++++++++++
 5 files changed, 273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/dmard06.txt
 create mode 100644 drivers/iio/accel/dmard06.c

-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
