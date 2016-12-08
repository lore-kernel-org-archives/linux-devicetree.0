From: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Subject: [PATCH v2 2/6] iio: bmi160: Add of device table for spi
Date: Thu,  8 Dec 2016 15:22:55 +0100
Message-ID: <20161208142259.26230-3-m.niestroj@grinn-global.com>
References: <20161208142259.26230-1-m.niestroj@grinn-global.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161208142259.26230-1-m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>From now on we can add bmi160 device to device-tree by specifying
compatible string.

Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
---
Patch introduced in v2

 drivers/iio/imu/bmi160/bmi160_spi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/imu/bmi160/bmi160_spi.c b/drivers/iio/imu/bmi160/bmi160_spi.c
index 1ec8b12..d34dfdf 100644
--- a/drivers/iio/imu/bmi160/bmi160_spi.c
+++ b/drivers/iio/imu/bmi160/bmi160_spi.c
@@ -7,10 +7,11 @@
  * the GNU General Public License.  See the file COPYING in the main
  * directory of this archive for more details.
  */
+#include <linux/acpi.h>
 #include <linux/module.h>
-#include <linux/spi/spi.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
-#include <linux/acpi.h>
+#include <linux/spi/spi.h>
 
 #include "bmi160.h"
 
@@ -47,13 +48,22 @@ static const struct acpi_device_id bmi160_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, bmi160_acpi_match);
 
+#ifdef CONFIG_OF
+static const struct of_device_id bmi160_of_match[] = {
+	{ .compatible = "bosch,bmi160" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, bmi160_of_match);
+#endif
+
 static struct spi_driver bmi160_spi_driver = {
 	.probe		= bmi160_spi_probe,
 	.remove		= bmi160_spi_remove,
 	.id_table	= bmi160_spi_id,
 	.driver = {
-		.acpi_match_table = ACPI_PTR(bmi160_acpi_match),
-		.name	= "bmi160_spi",
+		.acpi_match_table	= ACPI_PTR(bmi160_acpi_match),
+		.of_match_table		= of_match_ptr(bmi160_of_match),
+		.name			= "bmi160_spi",
 	},
 };
 module_spi_driver(bmi160_spi_driver);
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
