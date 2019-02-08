From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 4/5] iio:adc:lpc32xx Cleanup headers
Date: Fri,  8 Feb 2019 17:09:43 +0100
Message-ID: <20190208160944.13281-5-gregory.clement@bootlin.com>
References: <20190208160944.13281-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208160944.13281-1-gregory.clement@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

A few headers was useless: remove them, and also sort them in alphabetic
order.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/iio/adc/lpc32xx_adc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/lpc32xx_adc.c b/drivers/iio/adc/lpc32xx_adc.c
index e361c1532a75..f391c1e10136 100644
--- a/drivers/iio/adc/lpc32xx_adc.c
+++ b/drivers/iio/adc/lpc32xx_adc.c
@@ -7,20 +7,13 @@
  *  Copyright (C) 2011, 2012 Roland Stigge <stigge@antcom.de>
  */
 
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/interrupt.h>
-#include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/io.h>
 #include <linux/clk.h>
-#include <linux/err.h>
 #include <linux/completion.h>
-#include <linux/of.h>
-
 #include <linux/iio/iio.h>
-#include <linux/iio/sysfs.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 
 /*
  * LPC32XX registers definitions
-- 
2.20.1
