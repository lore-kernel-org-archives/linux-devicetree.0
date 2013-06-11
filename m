From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/9] exynos5420/hdmi: add support for hdmi subsystem
Date: Tue, 11 Jun 2013 19:41:22 +0530
Message-ID: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

Add support for exynos5420 hdmi subsystem. It adds compatible strings
for exynos5420 and Changes the drivers as per IP modifications.

This set is based on drm-next branch of Inki Dae's tree at
http://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git.

Rahul Sharma (9):
  drm/exynos: use SoC name to identify hdmi version
  drm/exynos: rename compatible strings for hdmi subsystem
  drm/exynos: add support for exynos5420 hdmi
  drm/exynos: add support for exynos5420 hdmiphy
  drm/exynos: add support for exynos5420 mixer
  drm/exynos: fix interlace resolutions for exynos5420
  drm/exynos: use of_get_named_gpio to get hdmi hpd gpio
  ARM/dts: add phy property to exynos5250 hdmi dt node
  ARM/dts: update device tree binding documentation for hdmi susbsystem

 .../devicetree/bindings/video/exynos_hdmi.txt      |   25 +-
 .../devicetree/bindings/video/exynos_hdmiddc.txt   |    4 +-
 .../devicetree/bindings/video/exynos_hdmiphy.txt   |   12 +-
 .../devicetree/bindings/video/exynos_mixer.txt     |   14 +-
 arch/arm/boot/dts/cros5250-common.dtsi             |    4 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    7 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |    4 +-
 drivers/gpu/drm/exynos/exynos_ddc.c                |    2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  544 ++++++++++++++------
 drivers/gpu/drm/exynos/exynos_hdmiphy.c            |    2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |   61 ++-
 drivers/gpu/drm/exynos/regs-hdmi.h                 |   78 +--
 drivers/gpu/drm/exynos/regs-mixer.h                |    7 +
 13 files changed, 526 insertions(+), 238 deletions(-)

-- 
1.7.10.4
