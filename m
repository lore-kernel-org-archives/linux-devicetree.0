From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v2 0/2] Add device tree and clock support for Gscaler.
Date: Wed, 11 Jul 2012 19:36:48 +0530
Message-ID: <1342015610-19261-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, ameersk@gmail.com
List-Id: devicetree@vger.kernel.org

This patch series adds clock support for Gscaler and device node
 entries for Gscaler on exynos5.

This patch is based on Kukjin Kim's (linux-samsung) for-next branch.
    https://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

changes since v1:
- Addressed review comments from Sylwester Nawrocki
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11177.html
- Addressed review comments from Sachin Kamat
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11176.html
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11178.html
 

Shaik Ameer Basha (2):
  ARM: EXYNOS: Add clock support for Gscaler
  ARM: EXYNOS: Add gscaler device from DT

 .../devicetree/bindings/media/exynos5-gsc.txt      |   16 ++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   31 ++++++++
 arch/arm/mach-exynos/clock-exynos5.c               |   79 ++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h            |    3 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 ++
 5 files changed, 137 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt
