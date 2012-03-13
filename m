From: Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 1/7] ARM: orion: spi: remove enable_clock_fix which is not used
Date: Tue, 13 Mar 2012 01:57:43 +0000
Message-ID: <09fda0555ea860b7b6bfdf3fef0ebe08926edaa1.1331601448.git.jason@lakedaemon.net>
References: <cover.1331601448.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1331601448.git.jason@lakedaemon.net>
In-Reply-To: <cover.1331601448.git.jason@lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <cover.1331601448.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, olof@lixom.net
Cc: nicolas.pitre@linaro.org, andrew@lunn.ch, Jason Cooper <jason@lakedaemon.net>, jm@lentin.co.uk, grant.likely@secretlab.ca, michael@walle.cc, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jason Cooper <jason@lakedaemon.net>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
---
 drivers/spi/spi-orion.c       |    5 -----
 include/linux/spi/orion_spi.h |    1 -
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index 13448c8..e496f79 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -359,11 +359,6 @@ static int orion_spi_setup(struct spi_device *spi)
 
 	orion_spi = spi_master_get_devdata(spi->master);
 
-	/* Fix ac timing if required.   */
-	if (orion_spi->spi_info->enable_clock_fix)
-		orion_spi_setbits(orion_spi, ORION_SPI_IF_CONFIG_REG,
-				  (1 << 14));
-
 	if ((spi->max_speed_hz == 0)
 			|| (spi->max_speed_hz > orion_spi->max_speed))
 		spi->max_speed_hz = orion_spi->max_speed;
diff --git a/include/linux/spi/orion_spi.h b/include/linux/spi/orion_spi.h
index decf6d8..b4d9fa6 100644
--- a/include/linux/spi/orion_spi.h
+++ b/include/linux/spi/orion_spi.h
@@ -11,7 +11,6 @@
 
 struct orion_spi_info {
 	u32	tclk;		/* no <linux/clk.h> support yet */
-	u32	enable_clock_fix;
 };
 
 
-- 
1.7.3.4
