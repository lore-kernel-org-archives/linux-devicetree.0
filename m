From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/9] gpio: pl061: convert to use 0 for no irq
Date: Wed, 14 Dec 2011 09:28:54 -0600
Message-ID: <1323876538-20406-6-git-send-email-robherring2@gmail.com>
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

We don't want drivers using NO_IRQ, so remove its use. For now, 0 or
-1 means no irq until platforms are converted to use 0.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpio/gpio-pl061.c  |    8 ++++----
 include/linux/amba/pl061.h |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 0f718f9..fe19dec 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -53,7 +53,7 @@ struct pl061_gpio {
 	spinlock_t		irq_lock;	/* IRQ registers */
 
 	void __iomem		*base;
-	unsigned		irq_base;
+	int			irq_base;
 	struct gpio_chip	gc;
 };
 
@@ -119,7 +119,7 @@ static int pl061_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
 
-	if (chip->irq_base == NO_IRQ)
+	if (chip->irq_base <= 0)
 		return -EINVAL;
 
 	return chip->irq_base + offset;
@@ -250,7 +250,7 @@ static int pl061_probe(struct amba_device *dev, const struct amba_id *id)
 		chip->irq_base = pdata->irq_base;
 	} else if (dev->dev.of_node) {
 		chip->gc.base = -1;
-		chip->irq_base = NO_IRQ;
+		chip->irq_base = 0;
 	} else {
 		ret = -ENODEV;
 		goto free_mem;
@@ -290,7 +290,7 @@ static int pl061_probe(struct amba_device *dev, const struct amba_id *id)
 	 * irq_chip support
 	 */
 
-	if (chip->irq_base == NO_IRQ)
+	if (chip->irq_base <= 0)
 		return 0;
 
 	writeb(0, chip->base + GPIOIE); /* disable irqs */
diff --git a/include/linux/amba/pl061.h b/include/linux/amba/pl061.h
index 2412af9..fb83c04 100644
--- a/include/linux/amba/pl061.h
+++ b/include/linux/amba/pl061.h
@@ -7,7 +7,7 @@ struct pl061_platform_data {
 	unsigned	gpio_base;
 
 	/* number of the first IRQ.
-	 * If the IRQ functionality in not desired this must be set to NO_IRQ.
+	 * If the IRQ functionality in not desired this must be set to 0.
 	 */
 	unsigned	irq_base;
 
-- 
1.7.5.4
