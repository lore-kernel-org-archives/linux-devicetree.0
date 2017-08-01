From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v2 0/4] Support for LEGO MINDSTORMS EV3 LCD display
Date: Tue,  1 Aug 2017 17:11:46 -0500
Message-ID: <1501625510-16727-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The goal of this series is to get the built-in LCD of the LEGO MINDSTORMS EV3
working.

v2 changes:
* Wrote a new driver for ST7586 instead of combining it with existing drivers
* Don't touch MIPI DBI code (other than the patch suggested by Noralf)
* New defconfig patch


David Lechner (4):
  drm/tinydrm: remove call to mipi_dbi_init() from mipi_dbi_spi_init()
  drm/tinydrm: add support for LEGO MINDSTORMS EV3 LCD
  ARM: dts: da850-lego-ev3: Add node for LCD display
  ARM: davinci_all_defconfig: enable tinydrm and ST7586

 .../devicetree/bindings/display/st7586.txt         |  26 +
 arch/arm/boot/dts/da850-lego-ev3.dts               |  24 +
 arch/arm/configs/davinci_all_defconfig             |   2 +
 drivers/gpu/drm/tinydrm/Kconfig                    |  10 +
 drivers/gpu/drm/tinydrm/Makefile                   |   1 +
 drivers/gpu/drm/tinydrm/mi0283qt.c                 |   8 +-
 drivers/gpu/drm/tinydrm/mipi-dbi.c                 |  17 +-
 drivers/gpu/drm/tinydrm/st7586.c                   | 579 +++++++++++++++++++++
 include/drm/tinydrm/mipi-dbi.h                     |   6 +-
 include/drm/tinydrm/st7586.h                       |  34 ++
 10 files changed, 688 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/st7586.txt
 create mode 100644 drivers/gpu/drm/tinydrm/st7586.c
 create mode 100644 include/drm/tinydrm/st7586.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
