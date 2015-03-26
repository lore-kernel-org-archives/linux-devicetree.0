From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/8] Add drivers for Exynos5433 display
Date: Thu, 26 Mar 2015 20:15:32 +0900
Message-ID: <1427368540-28010-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org
Cc: sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset is based on the git(branch name: exynos-drm-next) which is
maintained by Inki Dae.
https://kernel.googlesource.com/pub/scm/linux/kernel/git/...

This patchset adds 2 new device drivers, decon and mic, and adds support for
Exynos5433 mipi dsi. To enable display in a Exynos5433 board, decon(display
controller), MIC(Mobile image compressor), mipi dsi, and panel have to be turned
on. This patchset contains support for 3 drivers for SoC level devices.

Changes for v2:
- change config, file, and variable names of decon to represnt exynos5433
instead of exynos to distinguish them from exynos7 decon
- change the initialization order of decon to make it initialized in order like
FIMD or exynos7 decon
- make mic driver to be registered by exynos drm driver instead as a module
driver
- change the description of mic driver in documentation
- add module author at the top of the source file removing MODULE_OWNER,
MODULE_DESCRIPTION, MODULE_LICENSE
- change the author of "drm/exynos: dsi: add support for Exynos5433 SoC" to
Hyungwon Hwang by the previous author's will

Changes for v3:
< Decon >
 - fail fast when the proper image format is not set
 - remove unnecessary checking code
 - add and modify the function to make DPMS work well
< MIC >
 - move if statement out of function, so that the function is not called
 unnecessarily
 - Make it use syscon framework for controlling system register
< DSI >
 - separate the previous one patch to three
   - renaming patch: rename pll clock to sclk clock
   - generalizing patch: generalize the way to getting address and values
   - Exynos5433 patch: adds support for Exynos5433 dsi
 - use defines for more readable code
 - fix typos

Hyungwon Hwang (7):
  of: add helper for getting endpoint node of specific identifiers
  drm/exynos: mic: add MIC driver
  drm/exynos: dsi: rename pll_clk to sclk_clk
  drm/exynos: dsi: generalize register setting and clock control
  drm/exynos: dsi: add support for Exynos5433
  drm/exynos: dsi: add support for MIC driver as a bridge
  drm/exynos: dsi: do not set TE GPIO direction by input

Joonyoung Shim (1):
  drm/exynos: add Exynos5433 decon driver

 .../devicetree/bindings/video/exynos-mic.txt       |  51 ++
 .../devicetree/bindings/video/exynos5433-decon.txt |  65 ++
 .../devicetree/bindings/video/exynos_dsim.txt      |  30 +-
 drivers/gpu/drm/exynos/Kconfig                     |  14 +-
 drivers/gpu/drm/exynos/Makefile                    |   2 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      | 665 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   6 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |   2 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 453 +++++++++-----
 drivers/gpu/drm/exynos/exynos_drm_mic.c            | 490 +++++++++++++++
 drivers/of/base.c                                  |  33 +
 include/linux/of_graph.h                           |   8 +
 include/video/exynos5433_decon.h                   | 163 +++++
 13 files changed, 1832 insertions(+), 150 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/video/exynos-mic.txt
 create mode 100644 Documentation/devicetree/bindings/video/exynos5433-decon.txt
 create mode 100644 drivers/gpu/drm/exynos/exynos5433_drm_decon.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mic.c
 create mode 100644 include/video/exynos5433_decon.h

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
