From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/9] gpio: pl061: use chained_irq_* functions in irq handler
Date: Wed, 14 Dec 2011 09:28:53 -0600
Message-ID: <1323876538-20406-5-git-send-email-robherring2@gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323876538-20406-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Use chained_irq_enter/exit helper functions instead of direct pointer
accesses. This is needed for generic irq chip conversion.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpio/gpio-pl061.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 4102f63..0f718f9 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -23,6 +23,7 @@
 #include <linux/amba/bus.h>
 #include <linux/amba/pl061.h>
 #include <linux/slab.h>
+#include <asm/mach/irq.h>
 
 #define GPIODIR 0x400
 #define GPIOIS  0x404
@@ -211,8 +212,9 @@ static void pl061_irq_handler(unsigned irq, struct irq_desc *desc)
 	struct list_head *chip_list = irq_get_handler_data(irq);
 	struct list_head *ptr;
 	struct pl061_gpio *chip;
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 
-	desc->irq_data.chip->irq_ack(&desc->irq_data);
+	chained_irq_enter(irqchip, desc);
 	list_for_each(ptr, chip_list) {
 		unsigned long pending;
 		int offset;
@@ -227,7 +229,7 @@ static void pl061_irq_handler(unsigned irq, struct irq_desc *desc)
 		for_each_set_bit(offset, &pending, PL061_GPIO_NR)
 			generic_handle_irq(pl061_to_irq(&chip->gc, offset));
 	}
-	desc->irq_data.chip->irq_unmask(&desc->irq_data);
+	chained_irq_exit(irqchip, desc);
 }
 
 static int pl061_probe(struct amba_device *dev, const struct amba_id *id)
-- 
1.7.5.4
