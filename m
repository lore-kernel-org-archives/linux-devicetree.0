From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 0/9] drm: Add support for tiny LCD displays
Date: Sun, 22 Jan 2017 19:11:08 +0100
Message-ID: <20170122181117.8210-1-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an attempt at providing a DRM version of drivers/staging/fbtft.

The tinydrm library provides a very simplified view of DRM in particular
for tiny displays that has onboard video memory and is connected through
a slow bus like SPI/I2C.

Main changes since the RFCv2 in April last year:
- No tinydrm specific callbacks (dirtyfb+drm_panel_funcs), instead use
  drm_simple_display_pipe_funcs and drm_framebuffer_funcs directly in
  drivers and controller libraries.
- Drop lcdreg abstraction. MIPI DCS isn't really about registers, but
  rather commands with optional parameters. regmap is probably a good
  fit for the other more register oriented controllers.

I will cut back on some of the DRM_DEBUG*() usage when the api has settled.


Noralf.


Changes since RFC v2:
- Rebased on new core helpers
- Don't use drm_panel
- Flush when the framebuffer is changed on the plane
- Add devm_tinydrm_init()
- Fix PRIME support, set vaddr
- Use atomic helpers in suspend/resume
- Add a tinydrm_connector with one display mode
- Set mode_config.preferred_depth and use it for fbdev
- Subclass tinydrm_device in drivers instead of bloating the structure
- The PiTFT display uses a MI0283QT panel, write driver for that instead.
- Drop homegrown lcdreg module, it ended up as a collection of special
  cases.
- Add more documentation

Changes since RFC v1:
- Add fb_deferred_io support to drm_fb_helper and drm_fb_cma_helper,
  and use drm_fb_cma_helper instead.
- Move display pipeline code to drm_simple_kms_helper.
- Don't use (struct drm_driver *)->load().
- Make tinydrm more like a library, exporting the internals.
- Move the struct drm_driver definition from the tinydrm module to the
  driver using a helper macro: TINYDRM_DRM_DRIVER.
- Remove dirtyfb() async code.
- Added support for partial display updates.


Noralf Trønnes (9):
  drm/fb-cma-helper: Add drm_fbdev_cma_set_suspend_unlocked()
  drm: debugfs: Remove all files automatically on cleanup
  drm/simple-helpers: Add missing includes
  drm: Add DRM support for tiny LCD displays
  drm/tinydrm: Add helper functions
  drm/tinydrm: Add MIPI DBI support
  of: Add vendor prefix for Multi-Inno
  dt-bindings: Add Multi-Inno MI0283QT binding
  drm/tinydrm: Add support for Multi-Inno MI0283QT display

 .../bindings/display/multi-inno,mi0283qt.txt       |   27 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 Documentation/gpu/drm-kms-helpers.rst              |   33 +
 MAINTAINERS                                        |   13 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/drm_debugfs.c                      |   17 +-
 drivers/gpu/drm/drm_fb_cma_helper.c                |   18 +
 drivers/gpu/drm/tinydrm/Kconfig                    |   19 +
 drivers/gpu/drm/tinydrm/Makefile                   |    7 +
 drivers/gpu/drm/tinydrm/core/Makefile              |    3 +
 drivers/gpu/drm/tinydrm/core/tinydrm-core.c        |  374 ++++++++
 drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c     |  490 ++++++++++
 drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c        |  244 +++++
 drivers/gpu/drm/tinydrm/mi0283qt.c                 |  279 ++++++
 drivers/gpu/drm/tinydrm/mipi-dbi.c                 | 1005 ++++++++++++++++++++
 include/drm/drm_fb_cma_helper.h                    |    2 +
 include/drm/drm_simple_kms_helper.h                |    4 +
 include/drm/tinydrm/ili9341.h                      |   54 ++
 include/drm/tinydrm/mipi-dbi.h                     |  107 +++
 include/drm/tinydrm/tinydrm-helpers.h              |  100 ++
 include/drm/tinydrm/tinydrm.h                      |  115 +++
 22 files changed, 2913 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
 create mode 100644 drivers/gpu/drm/tinydrm/Kconfig
 create mode 100644 drivers/gpu/drm/tinydrm/Makefile
 create mode 100644 drivers/gpu/drm/tinydrm/core/Makefile
 create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-core.c
 create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c
 create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
 create mode 100644 drivers/gpu/drm/tinydrm/mi0283qt.c
 create mode 100644 drivers/gpu/drm/tinydrm/mipi-dbi.c
 create mode 100644 include/drm/tinydrm/ili9341.h
 create mode 100644 include/drm/tinydrm/mipi-dbi.h
 create mode 100644 include/drm/tinydrm/tinydrm-helpers.h
 create mode 100644 include/drm/tinydrm/tinydrm.h

--
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
