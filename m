From: wangyuhang <wangyuhang2014@gmail.com>
Subject: [PATCH] spi: quad: fix the name of DT property
Date: Sun,  1 Sep 2013 17:36:21 +0800
Message-ID: <1378028181-5409-1-git-send-email-wangyuhang2014@gmail.com>
References: <1376216117-5864-1-git-send-email-wangyuhang2014@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1376216117-5864-1-git-send-email-wangyuhang2014@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: broonie@kernel.org, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com, tomasz.figa@gmail.com, swarren@wwwdotorg.org
Cc: wangyuhang <wangyuhang2014@gmail.com>
List-Id: devicetree@vger.kernel.org

spi: quad: fix the name of DT property in patch

The previous property name spi-tx-nbits and spi-rx-nbits looks not
human-readable. To make it consistent with other devices, using property
name spi-tx-bus-width and spi-rx-bus-width instead of the previous one
specify the number of data wires that spi controller will work in.
Add the specification in spi-bus.txt.

Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-bus.txt |   10 ++++++++++
 drivers/spi/spi.c                                 |    8 ++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt b/Documentation/devicetree/bindings/spi/spi-bus.txt
index 296015e..800dafe 100644
--- a/Documentation/devicetree/bindings/spi/spi-bus.txt
+++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
@@ -55,6 +55,16 @@ contain the following properties.
     		chip select active high
 - spi-3wire       - (optional) Empty property indicating device requires
     		    3-wire mode.
+- spi-tx-bus-width - (optional) The bus width(number of data wires) that
+                      used for MOSI. Defaults to 1 if not present.
+- spi-rx-bus-width - (optional) The bus width(number of data wires) that
+                      used for MISO. Defaults to 1 if not present.
+
+Some SPI controllers and devices support Dual and Quad SPI transfer mode.
+It allows data in SPI system transfered in 2 wires(DUAL) or 4 wires(QUAD).
+Now the value that spi-tx-bus-width and spi-rx-bus-width can receive is
+only 1(SINGLE), 2(DUAL) and 4(QUAD).
+Dual/Quad mode is not allowed when 3-wire mode is used.
 
 If a gpio chipselect is used for the SPI slave the gpio number will be passed
 via the cs_gpio
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 7557f61..0075318 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -870,7 +870,7 @@ static void of_register_spi_devices(struct spi_master *master)
 			spi->mode |= SPI_3WIRE;
 
 		/* Device DUAL/QUAD mode */
-		prop = of_get_property(nc, "spi-tx-nbits", &len);
+		prop = of_get_property(nc, "spi-tx-bus-width", &len);
 		if (prop && len == sizeof(*prop)) {
 			switch (be32_to_cpup(prop)) {
 			case SPI_NBITS_SINGLE:
@@ -883,14 +883,14 @@ static void of_register_spi_devices(struct spi_master *master)
 				break;
 			default:
 				dev_err(&master->dev,
-					"spi-tx-nbits %d not supported\n",
+					"spi-tx-bus-width %d not supported\n",
 					be32_to_cpup(prop));
 				spi_dev_put(spi);
 				continue;
 			}
 		}
 
-		prop = of_get_property(nc, "spi-rx-nbits", &len);
+		prop = of_get_property(nc, "spi-rx-bus-width", &len);
 		if (prop && len == sizeof(*prop)) {
 			switch (be32_to_cpup(prop)) {
 			case SPI_NBITS_SINGLE:
@@ -903,7 +903,7 @@ static void of_register_spi_devices(struct spi_master *master)
 				break;
 			default:
 				dev_err(&master->dev,
-					"spi-rx-nbits %d not supported\n",
+					"spi-rx-bus-width %d not supported\n",
 					be32_to_cpup(prop));
 				spi_dev_put(spi);
 				continue;
-- 
1.7.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
