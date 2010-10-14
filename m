From: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
Subject: [PATCH 1/1] spi: initialize of_node in spi_alloc_master
Date: Thu, 14 Oct 2010 10:37:41 +0200
Message-ID: <1287045461-20470-1-git-send-email-jonas@southpole.se>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

spi_alloc_master should do the work of setting the of_node on the device if
it is set on the incoming parent.

Signed-off-by: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
---
 drivers/spi/mpc512x_psc_spi.c |    1 -
 drivers/spi/mpc52xx_psc_spi.c |    1 -
 drivers/spi/mpc52xx_spi.c     |    1 -
 drivers/spi/spi.c             |    3 +++
 drivers/spi/spi_mpc8xxx.c     |    1 -
 drivers/spi/spi_ppc4xx.c      |    1 -
 drivers/spi/xilinx_spi.c      |    3 ---
 7 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/mpc512x_psc_spi.c b/drivers/spi/mpc512x_psc_spi.c
index 77d9e7e..1ab1807 100644
--- a/drivers/spi/mpc512x_psc_spi.c
+++ b/drivers/spi/mpc512x_psc_spi.c
@@ -441,7 +441,6 @@ static int __devinit mpc512x_psc_spi_do_probe(struct device *dev, u32 regaddr,
 	master->setup = mpc512x_psc_spi_setup;
 	master->transfer = mpc512x_psc_spi_transfer;
 	master->cleanup = mpc512x_psc_spi_cleanup;
-	master->dev.of_node = dev->of_node;
 
 	tempp = ioremap(regaddr, size);
 	if (!tempp) {
diff --git a/drivers/spi/mpc52xx_psc_spi.c b/drivers/spi/mpc52xx_psc_spi.c
index 983fbbf..44077f8 100644
--- a/drivers/spi/mpc52xx_psc_spi.c
+++ b/drivers/spi/mpc52xx_psc_spi.c
@@ -398,7 +398,6 @@ static int __init mpc52xx_psc_spi_do_probe(struct device *dev, u32 regaddr,
 	master->setup = mpc52xx_psc_spi_setup;
 	master->transfer = mpc52xx_psc_spi_transfer;
 	master->cleanup = mpc52xx_psc_spi_cleanup;
-	master->dev.of_node = dev->of_node;
 
 	mps->psc = ioremap(regaddr, size);
 	if (!mps->psc) {
diff --git a/drivers/spi/mpc52xx_spi.c b/drivers/spi/mpc52xx_spi.c
index ec9f0b1..b46dbd0 100644
--- a/drivers/spi/mpc52xx_spi.c
+++ b/drivers/spi/mpc52xx_spi.c
@@ -438,7 +438,6 @@ static int __devinit mpc52xx_spi_probe(struct platform_device *op,
 	master->setup = mpc52xx_spi_setup;
 	master->transfer = mpc52xx_spi_transfer;
 	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST;
-	master->dev.of_node = op->dev.of_node;
 
 	dev_set_drvdata(&op->dev, master);
 
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index b5a78a1..28f9d1a 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -482,6 +482,9 @@ struct spi_master *spi_alloc_master(struct device *dev, unsigned size)
 	device_initialize(&master->dev);
 	master->dev.class = &spi_master_class;
 	master->dev.parent = get_device(dev);
+#ifdef CONFIG_OF
+	master->dev.of_node = dev->of_node;
+#endif
 	spi_master_set_devdata(master, &master[1]);
 
 	return master;
diff --git a/drivers/spi/spi_mpc8xxx.c b/drivers/spi/spi_mpc8xxx.c
index 1dd86b8..5a35741 100644
--- a/drivers/spi/spi_mpc8xxx.c
+++ b/drivers/spi/spi_mpc8xxx.c
@@ -1014,7 +1014,6 @@ mpc8xxx_spi_probe(struct device *dev, struct resource *mem, unsigned int irq)
 	master->setup = mpc8xxx_spi_setup;
 	master->transfer = mpc8xxx_spi_transfer;
 	master->cleanup = mpc8xxx_spi_cleanup;
-	master->dev.of_node = dev->of_node;
 
 	mpc8xxx_spi = spi_master_get_devdata(master);
 	mpc8xxx_spi->dev = dev;
diff --git a/drivers/spi/spi_ppc4xx.c b/drivers/spi/spi_ppc4xx.c
index 80e172d..ca18432 100644
--- a/drivers/spi/spi_ppc4xx.c
+++ b/drivers/spi/spi_ppc4xx.c
@@ -407,7 +407,6 @@ static int __init spi_ppc4xx_of_probe(struct platform_device *op,
 	master = spi_alloc_master(dev, sizeof *hw);
 	if (master == NULL)
 		return -ENOMEM;
-	master->dev.of_node = np;
 	dev_set_drvdata(dev, master);
 	hw = spi_master_get_devdata(master);
 	hw->master = spi_master_get(master);
diff --git a/drivers/spi/xilinx_spi.c b/drivers/spi/xilinx_spi.c
index 80f2db5..1b47363 100644
--- a/drivers/spi/xilinx_spi.c
+++ b/drivers/spi/xilinx_spi.c
@@ -390,9 +390,6 @@ struct spi_master *xilinx_spi_init(struct device *dev, struct resource *mem,
 
 	master->bus_num = bus_num;
 	master->num_chipselect = pdata->num_chipselect;
-#ifdef CONFIG_OF
-	master->dev.of_node = dev->of_node;
-#endif
 
 	xspi->mem = *mem;
 	xspi->irq = irq;
-- 
1.7.1
