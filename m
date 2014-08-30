From: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/4] Add support for Ricoh RN5T618 PMIC
Date: Sat, 30 Aug 2014 14:50:22 +0200
Message-ID: <1409403026-28818-1-git-send-email-b.galvani@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ricoh RN5T618 is a power management IC which includes 3 step-down DCDC
converters, 7 low-dropout regulators, a Li-ion battery charger, fuel
gauge, ADC, GPIOs and a watchdog timer.

This series adds a MFD core driver and separate drivers to support the
regulator and watchdog functionalities.

The patchset has been tested on a Tronsmart Vega S89 Elite TV box on
top of other patches needed to support the Amlogic Meson SoC. The tree
with all the changes is available at:

  https://github.com/bengal/linux/tree/rn5t618-v2

Changes since v1:
  - moved all header file changes to the first patch
  - mfd: allow modular build
  - mfd: removed printk after mfd registration
  - regulator: rebased on regulator/for-next
  - wdt: initialized heartbeat parameter to 0 instead of -1
  - wdt: simplified code path in set_timeout function
  - wdt: fixed module unloading
  - wdt: made 'time' unsigned in struct rn5t618_wdt_map

Beniamino Galvani (4):
  mfd: Add Ricoh RN5T618 PMIC core driver
  regulator: add driver for Ricoh RN5T618 regulators
  watchdog: add driver for Ricoh RN5T618 watchdog
  mfd: rn5t618: document device tree bindings

 Documentation/devicetree/bindings/mfd/rn5t618.txt |   36 ++++
 drivers/mfd/Kconfig                               |   11 +
 drivers/mfd/Makefile                              |    1 +
 drivers/mfd/rn5t618.c                             |  134 ++++++++++++
 drivers/regulator/Kconfig                         |    6 +
 drivers/regulator/Makefile                        |    1 +
 drivers/regulator/rn5t618-regulator.c             |  143 +++++++++++++
 drivers/watchdog/Kconfig                          |   11 +
 drivers/watchdog/Makefile                         |    1 +
 drivers/watchdog/rn5t618_wdt.c                    |  198 ++++++++++++++++++
 include/linux/mfd/rn5t618.h                       |  228 +++++++++++++++++++++
 11 files changed, 770 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rn5t618.txt
 create mode 100644 drivers/mfd/rn5t618.c
 create mode 100644 drivers/regulator/rn5t618-regulator.c
 create mode 100644 drivers/watchdog/rn5t618_wdt.c
 create mode 100644 include/linux/mfd/rn5t618.h

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
