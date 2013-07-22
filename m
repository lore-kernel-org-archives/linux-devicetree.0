From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 0/3] device tree support for exynos rotator
Date: Mon, 22 Jul 2013 15:49:24 +0900
Message-ID: <1374475767-30085-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: inki.dae@samsung.com, kgene.kim@samsung.com
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Chanho Park <chanho61.park@samsung.com>
List-Id: devicetree@vger.kernel.org

This patchset includes dt support for exynos rotator.
The exynos4 platform is only dt-based since 3.10, we should convert driver data
and ids to dt-based parsing methods. The rotator driver has a limit table to
get size limit. The minimum size of RGB888 format is 8 x 8 and maximum size is
8K x 8K. The other format, YCbCr420 2-Plane has 32 x 32 min size and 32K x 32K
max size. Each format should be multiple of 'align' value.

Chanho Park (3):
  drm/exynos: add device tree support for rotator
  drm/exynos: add dt-binding documentation for rotator
  dts: ARM: add a rotator node for exynos4

 .../bindings/drm/exynos/samsung-rotator.txt        |   35 +++++++
 arch/arm/boot/dts/exynos4.dtsi                     |   23 ++++
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |  110 ++++++++++++++------
 3 files changed, 138 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt

-- 
1.7.9.5
