From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 08/13] spi: sunxi: synchronize whitespace,
 comments, struct
Date: 13 Jun 2016 17:46:51 -0000
Message-ID: <96b6a34fb7bb60376928e1c92de56c19277abd51.1465490774.git.hramrach@gmail.com>
References: <cover.1465490774.git.hramrach@gmail.com>
Reply-To: hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQMLUOX54MBBHPD7O5AKGQELRS5RSA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Minimize differences between sun4i and sun6i driver without code
changes.

Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/spi/spi-sun4i.c | 11 ++++++-----
 drivers/spi/spi-sun6i.c |  8 +++-----
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index b7f8de1..bbb0996 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 #include <linux/spi/spi.h>
 
@@ -56,7 +57,7 @@
 
 #define SUNXI_CLK_CTL_REG		0x1c
 #define SUNXI_CLK_CTL_CDR2_MASK		0xff
-#define SUNXI_CLK_CTL_CDR2(div)		((div) & SUNXI_CLK_CTL_CDR2_MASK)
+#define SUNXI_CLK_CTL_CDR2(div)		(((div) & SUNXI_CLK_CTL_CDR2_MASK) << 0)
 #define SUNXI_CLK_CTL_CDR1_MASK		0xf
 #define SUNXI_CLK_CTL_CDR1(div)		(((div) & SUNXI_CLK_CTL_CDR1_MASK) << 8)
 #define SUNXI_CLK_CTL_DRS		BIT(12)
@@ -78,6 +79,7 @@ struct sunxi_spi {
 	void __iomem		*base_addr;
 	struct clk		*hclk;
 	struct clk		*mclk;
+	struct reset_control	*rstc;
 
 	struct completion	done;
 
@@ -136,7 +138,6 @@ static void sunxi_spi_set_cs(struct spi_device *spi, bool enable)
 	u32 reg;
 
 	reg = sunxi_spi_read(sspi, SUNXI_TFR_CTL_REG);
-
 	reg &= ~SUNXI_TFR_CTL_CS_MASK;
 	reg |= SUNXI_TFR_CTL_CS(spi->chip_select);
 
@@ -198,7 +199,6 @@ static int sunxi_spi_transfer_one(struct spi_master *master,
 	/* Clear pending interrupts */
 	sunxi_spi_write(sspi, SUNXI_INT_STA_REG, ~0);
 
-
 	reg = sunxi_spi_read(sspi, SUNXI_TFR_CTL_REG);
 
 	/* Reset FIFOs */
@@ -224,7 +224,6 @@ static int sunxi_spi_transfer_one(struct spi_master *master,
 	else
 		reg &= ~SUNXI_TFR_CTL_FBS;
 
-
 	/*
 	 * If it's a TX only transfer, we don't want to fill the RX
 	 * FIFO with bogus data
@@ -248,7 +247,7 @@ static int sunxi_spi_transfer_one(struct spi_master *master,
 	 *
 	 * We have two choices there. Either we can use the clock
 	 * divide rate 1, which is calculated thanks to this formula:
-	 * SPI_CLK = MOD_CLK / (2 ^ (cdr + 1))
+	 * SPI_CLK = MOD_CLK / (2 ^ cdr)
 	 * Or we can use CDR2, which is calculated with the formula:
 	 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
 	 * Wether we use the former or the latter is set through the
@@ -352,6 +351,8 @@ static int sunxi_spi_runtime_resume(struct device *dev)
 
 	return 0;
 
+err2:
+	clk_disable_unprepare(sspi->mclk);
 err:
 	clk_disable_unprepare(sspi->hclk);
 out:
diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index f26b52a..d14a953 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -29,7 +29,6 @@
 #define SUNXI_CTL_ENABLE		BIT(0)
 #define SUNXI_CTL_MASTER		BIT(1)
 #define SUNXI_CTL_TP			BIT(7)
-#define SUNXI_GBL_CTL_RST		BIT(31)
 
 #define SUNXI_TFR_CTL_REG		0x08
 #define SUNXI_TFR_CTL_CPHA		BIT(0)
@@ -44,7 +43,6 @@
 #define SUNXI_TFR_CTL_XCH		BIT(31)
 
 #define SUNXI_INT_CTL_REG		0x10
-#define SUNXI_INT_CTL_RF_OVF		BIT(8)
 #define SUNXI_INT_CTL_TC		BIT(12)
 
 #define SUNXI_INT_STA_REG		0x14
@@ -200,7 +198,9 @@ static int sunxi_spi_transfer_one(struct spi_master *master,
 	/* Clear pending interrupts */
 	sunxi_spi_write(sspi, SUNXI_INT_STA_REG, ~0);
 
-	/* Reset FIFO */
+	reg = sunxi_spi_read(sspi, SUNXI_TFR_CTL_REG);
+
+	/* Reset FIFOs */
 	sunxi_spi_write(sspi, SUNXI_FIFO_CTL_REG,
 			SUNXI_CTL_RF_RST | SUNXI_CTL_TF_RST);
 
@@ -208,8 +208,6 @@ static int sunxi_spi_transfer_one(struct spi_master *master,
 	 * Setup the transfer control register: Chip Select,
 	 * polarities, etc.
 	 */
-	reg = sunxi_spi_read(sspi, SUNXI_TFR_CTL_REG);
-
 	if (spi->mode & SPI_CPOL)
 		reg |= SUNXI_TFR_CTL_CPOL;
 	else
-- 
2.8.1
