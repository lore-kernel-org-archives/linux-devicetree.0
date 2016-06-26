From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v3 0/5] regulator: add Ricoh RN5T567 PMIC support
Date: Sat, 25 Jun 2016 18:15:10 -0700
Message-ID: <20160626011515.4428-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, max.oss.09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds RN5T567 PMIC support which is used on the 
Toradex Colibri iMX7S/iMX7D modules. The existing RN5T618 is from
the same family, hence this patchset uses the same driver and adds
variant support.

The Colibris currently do not use the PMIC's power off capabilities,
as do the current users of that PMIC driver. Therefore this patchset
also makes the use of the system-power-controller property mandatory
if the power off capabilties are required.

Changes since v2:
- Elevate restart priority to 192 to make sure PMIC takes presedence
  over SoC level restart capabilities (e.g. watchdog)
- Print a warning if poweroff callback is already assigned
- Reorder of_id and variant assignment
- Lower delay to 1ms and justify why it is required
- Fix DCDC count and a typos in device tree bindings

Changes since v1:
- Removed obsolete include <asm/system_misc.h>

Stefan Agner (5):
  ARM: dts: meson: minix-neo-x8: define PMIC as power controller
  mfd: add Ricoh RN5T567 PMIC support
  regulator: rn5t618: add RN5T567 PMIC support
  mfd: rn5t618: register power off callback optionally
  mfd: rn5t618: register restart handler

 Documentation/devicetree/bindings/mfd/rn5t618.txt | 19 ++++---
 arch/arm/boot/dts/meson8-minix-neo-x8.dts         |  1 +
 drivers/mfd/Kconfig                               |  7 ++-
 drivers/mfd/rn5t618.c                             | 69 +++++++++++++++++++----
 drivers/regulator/Kconfig                         |  5 +-
 drivers/regulator/rn5t618-regulator.c             | 40 +++++++++++--
 include/linux/mfd/rn5t618.h                       | 13 +++++
 7 files changed, 125 insertions(+), 29 deletions(-)

-- 
2.8.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
