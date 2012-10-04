From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/8] arm: exynos: add dt based support for exynos5 hdmi
Date: Thu, 04 Oct 2012 21:44:20 +0530
Message-ID: <1349367268-32553-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, fahad.k@samsung.com, l.krishna@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com
List-Id: devicetree@vger.kernel.org

This patch set adds the DT based support for Samsung's Exynos5250. It adds
device tree nodes for hdmi, mixer, hdmiphy and hdmiddc. The name of these
devices are changed to the one matching with drivers. Exynos-drm and exynos
hdmi-drm-commmon devices are added as paltform devices. Apart from that hpd
gpio function is configured during the machine init.

This patchset is based on linux v3.6-rc5, branch dt-samsung-new at
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Rahul Sharma (8):
  dts: exynos: add device tree support for exynos5 hdmi
  dts: exynos: add device tree support for exynos5 mixer
  dts: exynos: add device tree support for exynos5 hdmiphy
  dts: exynos: add device tree support for exynos5 hdmiddc
  arm: exynos: add clocks for exynos5 hdmi
  arm: exynos: config exynos5 hdmi-hpd gpio
  arm: exynos: add exynos5 drm framework platform device
  arm: exynos: add exynos5 drm-hdmi common platform device

 arch/arm/boot/dts/exynos5250-smdk5250.dts |   24 +++++++++++++++++++++++-
 arch/arm/boot/dts/exynos5250.dtsi         |   23 +++++++++++++++++++++++
 arch/arm/mach-exynos/clock-exynos5.c      |   14 ++++++++++++--
 arch/arm/mach-exynos/dev-drm.c            |    5 +++++
 arch/arm/mach-exynos/include/mach/map.h   |    2 ++
 arch/arm/mach-exynos/mach-exynos5-dt.c    |   24 ++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |    1 +
 7 files changed, 90 insertions(+), 3 deletions(-)
