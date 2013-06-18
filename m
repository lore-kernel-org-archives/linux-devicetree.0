From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/4] exynos5420/hdmi: add support for hdmi subsystem
Date: Tue, 18 Jun 2013 18:19:34 +0530
Message-ID: <1371559778-9359-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

Add support for exynos5420 hdmi subsystem. It adds compatible strings
for exynos5420 mixer and Changes the drivers as per IP modifications.

This set doesn't have changes for hdmiphy, which will posted
independently.

This set is based on drm-next branch of Inki Dae's tree at
http://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git.

Rahul Sharma (4):
  drm/exynos: rename compatible strings for hdmi subsystem
  drm/exynos: add support for exynos5420 mixer
  drm/exynos: fix interlace resolutions for exynos5420
  ARM/dts: change compatible strings for hdmi subsystem

 .../devicetree/bindings/video/exynos_hdmi.txt      |    6 +-
 .../devicetree/bindings/video/exynos_hdmiddc.txt   |    4 +-
 .../devicetree/bindings/video/exynos_hdmiphy.txt   |    6 +-
 .../devicetree/bindings/video/exynos_mixer.txt     |    7 ++-
 arch/arm/boot/dts/cros5250-common.dtsi             |    4 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |    4 +-
 drivers/gpu/drm/exynos/exynos_ddc.c                |    2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   16 ++---
 drivers/gpu/drm/exynos/exynos_hdmiphy.c            |    4 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |   61 ++++++++++++++------
 drivers/gpu/drm/exynos/regs-mixer.h                |    7 +++
 12 files changed, 84 insertions(+), 41 deletions(-)

-- 
1.7.10.4
