From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v3] Add MFC device tree support
Date: Fri, 14 Sep 2012 21:08:16 +0530
Message-ID: <1347637097-15015-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, k.lewandowsk@samsung.com, s.nawrocki@samsung.com, ch.naveen@samsung.com, arun.kk@samsung.com, joshi@samsung.com
List-Id: devicetree@vger.kernel.org

This patch adds the device tree entries for MFC on Exynos5.
This is rebased to the linux-samsung for-next branch.

Changelog v3
- Addressed review comments given by Sylwester Nawrocki
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg12340.html

Changelog v2
- Use fdt functions to parse dtsi file for mfc memory info

Changelog v1
- Moved board specific DT information to different dtsi file
- Changed compatible name for the device
- Addressed other review comments

Arun Kumar K (1):
  ARM: EXYNOS: Add MFC device tree support

 .../devicetree/bindings/media/s5p-mfc.txt          |   27 ++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    7 +++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
 arch/arm/mach-exynos/mach-exynos5-dt.c             |   55 ++++++++++++++++++++
 6 files changed, 97 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
