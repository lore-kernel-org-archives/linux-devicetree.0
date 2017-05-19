From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 1/6] gpio: mvebu: sort header include
Date: Fri, 19 May 2017 18:09:20 +0200
Message-ID: <91fd5ea411ae61145768a0c940ba231b290d57ef.1495210061.git-series.gregory.clement@free-electrons.com>
References: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement@free-electrons.com>
References: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

This commit sorts alphabetically the header files.

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/gpio/gpio-mvebu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 19a92efabbef..a9e564f3410b 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -33,21 +33,21 @@
  *   interrupts.
  */
 
+#include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/err.h>
-#include <linux/init.h>
 #include <linux/gpio.h>
+#include <linux/init.h>
+#include <linux/io.h>
 #include <linux/irq.h>
-#include <linux/slab.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
-#include <linux/io.h>
-#include <linux/of_irq.h>
 #include <linux/of_device.h>
-#include <linux/pwm.h>
-#include <linux/clk.h>
+#include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
-#include <linux/irqchip/chained_irq.h>
 #include <linux/platform_device.h>
-#include <linux/bitops.h>
+#include <linux/pwm.h>
+#include <linux/slab.h>
 
 #include "gpiolib.h"
 
-- 
git-series 0.9.1
