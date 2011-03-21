From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/5] make sdhci device drivers self registered
Date: Mon, 21 Mar 2011 11:42:13 +0800
Message-ID: <1300678938-8046-1-git-send-email-shawn.guo@linaro.org>
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
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set is to take sdhci device driver specific things out
from sdhci-pltfm.c and make them self registered. Here are the
difference it makes.

 * Get the sdhci device driver follow the Linux trend that driver
   take the registration by its own
 * sdhci-pltfm.c becomes significantly simpler and only has common
   support functions there
 * All sdhci device specific stuff are going back its own driver
 * The dt and non-dt support share the same pair of .probe and
   .remove hooks.

The first one patch adds common support function into sdhci-pltfm.c
when changing sdhci-esdhc-imx driver, while the last one clean up
sdhci-pltfm.c when changing sdhci-tegra driver.

Only the patch of sdhci-esdhc-imx are tested on hardware, and others
are just build tested.

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
