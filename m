From: wangyuhang <wangyuhang2014@gmail.com>
Subject: [PATCH 2/2] spi: dual and quad support(device tree)
Date: Mon, 26 Aug 2013 13:48:00 +0800
Message-ID: <1377496080-14356-2-git-send-email-wangyuhang2014@gmail.com>
References: <1377496080-14356-1-git-send-email-wangyuhang2014@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1377496080-14356-1-git-send-email-wangyuhang2014@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: broonie@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: sourav.poddar@ti.com, pekon@ti.com, wangyuhang <wangyuhang2014@gmail.com>
List-Id: devicetree@vger.kernel.org

fix one thing in patch:
commit id:f477b7fb13df2b843997559ff34e87d054ba6538

change property spi-tx-nbits and spi-rx-nbits to optional.
If User don't set spi-tx-nbits or spi-rx-nbits, spi device mode
should be regarded as SINGLE, not return an error.

Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
---
 drivers/spi/spi.c |   68 +++++++++++++++++++++++++----------------------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 50f7fc3..46a55f0 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -872,46 +872,42 @@ static void of_register_spi_devices(struct spi_master *master)
 		/* Device DUAL/QUAD mode */
 		prop = of_get_property(nc, "spi-tx-nbits", &len);
 		if (!prop || len < sizeof(*prop)) {
-			dev_err(&master->dev, "%s has no 'spi-tx-nbits' property\n",
-				nc->full_name);
-			spi_dev_put(spi);
-			continue;
-		}
-		switch (be32_to_cpup(prop)) {
-		case SPI_NBITS_SINGLE:
-			break;
-		case SPI_NBITS_DUAL:
-			spi->mode |= SPI_TX_DUAL;
-			break;
-		case SPI_NBITS_QUAD:
-			spi->mode |= SPI_TX_QUAD;
-			break;
-		default:
-			dev_err(&master->dev, "spi-tx-nbits value is not supported\n");
-			spi_dev_put(spi);
-			continue;
+			/* set tx mode in SINGLE as default */
+		} else {
+			switch (be32_to_cpup(prop)) {
+			case SPI_NBITS_SINGLE:
+				break;
+			case SPI_NBITS_DUAL:
+				spi->mode |= SPI_TX_DUAL;
+				break;
+			case SPI_NBITS_QUAD:
+				spi->mode |= SPI_TX_QUAD;
+				break;
+			default:
+				dev_err(&master->dev,
+					"spi-tx-nbits value is not supported\n");
+				spi_dev_put(spi);
+				continue;
 		}
 
 		prop = of_get_property(nc, "spi-rx-nbits", &len);
 		if (!prop || len < sizeof(*prop)) {
-			dev_err(&master->dev, "%s has no 'spi-rx-nbits' property\n",
-				nc->full_name);
-			spi_dev_put(spi);
-			continue;
-		}
-		switch (be32_to_cpup(prop)) {
-		case SPI_NBITS_SINGLE:
-			break;
-		case SPI_NBITS_DUAL:
-			spi->mode |= SPI_RX_DUAL;
-			break;
-		case SPI_NBITS_QUAD:
-			spi->mode |= SPI_RX_QUAD;
-			break;
-		default:
-			dev_err(&master->dev, "spi-rx-nbits value is not supported\n");
-			spi_dev_put(spi);
-			continue;
+			/* set rx mode in SINGLE as default */
+		} else {
+			switch (be32_to_cpup(prop)) {
+			case SPI_NBITS_SINGLE:
+				break;
+			case SPI_NBITS_DUAL:
+				spi->mode |= SPI_RX_DUAL;
+				break;
+			case SPI_NBITS_QUAD:
+				spi->mode |= SPI_RX_QUAD;
+				break;
+			default:
+				dev_err(&master->dev,
+					"spi-rx-nbits value is not supported\n");
+				spi_dev_put(spi);
+				continue;
 		}
 
 		/* Device speed */
-- 
1.7.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
