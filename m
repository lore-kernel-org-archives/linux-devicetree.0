From: wangyuhang <wangyuhang2014@gmail.com>
Subject: [PATCH V2 1/2] spi: dual and quad support(device tree)
Date: Tue, 27 Aug 2013 08:50:02 +0800
Message-ID: <1377564603-4030-1-git-send-email-wangyuhang2014@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
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

fix two things in patch:
commit id:f477b7fb13df2b843997559ff34e87d054ba6538

1.change the name of property: spi-tx-nbits and spi-rx-nbits to
spi-tmax-nbits and spi-rmax-nbits, aimed to make that name different
from the member of spi_transfer(tx_nbits and rx_nbits). using tmax
and rmax here to describe that it is the max transfer bits that the
members in spi_transfer(tx_nbits and rx_nbits) can reach.
2.change property spi-tmax-nbits and spi-rmax-nbits to optional.
If User don't set spi-tmax-nbits or spi-rmax-nbits, spi device mode
should be regarded as SINGLE, not return an error. In such case, user
don't have to modify the old dts files to fit the new spi framework.

Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
---
 drivers/spi/spi.c |   72 +++++++++++++++++++++++++----------------------------
 1 file changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 50f7fc3..8d191f2 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -870,48 +870,44 @@ static void of_register_spi_devices(struct spi_master *master)
 			spi->mode |= SPI_3WIRE;
 
 		/* Device DUAL/QUAD mode */
-		prop = of_get_property(nc, "spi-tx-nbits", &len);
+		prop = of_get_property(nc, "spi-tmax-nbits", &len);
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
+					"spi-tmax-nbits value is not supported\n");
+				spi_dev_put(spi);
+				continue;
 		}
 
-		prop = of_get_property(nc, "spi-rx-nbits", &len);
+		prop = of_get_property(nc, "spi-rmax-nbits", &len);
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
+					"spi-rmax-nbits value is not supported\n");
+				spi_dev_put(spi);
+				continue;
 		}
 
 		/* Device speed */
-- 
1.7.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
