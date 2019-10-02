From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/7] iio: adc: max1027: Add debugfs register read support
Date: Wed,  2 Oct 2019 14:30:19 +0200
Message-ID: <20191002123025.21413-2-miquel.raynal@bootlin.com>
References: <20191002123025.21413-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002123025.21413-1-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Until now, only write operations were supported. Force two bytes read
operation when reading from this register (might be wrong when reading
the temperature, but will work with any other value).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/iio/adc/max1027.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/max1027.c b/drivers/iio/adc/max1027.c
index 214883458582..6cdfe9ef73fc 100644
--- a/drivers/iio/adc/max1027.c
+++ b/drivers/iio/adc/max1027.c
@@ -309,8 +309,11 @@ static int max1027_debugfs_reg_access(struct iio_dev *indio_dev,
 	struct max1027_state *st = iio_priv(indio_dev);
 	u8 *val = (u8 *)st->buffer;
 
-	if (readval != NULL)
-		return -EINVAL;
+	if (readval) {
+		int ret = spi_read(st->spi, val, 2);
+		*readval = be16_to_cpu(st->buffer[0]);
+		return ret;
+	}
 
 	*val = (u8)writeval;
 	return spi_write(st->spi, val, 1);
-- 
2.20.1
