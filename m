From: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Subject: [PATCH v2 0/6] iio: bmi160: cleanups and hardware fifo support
Date: Thu,  8 Dec 2016 15:22:53 +0100
Message-ID: <20161208142259.26230-1-m.niestroj@grinn-global.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patch series consists of cleanups, of device tables, device-tree
bindings documentation and finally support for hardware FIFO.

Patches have been rebased and tested on 4.9.0-rc8.

Changes v1 -> v2:
 * add of device tables for spi and i2c (suggested by Jonathan)
 * device-tree bindings documentation: remove "gpio" keyword from
   interrupts property description, describe "INT1" and "INT2" cases
   for interrupt-names property (suggested by Rob)
 * introduce mutex protection of data transmission as a separate patch
   (suggested by Peter)
 * fix time needed to sleep after command execution
 * add __ prefix to all functions that should be called with mutex held
   (suggested by Peter)
 * get rid of non-constant array size (suggested by Peter)
 * disable irq on init failure and module removal (suggested by Peter)
 * make bmi160_buffer_predisable() the reverse order of the
   bmi160_buffer_postenable() (suggested by Jonathan)
 * remove realignment for iio_info structs (suggested by Jonathan)

Marcin Niestroj (6):
  iio: bmi160: Add of device table for i2c
  iio: bmi160: Add of device table for spi
  Documentation: DT: Add bmi160 imu binding
  iio: bmi160: Protect data transmission with mutex
  iio: bmi160: Fix time needed to sleep after command execution
  iio: bmi160: Support hardware fifo

 .../devicetree/bindings/iio/imu/bmi160.txt         |  36 ++
 drivers/iio/imu/bmi160/bmi160.h                    |   3 +-
 drivers/iio/imu/bmi160/bmi160_core.c               | 678 +++++++++++++++++++--
 drivers/iio/imu/bmi160/bmi160_i2c.c                |  21 +-
 drivers/iio/imu/bmi160/bmi160_spi.c                |  21 +-
 5 files changed, 711 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/bmi160.txt

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
