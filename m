From: David Veenstra <davidjulianveenstra@gmail.com>
Subject: [PATCH v2 05/13] staging: iio: ad2s1200: Add kernel docs to driver
 state
Date: Fri, 20 Apr 2018 21:30:03 +0200
Message-ID: <2e083c69b1d249fe05badc94250c39db24d523e0.1524247563.git.davidjulianveenstra@gmail.com>
References: <cover.1524247563.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cover.1524247563.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: lars@metafoo.de, jic23@kernel.org, pmeerw@pmeerw.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, knaack.h@gmx.de, daniel.baluta@nxp.com
List-Id: devicetree@vger.kernel.org

Add missing kernel docs to the ad2s1200 driver state.

Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
---
 drivers/staging/iio/resolver/ad2s1200.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
index 357fe3c382b3..f07aab7e7a35 100644
--- a/drivers/staging/iio/resolver/ad2s1200.c
+++ b/drivers/staging/iio/resolver/ad2s1200.c
@@ -33,6 +33,14 @@
 /* clock period in nano second */
 #define AD2S1200_TSCLK	(1000000000 / AD2S1200_HZ)
 
+/**
+ * struct ad2s1200_state - driver instance specific data
+ * @lock:	protect driver state
+ * @sdev:	spi device
+ * @sample:	GPIO pin SAMPLE
+ * @rdvel:	GPIO pin RDVEL
+ * @rx:		buffer for spi transfers
+ */
 struct ad2s1200_state {
 	struct mutex lock;
 	struct spi_device *sdev;
-- 
2.16.2
