From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/7] support sdhci-esdhc-imx as an OF device
Date: Mon, 14 Mar 2011 22:25:52 +0800
Message-ID: <1300112759-3495-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set is to support sdhci-esdhc-imx as an OF device.  As
there is already powerpc based esdhc OF support, it chose to add OF
support for imx esdhc driver in a different way from what sdhci-tegra
did.  

It consolidates sdhci_pltfm_data sdhci_of_data into sdhci_data and get
sdhci-esdhc-imx work with both platform bus and OF.

The first patch is not related to imx esdhc OF support, but we need it
to fix the following show-stopper issue.

    https://bugs.launchpad.net/bugs/723159

Hi Nicolas,

The fix has already been merged by Sascha, so you may want to apply it
on Linaro tree to get rid of the problem. 

Regards,
Shawn


Richard Zhu (1):
      mx51 enchance the sd/mmc HW timing compatibility on mx51 boards.

Shawn Guo (6):
      arm/dt: add pad configurations for mx51 babbage
      mmc: make the reference to sdhci_tegra_dt_pdata conditional
      mmc: consolidate sdhci_pltfm_data and sdhci_of_data into one
      mmc: support sdhci-esdhc-imx as an OF device
      arm/dts: babbage: add device nodes for esdhc
      dt: update fsl-esdhc bindings for imx esdhc OF support

 .../devicetree/bindings/mmc/fsl-esdhc.txt          |    5 +-
 arch/arm/boot/dts/babbage.dts                      |   14 +++
 arch/arm/mach-mx5/board-dt.c                       |   94 ++++++++++++++++++++
 arch/arm/plat-mxc/include/mach/iomux-mx51.h        |   40 ++++----
 drivers/mmc/host/Kconfig                           |    7 +-
 drivers/mmc/host/Makefile                          |    3 +-
 drivers/mmc/host/sdhci-cns3xxx.c                   |    3 +-
 drivers/mmc/host/sdhci-dove.c                      |    2 +-
 drivers/mmc/host/sdhci-esdhc-imx.c                 |   19 ++--
 drivers/mmc/host/sdhci-of-core.c                   |   53 +++++++----
 drivers/mmc/host/sdhci-of-esdhc.c                  |   28 +++---
 drivers/mmc/host/sdhci-of-hlwd.c                   |   20 +++--
 drivers/mmc/host/sdhci-of.h                        |   10 +--
 drivers/mmc/host/sdhci-pltfm.c                     |   49 +++++-----
 drivers/mmc/host/sdhci-pltfm.h                     |   18 ++--
 drivers/mmc/host/sdhci-tegra.c                     |   10 +-
 drivers/mmc/host/sdhci.h                           |   15 +++
 include/linux/mmc/sdhci-pltfm.h                    |   35 -------
 18 files changed, 267 insertions(+), 158 deletions(-)
