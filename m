From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 07/13] spi: sunxi: rename constants to match
 between sun4i and sun6i
Date: 13 Jun 2016 17:46:51 -0000
Message-ID: <c27d58f634daa4785e90c2716c8bb90399db3bf2.1465490774.git.hramrach@gmail.com>
References: <cover.1465490774.git.hramrach@gmail.com>
Reply-To: hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQMLUOX54MBBGXD7O5AKGQEUYGM66Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1465490774.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alison Wang <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerhard Bertelsmann <info-La43T0Mi4bH5xCKuJOYmCvaTkwRoYoCU@public.gmane.org>, Pri
List-Id: devicetree@vger.kernel.org

SUNXI_CTL_ -> SUNXI_TFR_CTL_
SUNXI_TFR_CTL_LMTF -> SUNXI_TFR_CTL_FBS
SUNXI_TFR_CTL_CS_ACTIVE_LOW -> SUNXI_TFR_CTL_SPOL
and some SUNXI_???_CTL_ -> SUNXI_CTL_
for constants migrated to different registers between sun4i and sun6i

No functional change.

Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/spi/spi-sun4i.c | 68 ++++++++++++++++++++++++-------------------------
 drivers/spi/spi-sun6i.c | 14 +++++-----
 2 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index 155d720..b7f8de1 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -28,21 +28,21 @@
 
 #define SUNXI_TXDATA_REG		0x04
 
-#define SUNXI_CTL_REG			0x08
+#define SUNXI_TFR_CTL_REG		0x08
 #define SUNXI_CTL_ENABLE		BIT(0)
 #define SUNXI_CTL_MASTER		BIT(1)
-#define SUNXI_CTL_CPHA			BIT(2)
-#define SUNXI_CTL_CPOL			BIT(3)
-#define SUNXI_CTL_CS_ACTIVE_LOW		BIT(4)
-#define SUNXI_CTL_LMTF			BIT(6)
+#define SUNXI_TFR_CTL_CPHA		BIT(2)
+#define SUNXI_TFR_CTL_CPOL		BIT(3)
+#define SUNXI_TFR_CTL_SPOL		BIT(4)
+#define SUNXI_TFR_CTL_FBS		BIT(6)
 #define SUNXI_CTL_TF_RST		BIT(8)
 #define SUNXI_CTL_RF_RST		BIT(9)
-#define SUNXI_CTL_XCH			BIT(10)
-#define SUNXI_CTL_CS_MASK		0x3000
-#define SUNXI_CTL_CS(cs)		(((cs) << 12) & SUNXI_CTL_CS_MASK)
-#define SUNXI_CTL_DHB			BIT(15)
-#define SUNXI_CTL_CS_MANUAL		BIT(16)
-#define SUNXI_CTL_CS_LEVEL		BIT(17)
+#define SUNXI_TFR_CTL_XCH		BIT(10)
+#define SUNXI_TFR_CTL_CS_MASK		0x3000
+#define SUNXI_TFR_CTL_CS(cs)		(((cs) << 12) & SUNXI_TFR_CTL_CS_MASK)
+#define SUNXI_TFR_CTL_DHB		BIT(15)
+#define SUNXI_TFR_CTL_CS_MANUAL		BIT(16)
+#define SUNXI_TFR_CTL_CS_LEVEL		BIT(17)
 #define SUNXI_CTL_TP			BIT(18)
 
 #define SUNXI_INT_CTL_REG		0x0c
@@ -135,18 +135,18 @@ static void sunxi_spi_set_cs(struct spi_device *spi, bool enable)
 	struct sunxi_spi *sspi = spi_master_get_devdata(spi->master);
 	u32 reg;
 
-	reg = sunxi_spi_read(sspi, SUNXI_CTL_REG);
+	reg = sunxi_spi_read(sspi, SUNXI_TFR_CTL_REG);
 
-	reg &= ~SUNXI_CTL_CS_MASK;
-	reg |= SUNXI_CTL_CS(spi->chip_select);
+	reg &= ~SUNXI_TFR_CTL_CS_MASK;
+	reg |= SUNXI_TFR_CTL_CS(spi->chip_select);
 
 	/* We want to control the chip select manually */
-	reg |= SUNXI_CTL_CS_MANUAL;
+	reg |= SUNXI_TFR_CTL_CS_MANUAL;
 
 	if (enable)
-		reg |= SUNXI_CTL_CS_LEVEL;
+		reg |= SUNXI_TFR_CTL_CS_LEVEL;
 	else
-		reg &= ~SUNXI_CTL_CS_LEVEL;
+		reg &= ~SUNXI_TFR_CTL_CS_LEVEL;
 
 	/*
 	 * Even though this looks irrelevant since we are supposed to
@@ -160,11 +160,11 @@ static void sunxi_spi_set_cs(struct spi_device *spi, bool enable)
 	 * low.
 	 */
 	if (spi->mode & SPI_CS_HIGH)
-		reg &= ~SUNXI_CTL_CS_ACTIVE_LOW;
+		reg &= ~SUNXI_TFR_CTL_SPOL;
 	else
-		reg |= SUNXI_CTL_CS_ACTIVE_LOW;
+		reg |= SUNXI_TFR_CTL_SPOL;
 
-	sunxi_spi_write(sspi, SUNXI_CTL_REG, reg);
+	sunxi_spi_write(sspi, SUNXI_TFR_CTL_REG, reg);
 }
 
 static size_t sunxi_spi_max_transfer_size(struct spi_device *spi)
@@ -199,10 +199,10 @@ static int sunxi_spi_transfer_one(struct spi_master *master,
 	sunxi_spi_write(sspi, SUNXI_INT_STA_REG, ~0);
 
 
-	reg = sunxi_spi_read(sspi, SUNXI_CTL_REG);
+	reg = sunxi_spi_read(sspi, SUNXI_TFR_CTL_REG);
 
 	/* Reset FIFOs */
-	sunxi_spi_write(sspi, SUNXI_CTL_REG,
+	sunxi_spi_write(sspi, SUNXI_TFR_CTL_REG,
 			reg | SUNXI_CTL_RF_RST | SUNXI_CTL_TF_RST);
 
 	/*
@@ -210,19 +210,19 @@ static int sunxi_spi_transfer_one(struct spi_master *master,
 	 * polarities, etc.
 	 */
 	if (spi->mode & SPI_CPOL)
-		reg |= SUNXI_CTL_CPOL;
+		reg |= SUNXI_TFR_CTL_CPOL;
 	else
-		reg &= ~SUNXI_CTL_CPOL;
+		reg &= ~SUNXI_TFR_CTL_CPOL;
 
 	if (spi->mode & SPI_CPHA)
-		reg |= SUNXI_CTL_CPHA;
+		reg |= SUNXI_TFR_CTL_CPHA;
 	else
-		reg &= ~SUNXI_CTL_CPHA;
+		reg &= ~SUNXI_TFR_CTL_CPHA;
 
 	if (spi->mode & SPI_LSB_FIRST)
-		reg |= SUNXI_CTL_LMTF;
+		reg |= SUNXI_TFR_CTL_FBS;
 	else
-		reg &= ~SUNXI_CTL_LMTF;
+		reg &= ~SUNXI_TFR_CTL_FBS;
 
 
 	/*
@@ -230,11 +230,11 @@ static int sunxi_spi_transfer_one(struct spi_master *master,
 	 * FIFO with bogus data
 	 */
 	if (sspi->rx_buf)
-		reg &= ~SUNXI_CTL_DHB;
+		reg &= ~SUNXI_TFR_CTL_DHB;
 	else
-		reg |= SUNXI_CTL_DHB;
+		reg |= SUNXI_TFR_CTL_DHB;
 
-	sunxi_spi_write(sspi, SUNXI_CTL_REG, reg);
+	sunxi_spi_write(sspi, SUNXI_TFR_CTL_REG, reg);
 
 	/* Ensure that we have a parent clock fast enough */
 	mclk_rate = clk_get_rate(sspi->mclk);
@@ -289,8 +289,8 @@ static int sunxi_spi_transfer_one(struct spi_master *master,
 	sunxi_spi_write(sspi, SUNXI_INT_CTL_REG, SUNXI_INT_CTL_TC);
 
 	/* Start the transfer */
-	reg = sunxi_spi_read(sspi, SUNXI_CTL_REG);
-	sunxi_spi_write(sspi, SUNXI_CTL_REG, reg | SUNXI_CTL_XCH);
+	reg = sunxi_spi_read(sspi, SUNXI_TFR_CTL_REG);
+	sunxi_spi_write(sspi, SUNXI_TFR_CTL_REG, reg | SUNXI_TFR_CTL_XCH);
 
 	tx_time = max(tfr->len * 8 * 2 / (tfr->speed_hz / 1000), 100U);
 	start = jiffies;
@@ -347,7 +347,7 @@ static int sunxi_spi_runtime_resume(struct device *dev)
 		goto err;
 	}
 
-	sunxi_spi_write(sspi, SUNXI_CTL_REG,
+	sunxi_spi_write(sspi, SUNXI_TFR_CTL_REG,
 			SUNXI_CTL_ENABLE | SUNXI_CTL_MASTER | SUNXI_CTL_TP);
 
 	return 0;
diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index a27bf8f..f26b52a 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -26,9 +26,9 @@
 #define SUNXI_FIFO_DEPTH		128
 
 #define SUNXI_GBL_CTL_REG		0x04
-#define SUNXI_GBL_CTL_BUS_ENABLE	BIT(0)
-#define SUNXI_GBL_CTL_MASTER		BIT(1)
-#define SUNXI_GBL_CTL_TP		BIT(7)
+#define SUNXI_CTL_ENABLE		BIT(0)
+#define SUNXI_CTL_MASTER		BIT(1)
+#define SUNXI_CTL_TP			BIT(7)
 #define SUNXI_GBL_CTL_RST		BIT(31)
 
 #define SUNXI_TFR_CTL_REG		0x08
@@ -50,8 +50,8 @@
 #define SUNXI_INT_STA_REG		0x14
 
 #define SUNXI_FIFO_CTL_REG		0x18
-#define SUNXI_FIFO_CTL_RF_RST		BIT(15)
-#define SUNXI_FIFO_CTL_TF_RST		BIT(31)
+#define SUNXI_CTL_RF_RST		BIT(15)
+#define SUNXI_CTL_TF_RST		BIT(31)
 
 #define SUNXI_FIFO_STA_REG		0x1c
 #define SUNXI_FIFO_STA_RF_CNT_MASK	0x7f
@@ -202,7 +202,7 @@ static int sunxi_spi_transfer_one(struct spi_master *master,
 
 	/* Reset FIFO */
 	sunxi_spi_write(sspi, SUNXI_FIFO_CTL_REG,
-			SUNXI_FIFO_CTL_RF_RST | SUNXI_FIFO_CTL_TF_RST);
+			SUNXI_CTL_RF_RST | SUNXI_CTL_TF_RST);
 
 	/*
 	 * Setup the transfer control register: Chip Select,
@@ -352,7 +352,7 @@ static int sunxi_spi_runtime_resume(struct device *dev)
 	}
 
 	sunxi_spi_write(sspi, SUNXI_GBL_CTL_REG,
-			SUNXI_GBL_CTL_BUS_ENABLE | SUNXI_GBL_CTL_MASTER | SUNXI_GBL_CTL_TP);
+			SUNXI_CTL_ENABLE | SUNXI_CTL_MASTER | SUNXI_CTL_TP);
 
 	return 0;
 
-- 
2.8.1
