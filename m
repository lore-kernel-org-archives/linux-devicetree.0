From: "Michal" <michal.suchanek-vlPZI//2HHjtwjQa/ONI9g@public.gmane.org>
Subject: [PATCH v3 13/13] spi: sun4i: add DMA support
Date: 13 Jun 2016 17:46:53 -0000
Message-ID: <f52becbaae7fa1f750fa2f085ad44df9c903b295.1465490774.git.hramrach@gmail.com>
References: <cover.1465490774.git.hramrach@gmail.com>
Reply-To: michal.suchanek-vlPZI//2HHjtwjQa/ONI9g@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCWZFPXV3ALBBLXD7O5AKGQEBB52F3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

From: Emilio L=C3=B3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>

This patch adds support for 64 byte or bigger transfers on the
sun4i SPI controller. Said transfers will be performed via DMA.

Signed-off-by: Emilio L=C3=B3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---

v2:
 - fallback to previous behaviour when DMA initialization fails
v3:
 - adjust to merged driver
 - add bit set/unset helpers
 - add wait_for_dma (default=3D1) so driver does not randomly load without =
dma
 - use SUNXI_CNT_MASK as transfer size limit
---
 drivers/spi/spi-sun4i.c | 247 ++++++++++++++++++++++++++++++++++++++++++++=
----
 1 file changed, 230 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index c76f8e4..fd6b1a8 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -14,6 +14,8 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -50,6 +52,12 @@
 #define SUNXI_FIFO_STA_TF_CNT_MASK	0x7f
 #define SUNXI_FIFO_STA_TF_CNT_BITS	16
=20
+static int wait_for_dma =3D 1;
+module_param(wait_for_dma, int, 0644);
+MODULE_PARM_DESC(wait_for_dma,
+		 "When acquiring a DMA channel returns EDEFER return and let kernel defe=
r spi master probe.\n"
+		 "Non-DMA operation is used otherwise (defaults to wait for DMA driver t=
o load).");
+
 enum SPI_SUNXI_TYPE {
 	SPI_SUN4I =3D 1,
 	SPI_SUN6I,
@@ -61,6 +69,7 @@ enum SUNXI_REG_ENUM {
 	SUNXI_TFR_CTL_REG,
 	SUNXI_INT_CTL_REG,
 	SUNXI_INT_STA_REG,
+	SUNXI_DMA_CTL_REG,
 	SUNXI_WAIT_REG,
 	SUNXI_CLK_CTL_REG,
 	SUNXI_BURST_CNT_REG,
@@ -79,6 +88,7 @@ static int sun4i_regmap[SUNXI_NUM_REGS] =3D {
 /* SUNXI_TFR_CTL_REG */			0x08,
 /* SUNXI_INT_CTL_REG */			0x0c,
 /* SUNXI_INT_STA_REG */			0x10,
+/* SUNXI_DMA_CTL_REG */			0x14,
 /* SUNXI_WAIT_REG */			0x18,
 /* SUNXI_CLK_CTL_REG */			0x1c,
 /* SUNXI_BURST_CNT_REG */		0x20,
@@ -93,6 +103,7 @@ static int sun6i_regmap[SUNXI_NUM_REGS] =3D {
 /* SUNXI_TFR_CTL_REG */			0x08,
 /* SUNXI_INT_CTL_REG */			0x10,
 /* SUNXI_INT_STA_REG */			0x14,
+/* SUNXI_DMA_CTL_REG */			-1,
 /* SUNXI_WAIT_REG */			0x20,
 /* SUNXI_CLK_CTL_REG */			0x24,
 /* SUNXI_BURST_CNT_REG */		0x30,
@@ -110,6 +121,7 @@ enum SUNXI_BITMAP_ENUM {
 	SUNXI_TFR_CTL_CPHA,
 	SUNXI_TFR_CTL_CPOL,
 	SUNXI_TFR_CTL_CS_ACTIVE_LOW,
+	SUNXI_CTL_DMA_DEDICATED,
 	SUNXI_TFR_CTL_FBS,
 	SUNXI_CTL_TF_RST,
 	SUNXI_CTL_RF_RST,
@@ -121,6 +133,9 @@ enum SUNXI_BITMAP_ENUM {
 	SUNXI_TFR_CTL_CS_LEVEL,
 	SUNXI_CTL_TP,
 	SUNXI_INT_CTL_TC,
+	SUNXI_CTL_DMA_RF_READY,
+	SUNXI_CTL_DMA_TF_NOT_FULL,
+	SUNXI_CTL_DMA_TF_HALF,
 	SUNXI_BITMAP_SIZE
 };
=20
@@ -130,6 +145,7 @@ static int sun4i_bitmap[SUNXI_BITMAP_SIZE] =3D {
 /* SUNXI_TFR_CTL_CPHA */		BIT(2),
 /* SUNXI_TFR_CTL_CPOL */		BIT(3),
 /* SUNXI_TFR_CTL_CS_ACTIVE_LOW */	BIT(4),
+/* SUNXI_CTL_DMA_DEDICATED */		BIT(5),
 /* SUNXI_TFR_CTL_FBS */			BIT(6),
 /* SUNXI_CTL_TF_RST */			BIT(8),
 /* SUNXI_CTL_RF_RST */			BIT(9),
@@ -141,6 +157,9 @@ static int sun4i_bitmap[SUNXI_BITMAP_SIZE] =3D {
 /* SUNXI_TFR_CTL_CS_LEVEL */		BIT(17),
 /* SUNXI_CTL_TP */			BIT(18),
 /* SUNXI_INT_CTL_TC */			BIT(16),
+/* SUNXI_CTL_DMA_RF_READY */		BIT(0),
+/* SUNXI_CTL_DMA_TF_NOT_FULL */		BIT(10),
+/* SUNXI_CTL_DMA_TF_HALF */		BIT(9),
 };
=20
 static int sun6i_bitmap[SUNXI_BITMAP_SIZE] =3D {
@@ -149,6 +168,12 @@ static int sun6i_bitmap[SUNXI_BITMAP_SIZE] =3D {
 /* SUNXI_TFR_CTL_CPHA */		BIT(0),
 /* SUNXI_TFR_CTL_CPOL */		BIT(1),
 /* SUNXI_TFR_CTL_CS_ACTIVE_LOW */	BIT(2),
+/*
+ * Bit 9 is listed as dedicated dma control for rx.
+ * There is no dedicated dma control bit listed for tx and bit 25
+ * on the logical position is listed as unused.
+ */
+/* SUNXI_CTL_DMA_DEDICATED */		BIT(9)|BIT(25),
 /* SUNXI_TFR_CTL_FBS */			BIT(12),
 /* SUNXI_CTL_TF_RST */			BIT(31),
 /* SUNXI_CTL_RF_RST */			BIT(15),
@@ -160,6 +185,15 @@ static int sun6i_bitmap[SUNXI_BITMAP_SIZE] =3D {
 /* SUNXI_TFR_CTL_CS_LEVEL */		BIT(7),
 /* SUNXI_CTL_TP */			BIT(7),
 /* SUNXI_INT_CTL_TC */			BIT(12),
+/*
+ * On sun4i there are separate bits enabling request on different fifo lev=
els.
+ * On sun6i there is a level field and enable bit which enables request on=
 that
+ * FIFO level. Only one level is ever used so just pack the relevant bits =
as
+ * one constant.
+ */
+/* SUNXI_CTL_DMA_RF_READY */		BIT(0)|BIT(8),
+/* SUNXI_CTL_DMA_TF_NOT_FULL */		(0x7f << 16)|BIT(24),
+/* SUNXI_CTL_DMA_TF_HALF */		BIT(23)|BIT(24),
 };
=20
 struct sunxi_spi {
@@ -207,6 +241,20 @@ static inline u32 sspi_bits(struct sunxi_spi *sspi,
 	return (*sspi->bitmap)[name];
 }
=20
+static inline void sunxi_spi_set(struct sunxi_spi *sspi, u32 reg, u32 valu=
e)
+{
+	u32 orig =3D sunxi_spi_read(sspi, reg);
+
+	sunxi_spi_write(sspi, reg, orig | value);
+}
+
+static inline void sunxi_spi_unset(struct sunxi_spi *sspi, u32 reg, u32 va=
lue)
+{
+	u32 orig =3D sunxi_spi_read(sspi, reg);
+
+	sunxi_spi_write(sspi, reg, orig & ~value);
+}
+
 static inline void sunxi_spi_drain_fifo(struct sunxi_spi *sspi, int len)
 {
 	u32 reg, cnt;
@@ -243,6 +291,15 @@ static inline void sunxi_spi_fill_fifo(struct sunxi_sp=
i *sspi, int len)
 	}
 }
=20
+static bool sunxi_spi_can_dma(struct spi_master *master,
+			      struct spi_device *spi,
+			      struct spi_transfer *tfr)
+{
+	struct sunxi_spi *sspi =3D spi_master_get_devdata(master);
+
+	return tfr->len >=3D sspi->fifo_depth;
+}
+
 static void sunxi_spi_set_cs(struct spi_device *spi, bool enable)
 {
 	struct sunxi_spi *sspi =3D spi_master_get_devdata(spi->master);
@@ -284,6 +341,8 @@ static size_t sunxi_spi_max_transfer_size(struct spi_de=
vice *spi)
 	struct spi_master *master =3D spi->master;
 	struct sunxi_spi *sspi =3D spi_master_get_devdata(master);
=20
+	if (master->can_dma)
+		return SUNXI_CNT_MASK;
 	return sspi->fifo_depth - 1;
 }
=20
@@ -292,22 +351,27 @@ static int sunxi_spi_transfer_one(struct spi_master *=
master,
 				  struct spi_transfer *tfr)
 {
 	struct sunxi_spi *sspi =3D spi_master_get_devdata(master);
+	struct dma_async_tx_descriptor *desc_tx =3D NULL, *desc_rx =3D NULL;
 	unsigned int mclk_rate, div, timeout;
 	unsigned int start, end, tx_time;
 	unsigned int tx_len =3D 0;
 	int ret =3D 0;
-	u32 reg;
+	u32 reg, trigger =3D 0;
+
+	if (!master->can_dma) {
+		/* We don't support transfer larger than the FIFO */
+		if (tfr->len > sspi->fifo_depth)
+			return -EMSGSIZE;
+		/*
+		 * Filling the FIFO fully causes timeout for some reason
+		 * at least on spi2 on A10s
+		 */
+		if ((sspi->type =3D=3D SPI_SUN4I) &&
+		    tfr->tx_buf && tfr->len >=3D sspi->fifo_depth)
+			return -EMSGSIZE;
+	}
=20
-	/* We don't support transfer larger than the FIFO */
-	if (tfr->len > sspi->fifo_depth)
-		return -EMSGSIZE;
-
-	/*
-	 * Filling the FIFO fully causes timeout for some reason
-	 * at least on spi2 on A10s
-	 */
-	if ((sspi->type =3D=3D SPI_SUN4I) &&
-	    tfr->tx_buf && tfr->len >=3D sspi->fifo_depth)
+	if (tfr->len > SUNXI_CNT_MASK)
 		return -EMSGSIZE;
=20
 	reinit_completion(&sspi->done);
@@ -405,17 +469,81 @@ static int sunxi_spi_transfer_one(struct spi_master *=
master,
 		sunxi_spi_write(sspi, SUNXI_BURST_CTL_CNT_REG,
 				SUNXI_BURST_CTL_CNT_STC(tx_len));
=20
-	/* Fill the TX FIFO */
-	sunxi_spi_fill_fifo(sspi, sspi->fifo_depth);
+	/* Setup transfer buffers */
+	if (sunxi_spi_can_dma(master, spi, tfr)) {
+		dev_dbg(&sspi->master->dev, "Using DMA mode for transfer\n");
+
+		if (sspi->tx_buf) {
+			desc_tx =3D dmaengine_prep_slave_sg(master->dma_tx,
+					tfr->tx_sg.sgl, tfr->tx_sg.nents,
+					DMA_TO_DEVICE,
+					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+			if (!desc_tx) {
+				dev_err(&sspi->master->dev,
+					"Couldn't prepare dma slave\n");
+				ret =3D -EIO;
+				goto out;
+			}
+
+			if (sspi->type =3D=3D SPI_SUN4I)
+				trigger |=3D sspi_bits(sspi, SUNXI_CTL_DMA_TF_NOT_FULL);
+			else
+				trigger |=3D sspi_bits(sspi, SUNXI_CTL_DMA_TF_HALF);
+
+			dmaengine_submit(desc_tx);
+			dma_async_issue_pending(master->dma_tx);
+		}
+
+		if (sspi->rx_buf) {
+			desc_rx =3D dmaengine_prep_slave_sg(master->dma_rx,
+					tfr->rx_sg.sgl, tfr->rx_sg.nents,
+					DMA_FROM_DEVICE,
+					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+			if (!desc_rx) {
+				dev_err(&sspi->master->dev,
+					"Couldn't prepare dma slave\n");
+				ret =3D -EIO;
+				goto out;
+			}
+
+			trigger |=3D sspi_bits(sspi, SUNXI_CTL_DMA_RF_READY);
+
+			dmaengine_submit(desc_rx);
+			dma_async_issue_pending(master->dma_rx);
+		}
+
+		/* Enable Dedicated DMA requests */
+		if (sspi->type =3D=3D SPI_SUN4I) {
+			sunxi_spi_set(sspi, SUNXI_TFR_CTL_REG,
+				      sspi_bits(sspi, SUNXI_CTL_DMA_DEDICATED));
+			sunxi_spi_write(sspi, SUNXI_DMA_CTL_REG, trigger);
+		} else {
+			trigger |=3D sspi_bits(sspi, SUNXI_CTL_DMA_DEDICATED);
+			sunxi_spi_write(sspi, SUNXI_FIFO_CTL_REG, trigger);
+		}
+	} else {
+		dev_dbg(&sspi->master->dev, "Using PIO mode for transfer\n");
+
+		/* Disable DMA requests */
+		if (sspi->type =3D=3D SPI_SUN4I) {
+			sunxi_spi_unset(sspi, SUNXI_TFR_CTL_REG,
+					sspi_bits(sspi, SUNXI_CTL_DMA_DEDICATED));
+			sunxi_spi_write(sspi, SUNXI_DMA_CTL_REG, 0);
+		} else {
+			sunxi_spi_write(sspi, SUNXI_FIFO_CTL_REG, 0);
+		}
+
+		/* Fill the TX FIFO */
+		sunxi_spi_fill_fifo(sspi, sspi->fifo_depth);
+	}
=20
 	/* Enable the interrupts */
 	sunxi_spi_write(sspi, SUNXI_INT_CTL_REG,
 			sspi_bits(sspi, SUNXI_INT_CTL_TC));
=20
 	/* Start the transfer */
-	reg =3D sunxi_spi_read(sspi, SUNXI_TFR_CTL_REG);
-	sunxi_spi_write(sspi, SUNXI_TFR_CTL_REG,
-			reg | sspi_bits(sspi, SUNXI_TFR_CTL_XCH));
+	sunxi_spi_set(sspi, SUNXI_TFR_CTL_REG,
+			    sspi_bits(sspi, SUNXI_TFR_CTL_XCH));
=20
 	tx_time =3D max(tfr->len * 8 * 2 / (tfr->speed_hz / 1000), 100U);
 	start =3D jiffies;
@@ -431,9 +559,23 @@ static int sunxi_spi_transfer_one(struct spi_master *m=
aster,
 		goto out;
 	}
=20
+out:
+	if (ret < 0 && sunxi_spi_can_dma(master, spi, tfr)) {
+		dev_dbg(&master->dev, "DMA channel teardown");
+		if (sspi->tx_buf)
+			dmaengine_terminate_sync(master->dma_tx);
+		if (sspi->rx_buf)
+			dmaengine_terminate_sync(master->dma_rx);
+	}
+
+	/*
+	 * By this time either the transfer has ended and we have data in the
+	 * FIFO buffer from a PIO RX transfer or the buffer is empty
+	 * or something has failed.
+	 * Empty the buffer either way to avoid leaving garbage around.
+	 */
 	sunxi_spi_drain_fifo(sspi, sspi->fifo_depth);
=20
-out:
 	sunxi_spi_write(sspi, SUNXI_INT_CTL_REG, 0);
=20
 	return ret;
@@ -515,6 +657,7 @@ static int sunxi_spi_runtime_suspend(struct device *dev=
)
=20
 static int sunxi_spi_probe(struct platform_device *pdev)
 {
+	struct dma_slave_config dma_sconfig;
 	struct spi_master *master;
 	struct sunxi_spi *sspi;
 	struct resource	*res;
@@ -625,6 +768,54 @@ static int sunxi_spi_probe(struct platform_device *pde=
v)
 		}
 	}
=20
+	master->dma_tx =3D dma_request_slave_channel_reason(&pdev->dev, "tx");
+	if (IS_ERR(master->dma_tx)) {
+		dev_err(&pdev->dev, "Unable to acquire DMA channel TX\n");
+		ret =3D PTR_ERR(master->dma_tx);
+		goto err_dma_chan;
+	}
+
+	dma_sconfig.direction =3D DMA_MEM_TO_DEV;
+	dma_sconfig.src_addr_width =3D DMA_SLAVE_BUSWIDTH_1_BYTE;
+	dma_sconfig.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_1_BYTE;
+	dma_sconfig.dst_addr =3D res->start + sspi_reg(sspi, SUNXI_TXDATA_REG);
+	dma_sconfig.src_maxburst =3D 1;
+	dma_sconfig.dst_maxburst =3D 1;
+
+	ret =3D dmaengine_slave_config(master->dma_tx, &dma_sconfig);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to configure TX DMA slave\n");
+		goto err_tx_dma_release;
+	}
+
+	master->dma_rx =3D dma_request_slave_channel_reason(&pdev->dev, "rx");
+	if (IS_ERR(master->dma_rx)) {
+		dev_err(&pdev->dev, "Unable to acquire DMA channel RX\n");
+		ret =3D PTR_ERR(master->dma_rx);
+		goto err_tx_dma_release;
+	}
+
+	dma_sconfig.direction =3D DMA_DEV_TO_MEM;
+	dma_sconfig.src_addr_width =3D DMA_SLAVE_BUSWIDTH_1_BYTE;
+	dma_sconfig.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_1_BYTE;
+	dma_sconfig.src_addr =3D res->start + sspi_reg(sspi, SUNXI_RXDATA_REG);
+	dma_sconfig.src_maxburst =3D 1;
+	dma_sconfig.dst_maxburst =3D 1;
+
+	ret =3D dmaengine_slave_config(master->dma_rx, &dma_sconfig);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to configure RX DMA slave\n");
+		goto err_rx_dma_release;
+	}
+
+	/*
+	 * This is a bit dodgy. If you set can_dma then map_msg in spi.c
+	 * apparently dereferences your dma channels if non-NULL even if your
+	 * can_dma never returns true (and crashes if the channel is an error
+	 * pointer). So just don't set can_dma unless both channels are valid.
+	 */
+	master->can_dma =3D sunxi_spi_can_dma;
+wakeup:
 	/*
 	 * This wake-up/shutdown pattern is to be able to have the
 	 * device woken up, even if runtime_pm is disabled
@@ -665,18 +856,40 @@ static int sunxi_spi_probe(struct platform_device *pd=
ev)
=20
 	return 0;
=20
+err_rx_dma_release:
+	dma_release_channel(master->dma_rx);
+err_tx_dma_release:
+	dma_release_channel(master->dma_tx);
+err_dma_chan:
+	master->dma_tx =3D NULL;
+	master->dma_rx =3D NULL;
+	if ((ret =3D=3D -EPROBE_DEFER) && wait_for_dma)
+		goto err_free_master;
+	goto wakeup;
+
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 	sunxi_spi_runtime_suspend(&pdev->dev);
 err_free_master:
+	if (master->can_dma) {
+		dma_release_channel(master->dma_rx);
+		dma_release_channel(master->dma_tx);
+	}
 	spi_master_put(master);
 	return ret;
 }
=20
 static int sunxi_spi_remove(struct platform_device *pdev)
 {
+	struct spi_master *master =3D platform_get_drvdata(pdev);
+
 	pm_runtime_disable(&pdev->dev);
=20
+	if (master->can_dma) {
+		dma_release_channel(master->dma_rx);
+		dma_release_channel(master->dma_tx);
+	}
+
 	return 0;
 }
=20
--=20
2.8.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
