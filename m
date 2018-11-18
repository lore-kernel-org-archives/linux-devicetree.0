From: Matheus Tavares <matheus.bernardino@usp.br>
Subject: [PATCH v2 1/7] staging:iio:ad2s90: Add device tree support
Date: Sun, 18 Nov 2018 02:25:34 -0200
Message-ID: <20181118042540.12697-2-matheus.bernardino@usp.br>
References: <20181118042540.12697-1-matheus.bernardino@usp.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181118042540.12697-1-matheus.bernardino@usp.br>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, Alexandru Ardelean <alexandru.ardelean@analog.com>, victorcolombo@gmail.com
List-Id: devicetree@vger.kernel.org

This patch adds device tree support to ad2s90 with standard
device tree id table.

Signed-off-by: Matheus Tavares <matheus.bernardino@usp.br>
---
Changes in v2:
 - none

 drivers/staging/iio/resolver/ad2s90.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s90.c b/drivers/staging/iio/resolver/ad2s90.c
index 3e257ac46f7a..6ffbac66b837 100644
--- a/drivers/staging/iio/resolver/ad2s90.c
+++ b/drivers/staging/iio/resolver/ad2s90.c
@@ -107,6 +107,12 @@ static int ad2s90_probe(struct spi_device *spi)
 	return devm_iio_device_register(indio_dev->dev.parent, indio_dev);
 }
 
+static const struct of_device_id ad2s90_of_match[] = {
+	{ .compatible = "adi,ad2s90", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ad2s90_of_match);
+
 static const struct spi_device_id ad2s90_id[] = {
 	{ "ad2s90" },
 	{}
@@ -116,6 +122,7 @@ MODULE_DEVICE_TABLE(spi, ad2s90_id);
 static struct spi_driver ad2s90_driver = {
 	.driver = {
 		.name = "ad2s90",
+		.of_match_table = of_match_ptr(ad2s90_of_match),
 	},
 	.probe = ad2s90_probe,
 	.id_table = ad2s90_id,
-- 
2.18.0
