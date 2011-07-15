From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/3] Add basic device tree support for Samsung's Exynos4210
	platform
Date: Fri, 15 Jul 2011 17:12:05 +0530
Message-ID: <1310730128-4243-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds a basic device tree based boot for Samsung's Exynos4210
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

Thomas Abraham (3):
  mmc: sdhci-s3c: Add support for device tree based probe
  arm: dts: Add nodes in smdkv310 device tree source file
  arm: exynos4: Add a new Exynos4210 device tree enabled machine

 Documentation/devicetree/bindings/arm/samsung.txt  |   10 +-
 .../devicetree/bindings/mmc/samsung-s3c-sdhci.txt  |   10 ++
 arch/arm/boot/dts/exynos4-smdkv310.dts             |   55 ++++++++-
 arch/arm/mach-exynos4/Kconfig                      |   10 ++
 arch/arm/mach-exynos4/Makefile                     |    1 +
 arch/arm/mach-exynos4210-dt.c                      |  128 ++++++++++++++++++++
 drivers/mmc/host/sdhci-s3c.c                       |   11 ++
 7 files changed, 218 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/samsung-s3c-sdhci.txt
