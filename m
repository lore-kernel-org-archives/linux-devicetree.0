From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v3 0/6] Support for LEGO MINDSTORMS EV3 LCD display
Date: Thu,  3 Aug 2017 17:33:44 -0500
Message-ID: <1501799630-1650-1-git-send-email-david@lechnology.com>
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

v3 changes:
* New patch to generalize tinydrm_xrgb8888_to_gray8() so that it can be reused.
* Device tree bindings in separate patch.
* Fixed incorrect device tree binding pin descriptions.
* Added MAINTAINERS entry for drivers/gpu/drm/tinydrm/st7586.c.
* Removed "mipi_dbi_" from function names in st7586.c.
* Moved init and fini to pipe_enable and pipe_disable ops.
* Dropped RGB565 format.
* Made adjustments for the fact the controller cannot be read via SPI.
* Dropped st7586.h - values moved into st7586.c.

David Lechner (6):
  drm/tinydrm: remove call to mipi_dbi_init() from mipi_dbi_spi_init()
  drm/tinydrm: generalize tinydrm_xrgb8888_to_gray8()
  dt-bindings: add binding for Sitronix ST7586 display panels
  drm/tinydrm: add support for LEGO MINDSTORMS EV3 LCD
  ARM: dts: da850-lego-ev3: Add node for LCD display
  ARM: davinci_all_defconfig: enable tinydrm and ST7586

 .../bindings/display/sitronix,st7586.txt           |  26 ++
 MAINTAINERS                                        |   6 +
 arch/arm/boot/dts/da850-lego-ev3.dts               |  24 ++
 arch/arm/configs/davinci_all_defconfig             |   2 +
 drivers/gpu/drm/tinydrm/Kconfig                    |  10 +
 drivers/gpu/drm/tinydrm/Makefile                   |   1 +
 drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c     |  35 +-
 drivers/gpu/drm/tinydrm/mi0283qt.c                 |   8 +-
 drivers/gpu/drm/tinydrm/mipi-dbi.c                 |  17 +-
 drivers/gpu/drm/tinydrm/repaper.c                  |  21 +-
 drivers/gpu/drm/tinydrm/st7586.c                   | 466 +++++++++++++++++++++
 include/drm/tinydrm/mipi-dbi.h                     |   6 +-
 include/drm/tinydrm/tinydrm-helpers.h              |   3 +-
 13 files changed, 582 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7586.txt
 create mode 100644 drivers/gpu/drm/tinydrm/st7586.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
