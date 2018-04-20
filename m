From: David Veenstra <davidjulianveenstra@gmail.com>
Subject: [PATCH v2 01/13] staging: iio: ad2s1200: Remove unneeded include
Date: Fri, 20 Apr 2018 21:28:32 +0200
Message-ID: <08612b1148da933e8ac8ca190250db4c58f6a682.1524247563.git.davidjulianveenstra@gmail.com>
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

This patches removes unneeded slab.h header.

Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
---
Changes in v2:
  - Introduced in this version.

drivers/staging/iio/resolver/ad2s1200.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
index aa62c64e9bc4..5d7ed0034422 100644
--- a/drivers/staging/iio/resolver/ad2s1200.c
+++ b/drivers/staging/iio/resolver/ad2s1200.c
@@ -13,7 +13,6 @@
 #include <linux/mutex.h>
 #include <linux/device.h>
 #include <linux/spi/spi.h>
-#include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
-- 
2.16.2
