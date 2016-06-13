From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3 01/13] spi: sunxi: set maximum and minimum speed of SPI
 master
Date: 13 Jun 2016 17:46:49 -0000
Message-ID: <2db0ce0ea1ddc17e9bb790c8cc50bcb4bb97be58.1465490774.git.hramrach@gmail.com>
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
To: linux-sunxi@googlegroups.com, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Simon Horman <horms+renesas@verge.net.au>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Thierry Reding <treding@nvidia.com>, Alison Wang <b18965@freescale.com>, Timo Sigurdsson <public_timo.s@silentcreek.de>, Jonathan Liu <net147@gmail.com>, Gerhard Bertelsmann <info@gerhard-bertelsmann.>
List-Id: devicetree@vger.kernel.org

The speed limits are unset in the sun4i and sun6i SPI drivers.

The maximum speed of SPI master is used when maximum speed of SPI slave
is not specified. Also the __spi_validate function should check that
transfer speeds do not exceed the master limits.

The user manual for A10 and A31 specifies maximum
speed of the SPI clock as 100MHz and minimum as 3kHz.

Setting the SPI clock to out-of-spec values can lock up the SoC.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
--
v2:
new patch
v3:
fix constant style
---
 drivers/spi/spi-sun4i.c | 2 ++
 drivers/spi/spi-sun6i.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index 1ddd9e2..4213508 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -387,6 +387,8 @@ static int sun4i_spi_probe(struct platform_device *pdev)
 	}
 
 	sspi->master = master;
+	master->max_speed_hz = 100 * 1000 * 1000;
+	master->min_speed_hz =          3 * 1000;
 	master->set_cs = sun4i_spi_set_cs;
 	master->transfer_one = sun4i_spi_transfer_one;
 	master->num_chipselect = 4;
diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 42e2c4b..fe70695 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -386,6 +386,8 @@ static int sun6i_spi_probe(struct platform_device *pdev)
 	}
 
 	sspi->master = master;
+	master->max_speed_hz = 100 * 1000 * 1000;
+	master->min_speed_hz =          3 * 1000;
 	master->set_cs = sun6i_spi_set_cs;
 	master->transfer_one = sun6i_spi_transfer_one;
 	master->num_chipselect = 4;
-- 
2.8.1
