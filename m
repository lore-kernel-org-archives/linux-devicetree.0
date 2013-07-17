From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch v2] spi/xilinx: signedness issue checking platform_get_irq()
Date: Wed, 17 Jul 2013 18:34:48 +0300
Message-ID: <20130717153448.GA963@elgon.mountain>
References: <20130717150538.GT22506@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130717150538.GT22506@sirena.org.uk>
Sender: kernel-janitors-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-spi@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In xilinx_spi_probe() we use xspi->irq to store negative error codes so
it has to be signed.  We weren't going to use the upper bit any way so
this is fine.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  The first version introduced an ugly cast.  Sorry for that.

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index fea815c..0f4a093 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -82,7 +82,7 @@ struct xilinx_spi {
 	struct completion done;
 	void __iomem	*regs;	/* virt. address of the control registers */
 
-	u32		irq;
+	int		irq;
 
 	u8 *rx_ptr;		/* pointer in the Tx buffer */
 	const u8 *tx_ptr;	/* pointer in the Rx buffer */
