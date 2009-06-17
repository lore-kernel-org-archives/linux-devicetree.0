From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2] sdhci: Add support for hosts that are only capable of
	1-bit transfers
Date: Thu, 18 Jun 2009 00:14:08 +0400
Message-ID: <20090617201408.GA17909@oksana.dev.rtsoft.ru>
References: <20090611201545.GA15942@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090611201545.GA15942-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
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
driver, so that now it looks for "sdhci,1-bit-only" property in the
device-tree, and if specified we enable a proper quirk.

Signed-off-by: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
---

Pierre,

As promised, here is a version with a quirk.
Also incorporated suggestions by Grant Likely.


Thanks,

 Documentation/powerpc/dts-bindings/fsl/esdhc.txt |    2 ++
 drivers/mmc/host/sdhci-of.c                      |    3 +++
 drivers/mmc/host/sdhci.c                         |    5 ++++-
 drivers/mmc/host/sdhci.h                         |    2 ++
 4 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/Documentation/powerpc/dts-bindings/fsl/esdhc.txt b/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
index 5093ddf..3ed3797 100644
--- a/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
+++ b/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
@@ -10,6 +10,8 @@ Required properties:
   - interrupts : should contain eSDHC interrupt.
   - interrupt-parent : interrupt source phandle.
   - clock-frequency : specifies eSDHC base clock frequency.
+  - sdhci,1-bit-only : (optional) specifies that a controller can
+    only handle 1-bit data transfers.
 
 Example:
 
diff --git a/drivers/mmc/host/sdhci-of.c b/drivers/mmc/host/sdhci-of.c
index 09cc597..dd65f84 100644
--- a/drivers/mmc/host/sdhci-of.c
+++ b/drivers/mmc/host/sdhci-of.c
@@ -244,6 +244,9 @@ static int __devinit sdhci_of_probe(struct of_device *ofdev,
 		host->ops = &sdhci_of_data->ops;
 	}
 
+	if (of_get_property(np, "sdhci,1-bit-only", NULL))
+		host->quirks |= SDHCI_QUIRK_FORCE_1_BIT_DATA;
+
 	clk = of_get_property(np, "clock-frequency", &size);
 	if (clk && size == sizeof(*clk) && *clk)
 		of_host->clock = *clk;
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 9234be2..f28f94a 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -1721,7 +1721,10 @@ int sdhci_add_host(struct sdhci_host *host)
 	mmc->ops = &sdhci_ops;
 	mmc->f_min = host->max_clk / 256;
 	mmc->f_max = host->max_clk;
-	mmc->caps = MMC_CAP_4_BIT_DATA | MMC_CAP_SDIO_IRQ;
+	mmc->caps = MMC_CAP_SDIO_IRQ;
+
+	if (!(host->quirks & SDHCI_QUIRK_FORCE_1_BIT_DATA))
+		mmc->caps |= MMC_CAP_4_BIT_DATA;
 
 	if (caps & SDHCI_CAN_DO_HISPD)
 		mmc->caps |= MMC_CAP_SD_HIGHSPEED;
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index 65c6f99..834f877 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -226,6 +226,8 @@ struct sdhci_host {
 #define SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET		(1<<19)
 /* Controller has to be forced to use block size of 2048 bytes */
 #define SDHCI_QUIRK_FORCE_BLK_SZ_2048			(1<<20)
+/* Controller can only handle 1-bit data transfers */
+#define SDHCI_QUIRK_FORCE_1_BIT_DATA			(1<<21)
 
 	int			irq;		/* Device IRQ */
 	void __iomem *		ioaddr;		/* Mapped address */
-- 
1.6.3.1
