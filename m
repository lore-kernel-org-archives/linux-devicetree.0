From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/5] make sdhci device drivers self registered
Date: Mon, 21 Mar 2011 16:06:58 +0800
Message-ID: <1300694823-8300-1-git-send-email-shawn.guo@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-mmc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, sameo@linux.intel.com, grant.likely@secretlab.ca
List-Id: devicetree@vger.kernel.org

This patch set is to take sdhci device driver specific things out
from sdhci-pltfm.c and make them self registered. Here are the
differences it makes.

 * Get the sdhci device driver follow the Linux trend that driver
   take the registration by its own
 * sdhci-pltfm.c becomes significantly simpler and only has common
   support functions there
 * All sdhci device specific stuff are going back its own driver
 * The dt and non-dt support share the same pair of .probe and
   .remove hooks.

The first one patch adds common support function into sdhci-pltfm.c
when changing sdhci-esdhc-imx driver, while the last one cleans up
sdhci-pltfm.c when changing sdhci-tegra driver.

Only the patch of sdhci-esdhc-imx are tested on hardware, and others
are just build tested.  And it is based on the tree below.

  git://git.secretlab.ca/git/linux-2.6.git devicetree/test

Comments are welcomed and appreciated.

Regards,
Shawn

Shawn Guo (5):
      mmc: sdhci: make sdhci-esdhc-imx driver self registered
      mmc: sdhci: make sdhci-cns3xxx driver self registered
      mmc: sdhci: make sdhci-dove driver self registered
      mmc: sdhci: make sdhci-tegra driver self registered
      mmc: sdhci: update Makefile/Kconfig for sdhci_pltfm change

 drivers/mmc/host/Kconfig           |   24 +++--
 drivers/mmc/host/Makefile          |   11 +-
 drivers/mmc/host/sdhci-cns3xxx.c   |   68 +++++++++++++-
 drivers/mmc/host/sdhci-dove.c      |   70 +++++++++++++-
 drivers/mmc/host/sdhci-esdhc-imx.c |   98 +++++++++++++++----
 drivers/mmc/host/sdhci-pltfm.c     |  165 ++-----------------------------
 drivers/mmc/host/sdhci-pltfm.h     |   14 ++-
 drivers/mmc/host/sdhci-tegra.c     |  189 +++++++++++++++++++++---------------
