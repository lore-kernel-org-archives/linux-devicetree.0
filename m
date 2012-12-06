From: "R. Chandrasekar" <rcsekar@samsung.com>
Subject: [PATCH 0/3] add mie driver for exynos
Date: Thu, 06 Dec 2012 17:38:12 +0530
Message-ID: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, joshi@samsung.com, rcsekar.samsung@gmail.com, rcsekar@samsung.com
List-Id: devicetree@vger.kernel.org

From: "R. Chandrasekar" <rcsekar@samsung.com>

this patch set adds the driver support for the dithering functionality of the
mobile image enhancement (mie) module.
 
device tree support is added for mie.

fimd adds the mie module as plugin and calls the dithering function. dithere is
required when the panels bpp is less then fimd output.
 
though mie mie has other functionalities, current system uses only dithereing.

R. Chandrasekar (3):
  DTS: exynos: add device tree support for exynos mie
  drm: fimd: add mie plugin support for dithering
  drm: mie: add mie driver for exynos

 arch/arm/boot/dts/exynos5250.dtsi               |    7 +-
 drivers/gpu/drm/exynos/Kconfig                  |    7 +
 drivers/gpu/drm/exynos/Makefile                 |    1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c        |   58 +++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h |   20 ++
 drivers/gpu/drm/exynos/exynos_drm_mie.c         |  250 +++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_mie.h         |   50 +++++
 drivers/gpu/drm/exynos/exynos_regs-mie.h        |   75 +++++++
 8 files changed, 465 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_regs-mie.h

-- 
1.7.9.5
