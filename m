From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Subject: [PATCH] sdhci: Add support for hosts that are only capable of
	1-bit transfers
Date: Fri, 12 Jun 2009 00:15:45 +0400
Message-ID: <20090611201545.GA15942@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Pierre Ossman <pierre-vCPtPcF4ZGuHXe+LvDLADg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, sdhci-devel-qjLDD68F18NoYZYVwN2jqg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some hosts (hardware configurations, or particular SD/MMC slots) may
not support 4-bit bus. For example, on MPC8569E-MDS boards we can
switch between serial (1-bit only) and nibble (4-bit) modes, thought
we have to disable more peripherals to work in 4-bit mode.

Along with some small core changes, this patch modifies sdhci-of
driver, so that now it looks for "mode" property in the device-tree.

Signed-off-by: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
---

Pierre, I'm not sure if a quirk would be appropriate here. If so,
I can redo the patch with FORCE_1_BIT_DATA quirk.

Thanks,

 Documentation/powerpc/dts-bindings/fsl/esdhc.txt |    2 ++
 drivers/mmc/host/sdhci-of.c                      |    7 +++++++
 drivers/mmc/host/sdhci-pci.c                     |    1 +
 drivers/mmc/host/sdhci.c                         |    2 +-
 4 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/Documentation/powerpc/dts-bindings/fsl/esdhc.txt b/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
index 5093ddf..298b865 100644
--- a/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
+++ b/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
@@ -10,6 +10,8 @@ Required properties:
   - interrupts : should contain eSDHC interrupt.
   - interrupt-parent : interrupt source phandle.
   - clock-frequency : specifies eSDHC base clock frequency.
+  - mode : specifies eSDHC mode, valid values are: "1-bit" and "4-bit".
+    If mode is unspecified, then 4-bit mode is assumed.
 
 Example:
 
diff --git a/drivers/mmc/host/sdhci-of.c b/drivers/mmc/host/sdhci-of.c
index 09cc597..12b9615 100644
--- a/drivers/mmc/host/sdhci-of.c
+++ b/drivers/mmc/host/sdhci-of.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/string.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
@@ -212,6 +213,7 @@ static int __devinit sdhci_of_probe(struct of_device *ofdev,
 	struct sdhci_of_data *sdhci_of_data = match->data;
 	struct sdhci_host *host;
 	struct sdhci_of_host *of_host;
+	const char *mode;
 	const u32 *clk;
 	int size;
 	int ret;
@@ -244,6 +246,11 @@ static int __devinit sdhci_of_probe(struct of_device *ofdev,
 		host->ops = &sdhci_of_data->ops;
 	}
 
+	mode = of_get_property(np, "mode", &size);
+	if (!mode || (size == sizeof("4-bit") &&
+			!strncmp(mode, "4-bit", size)))
+		host->mmc->caps |= MMC_CAP_4_BIT_DATA;
+
 	clk = of_get_property(np, "clock-frequency", &size);
 	if (clk && size == sizeof(*clk) && *clk)
 		of_host->clock = *clk;
diff --git a/drivers/mmc/host/sdhci-pci.c b/drivers/mmc/host/sdhci-pci.c
index 65be279..c447d6c 100644
--- a/drivers/mmc/host/sdhci-pci.c
+++ b/drivers/mmc/host/sdhci-pci.c
@@ -535,6 +535,7 @@ static struct sdhci_pci_slot * __devinit sdhci_pci_probe_slot(
 	host->hw_name = "PCI";
 	host->ops = &sdhci_pci_ops;
 	host->quirks = chip->quirks;
+	host->mmc->caps = MMC_CAP_4_BIT_DATA;
 
 	host->irq = pdev->irq;
 
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 9234be2..e31dd2a 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -1721,7 +1721,7 @@ int sdhci_add_host(struct sdhci_host *host)
 	mmc->ops = &sdhci_ops;
 	mmc->f_min = host->max_clk / 256;
 	mmc->f_max = host->max_clk;
-	mmc->caps = MMC_CAP_4_BIT_DATA | MMC_CAP_SDIO_IRQ;
+	mmc->caps |= MMC_CAP_SDIO_IRQ;
 
 	if (caps & SDHCI_CAN_DO_HISPD)
 		mmc->caps |= MMC_CAP_SD_HIGHSPEED;
-- 
1.6.3.1
