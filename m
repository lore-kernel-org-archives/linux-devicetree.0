From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/2] Add basic device tree support for Samsung's Exynos4210
 platform
Date: Sun, 17 Jul 2011 10:28:18 +0530
Message-ID: <1310878700-1507-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds a basic device tree based boot for Samsung's Exynos4
platforms and specifically for smdkv310 board. Device tree based driver
probe is added for sdhci and watchdog drivers.

This patch series is based on
git.secretlab.ca/git/linux-2.6.git devicetree/test

and depends on the following patches which are not yet available in
the devicetree/test branch.

1. [PATCH] ARM: EXYNOS4: Fix card detection for sdhci 0 and 2
[http://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg04704.html]

2. [PATCH] ARM: EXYNOS4: Fix missing S5P_VA_AUDSS definition
[http://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg04866.html]

3. [PATCH 0/9] Add clkdev support for Samsung platforms
[http://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg04874.html]

4. Consolidate the clkdev header files
[http://patchwork.ozlabs.org/patch/97862/]

Changes since v1:
* Addressed all comments from Grant Likely
  - Moved sdhci platform data as properties in dts file
  - Add relevant comments in the machine file.

Thomas Abraham (2):
  arm: dts: Add nodes in smdkv310 device tree source file
  arm: exynos4: Add a new Exynos4 device tree enabled machine

 Documentation/devicetree/bindings/arm/samsung.txt |   11 +-
 arch/arm/boot/dts/exynos4-smdkv310.dts            |   61 +++++++++++-
 arch/arm/mach-exynos4/Kconfig                     |   10 ++
 arch/arm/mach-exynos4/Makefile                    |    1 +
 arch/arm/mach-exynos4/mach-exynos4-dt.c           |  112 +++++++++++++++++++++
 5 files changed, 187 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/mach-exynos4-dt.c
