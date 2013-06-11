From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/4] exynos5250/hdmi: modify driver and arch data towards CCF
 migration
Date: Tue, 11 Jun 2013 12:24:01 +0530
Message-ID: <1370933645-18344-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

After switching to CCF, driver and device tree nodes are required
to be update with clock information. This set includes those changes.

After these patches, the only missing portion is hdmiphy power control
which is posted independently. Together, basic hdmi is working for
exynos5250.

Rahul Sharma (2):
  drm/exynos: add mout_hdmi clock in hdmi driver to change parent
  ARM/dts: add clocks to hdmi dt node for exynos5250

Sean Paul (2):
  drm/exynos: Prepare/Unprepare HDMI subsystem clocks
  ARM: dts: Add mixer clocks to mixer node

 arch/arm/boot/dts/exynos5250.dtsi     |    8 ++++---
 drivers/gpu/drm/exynos/exynos_hdmi.c  |   38 +++++++++++++++++++--------------
 drivers/gpu/drm/exynos/exynos_mixer.c |   12 +++++------
 3 files changed, 33 insertions(+), 25 deletions(-)

-- 
1.7.10.4
