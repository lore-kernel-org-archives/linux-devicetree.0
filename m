From: David Veenstra <davidjulianveenstra@gmail.com>
Subject: [PATCH v4 03/12] staging: iio: ad2s1200: Add kernel docs to driver
 state
Date: Fri, 18 May 2018 20:21:34 +0200
Message-ID: <38a9e24e5cdbc98afbf4d06f9848c55c26ce37ff.1526667118.git.davidjulianveenstra@gmail.com>
References: <cover.1526667118.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cover.1526667118.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: jic23@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Michael.Hennerich@analog.com, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

Add missing kernel docs to the ad2s1200 driver state.

Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
---
Changes in v4:
 - Simplified explanation of lock.

 drivers/staging/iio/resolver/ad2s1200.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
index 9bdcf0c86217..068aa86e9c11 100644
--- a/drivers/staging/iio/resolver/ad2s1200.c
+++ b/drivers/staging/iio/resolver/ad2s1200.c
@@ -32,6 +32,14 @@
 /* clock period in nano second */
 #define AD2S1200_TSCLK	(1000000000 / AD2S1200_HZ)
 
+/**
+ * struct ad2s1200_state - driver instance specific data.
+ * @lock:	protects both the GPIO pins and the rx buffer.
+ * @sdev:	spi device.
+ * @sample:	GPIO pin SAMPLE.
+ * @rdvel:	GPIO pin RDVEL.
+ * @rx:		buffer for spi transfers.
+ */
 struct ad2s1200_state {
 	struct mutex lock;
 	struct spi_device *sdev;
-- 
2.17.0
