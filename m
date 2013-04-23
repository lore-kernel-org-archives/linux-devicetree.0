From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 0/3] drm/exynos: Add device tree support for IPP driver
Date: Tue, 23 Apr 2013 13:34:35 +0200
Message-ID: <1366716878-5692-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: inki.dae@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, sw0312.kim@samsung.com, chulspro.kim@samsung.com, jaejoon.seo@samsung.com, jmock.shin@samsung.com, jy0.jeon@samsung.com, th908.kim@samsung.com, lsmin.lee@samsung.com, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi,

This small patch series adds device tree support for the DRM FIMC driver.
The binding documentation can be found in -next at Documentation/devicetree/
bindings/media/samsung-fimc.txt.

Changes since v2:
 - dropped addition of 'dev' field to struct fimc_context,
 - added more error logs and comments,
 - fixed error paths in fimc_setup_clocks() function.

Changes since v1:
 - removed devm_kfree() that got erroneously re-added in patch 2/3 during
   rebase.

Thanks,
Sylwester

Sylwester Nawrocki (3):
  drm/exynos: remove redundant devm_kfree()
  drm/exynos: rework fimc clocks handling
  drm/exynos: add device tree support for fimc ipp driver

 drivers/gpu/drm/exynos/Kconfig           |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c |  273 +++++++++++++++++-------------
 drivers/gpu/drm/exynos/regs-fimc.h       |    7 +-
 3 files changed, 157 insertions(+), 125 deletions(-)

--
1.7.9.5
