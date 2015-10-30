From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v6 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Fri, 30 Oct 2015 17:28:03 -0500
Message-ID: <1446244088-28281-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In an effort to cleanup this driver and add Device Tree support
the driver has been rewritten based on new driver styles and
modern kernel driver helpers. This has nearly halved the lines
of code while keeping all previous functionality.

Platform file based initialization has been dropped as there is
no examples of this use in the kernel.

v1 can be found here: [1] v2: [2] v3: [3] v4: [4] v5: [5]

Changes from v5:
 - Small formatting changes to DT Docs
 - Converted to_tps65912_gpio from macro to inline function

Changes from v4:
 - Use mfd core to add sub-devices

Changes from v3:
 - Reorganized regulator driver and related DT node
 - Other small fixes as discussed in v3 thread

Changes from v2:
 - Split the series further into subsystems

Changes from v1:
 - Split the rewrite into delete/create patches
 - Several small fixes as discussed in v1 thread

[1] http://www.spinics.net/lists/devicetree/msg93863.html
[2] http://www.spinics.net/lists/devicetree/msg95003.html
[3] http://www.spinics.net/lists/devicetree/msg95133.html
[4] http://www.spinics.net/lists/devicetree/msg96109.html
[5] http://www.spinics.net/lists/devicetree/msg100601.html

Andrew F. Davis (5):
  Documentation: tps65912: Add DT bindings for the TPS65912 PMIC
  mfd: tps65912: Remove old driver in preparation for new driver
  mfd: tps65912: Add driver for the TPS65912 PMIC
  regulator: tps65912: Add regulator driver for the TPS65912 PMIC
  gpio: tps65912: Add GPIO driver for the TPS65912 PMIC

 .../devicetree/bindings/gpio/gpio-tps65912.txt     |  16 +
 Documentation/devicetree/bindings/mfd/tps65912.txt |  51 ++
 .../bindings/regulator/tps65912-regulator.txt      |  28 +
 drivers/gpio/Kconfig                               |   2 +-
 drivers/gpio/gpio-tps65912.c                       | 292 ++++-----
 drivers/mfd/Kconfig                                |  22 +-
 drivers/mfd/Makefile                               |   3 +-
 drivers/mfd/tps65912-core.c                        | 297 ++++-----
 drivers/mfd/tps65912-i2c.c                         | 220 +++----
 drivers/mfd/tps65912-irq.c                         | 217 -------
 drivers/mfd/tps65912-spi.c                         | 221 +++----
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/tps65912-regulator.c             | 711 +++++----------------
 include/linux/mfd/tps65912.h                       | 211 +++---
 14 files changed, 815 insertions(+), 1478 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
 rewrite drivers/gpio/gpio-tps65912.c (69%)
 rewrite drivers/mfd/tps65912-core.c (95%)
 rewrite drivers/mfd/tps65912-i2c.c (93%)
 delete mode 100644 drivers/mfd/tps65912-irq.c
 rewrite drivers/mfd/tps65912-spi.c (92%)
 rewrite drivers/regulator/tps65912-regulator.c (94%)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
