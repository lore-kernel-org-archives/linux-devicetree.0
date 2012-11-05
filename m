From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/5] add dt based support for iommu for hdmi
Date: Mon, 05 Nov 2012 13:01:20 +0530
Message-ID: <1352100685-7695-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com
List-Id: devicetree@vger.kernel.org

This patchset enables the DT based iommu support for exynos5 platform
and iommu for drm hdmi driver. it
1) Adds iommu support for Exynos5250_DT platform.
2) Enables helper functions for dt platforms
3) Adds support for TV Iommu device for hdmi

based on "for-next" branch at
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git

Rahul Sharma (5):
  arm: exynos5: add tv iommu device to aux data lookup table
  arm: exynos5: add clock information for tv iommu device
  dts: exynos5: add dt node for tv iommu device
  arm: exynos5: add iommu support for exynos5250_DT platform
  arm: exynos: enable helper functions for dt based platforms

 arch/arm/boot/dts/exynos5250.dtsi          |   10 ++++++++++
 arch/arm/mach-exynos/Kconfig               |    1 +
 arch/arm/mach-exynos/clock-exynos5.c       |    4 ++--
 arch/arm/mach-exynos/include/mach/sysmmu.h |    9 +++++----
 arch/arm/mach-exynos/mach-exynos5-dt.c     |    2 ++
 5 files changed, 20 insertions(+), 6 deletions(-)
