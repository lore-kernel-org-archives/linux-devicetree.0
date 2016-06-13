From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3 04/13] spi: sunxi: expose maximum transfer size limit
Date: 13 Jun 2016 17:46:50 -0000
Message-ID: <6962eec8da0b5255cafd7782bcc39ca19041c2b1.1465490774.git.hramrach@gmail.com>
References: <cover.1465490774.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1465490774.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Simon Horman <horms+renesas@verge.net.au>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Thierry Reding <treding@nvidia.com>, Alison Wang <b18965@freescale.com>, Timo Sigurdsson <public_timo.s@silentcreek.de>, Jonathan Liu <net147@gmail.com>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, Priit Laes <plaes@p>
List-Id: devicetree@vger.kernel.org

The sun4i spi hardware can trasfer at most 63 bytes of data without DMA
support so report the limitation. Same for sun6i.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/spi/spi-sun4i.c | 6 ++++++
 drivers/spi/spi-sun6i.c | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index f2848b7..ba2b5c8 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -167,6 +167,11 @@ static void sun4i_spi_set_cs(struct spi_device *spi, bool enable)
 	sun4i_spi_write(sspi, SUN4I_CTL_REG, reg);
 }
 
+static size_t sun4i_spi_max_transfer_size(struct spi_device *spi)
+{
+	return SUN4I_FIFO_DEPTH - 1;
+}
+
 static int sun4i_spi_transfer_one(struct spi_master *master,
 				  struct spi_device *spi,
 				  struct spi_transfer *tfr)
@@ -411,6 +416,7 @@ static int sun4i_spi_probe(struct platform_device *pdev)
 	master->bits_per_word_mask = SPI_BPW_MASK(8);
 	master->dev.of_node = pdev->dev.of_node;
 	master->auto_runtime_pm = true;
+	master->max_transfer_size = sun4i_spi_max_transfer_size;
 
 	sspi->hclk = devm_clk_get(&pdev->dev, "ahb");
 	if (IS_ERR(sspi->hclk)) {
diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 8f6be86..bc29a98 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -153,6 +153,10 @@ static void sun6i_spi_set_cs(struct spi_device *spi, bool enable)
 	sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
 }
 
+static size_t sun6i_spi_max_transfer_size(struct spi_device *spi)
+{
+	return SUN6I_FIFO_DEPTH - 1;
+}
 
 static int sun6i_spi_transfer_one(struct spi_master *master,
 				  struct spi_device *spi,
@@ -403,6 +407,7 @@ static int sun6i_spi_probe(struct platform_device *pdev)
 	master->bits_per_word_mask = SPI_BPW_MASK(8);
 	master->dev.of_node = pdev->dev.of_node;
 	master->auto_runtime_pm = true;
+	master->max_transfer_size = sun6i_spi_max_transfer_size;
 
 	sspi->hclk = devm_clk_get(&pdev->dev, "ahb");
 	if (IS_ERR(sspi->hclk)) {
-- 
2.8.1
