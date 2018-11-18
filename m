From: Matheus Tavares <matheus.bernardino@usp.br>
Subject: [PATCH v2 6/7] staging:iio:ad2s90: Add comment to device state mutex
Date: Sun, 18 Nov 2018 02:25:39 -0200
Message-ID: <20181118042540.12697-7-matheus.bernardino@usp.br>
References: <20181118042540.12697-1-matheus.bernardino@usp.br>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118042540.12697-1-matheus.bernardino@usp.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Ardelean <alexandru.ardelean@analog.com>, kernel-usp@googlegroups.com, victorcolombo@gmail.com
List-Id: devicetree@vger.kernel.org

From: Victor Colombo <victorcolombo@gmail.com>

Fix the checkpatch.pl issue:
"CHECK: struct mutex definition without comment".

Signed-off-by: Victor Colombo <victorcolombo@gmail.com>
Signed-off-by: Matheus Tavares <matheus.bernardino@usp.br>
---
Changes in v2:
 - Patch added in v2

 drivers/staging/iio/resolver/ad2s90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/resolver/ad2s90.c b/drivers/staging/iio/resolver/ad2s90.c
index 9aa229ba47e7..f04dc5dede00 100644
--- a/drivers/staging/iio/resolver/ad2s90.c
+++ b/drivers/staging/iio/resolver/ad2s90.c
@@ -22,7 +22,7 @@
 #define AD2S90_MAX_SPI_FREQ_HZ  830000
 
 struct ad2s90_state {
-	struct mutex lock;
+	struct mutex lock; /* lock to protect rx buffer */
 	struct spi_device *sdev;
 	u8 rx[2] ____cacheline_aligned;
 };
-- 
2.18.0
