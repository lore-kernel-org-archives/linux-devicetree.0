From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v3 0/2] Add device tree and clock support for Gscaler.
Date: Fri, 20 Jul 2012 18:38:41 +0530
Message-ID: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, shaik.samsung@gmail.com, shaik.ameer@samsung.com
List-Id: devicetree@vger.kernel.org

This patch series adds clock support for Gscaler and device node
 entries for Gscaler on exynos5.

This patch is based on Kukjin Kim's (linux-samsung) for-next branch.
    https://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

changes since v2:
- Addressed review comments from Sylwester Nawrocki
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11372.html
- Addressed review comments from Kukjin Kim and Sunyoung Kang
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11377.html
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11429.html

Shaik Ameer Basha (2):
  ARM: EXYNOS: Add clock support for Gscaler
  ARM: EXYNOS: Add Gscaler device from DT

 .../devicetree/bindings/media/exynos5-gsc.txt      |   32 ++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   28 ++++++
 arch/arm/mach-exynos/clock-exynos5.c               |  100 ++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h            |    3 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 ++
 5 files changed, 171 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt
