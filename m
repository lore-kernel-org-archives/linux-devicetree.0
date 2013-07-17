From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] spi/xilinx: signedness issue checking platform_get_irq()
Date: Wed, 17 Jul 2013 15:26:38 +0300
Message-ID: <20130717122638.GB4851@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-spi@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

"xspi->irq" is unsigned int so it's never less than zero.  I have added
a cast.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index fea815c..e5201fb 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -442,7 +442,7 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 	xspi_init_hw(xspi);
 
 	xspi->irq = platform_get_irq(pdev, 0);
-	if (xspi->irq < 0) {
+	if ((int)xspi->irq < 0) {
 		ret = xspi->irq;
 		goto put_master;
 	}
