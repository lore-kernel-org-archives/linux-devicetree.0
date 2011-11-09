From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC 2/8] gpio/powerpc: Eliminate duplication of
 of_get_named_gpio_flags()
Date: Tue,  8 Nov 2011 18:19:37 -0700
Message-ID: <1320801583-12774-3-git-send-email-grant.likely@secretlab.ca>
References: <1320801583-12774-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320801583-12774-1-git-send-email-grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

A large chunk of qe_pin_request() is unnecessarily cut-and-paste
directly from of_get_named_gpio_flags().  This patch cuts out the
duplicate code and replaces it with a call to of_get_gpio().

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---
 arch/powerpc/sysdev/qe_lib/gpio.c |   42 +++++++-----------------------------
 1 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/sysdev/qe_lib/gpio.c b/arch/powerpc/sysdev/qe_lib/gpio.c
index e23f23c..521e67a 100644
--- a/arch/powerpc/sysdev/qe_lib/gpio.c
+++ b/arch/powerpc/sysdev/qe_lib/gpio.c
@@ -139,14 +139,10 @@ struct qe_pin {
 struct qe_pin *qe_pin_request(struct device_node *np, int index)
 {
 	struct qe_pin *qe_pin;
-	struct device_node *gpio_np;
 	struct gpio_chip *gc;
 	struct of_mm_gpio_chip *mm_gc;
 	struct qe_gpio_chip *qe_gc;
 	int err;
-	int size;
-	const void *gpio_spec;
-	const u32 *gpio_cells;
 	unsigned long flags;
 
 	qe_pin = kzalloc(sizeof(*qe_pin), GFP_KERNEL);
@@ -155,45 +151,25 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	err = of_parse_phandles_with_args(np, "gpios", "#gpio-cells", index,
-					  &gpio_np, &gpio_spec);
-	if (err) {
-		pr_debug("%s: can't parse gpios property\n", __func__);
+	err = of_get_gpio(np, index);
+	if (err < 0)
+		goto err0;
+	gc = gpio_to_chip(err);
+	if (WARN_ON(!gc))
 		goto err0;
-	}
 
-	if (!of_device_is_compatible(gpio_np, "fsl,mpc8323-qe-pario-bank")) {
+	if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
 		pr_debug("%s: tried to get a non-qe pin\n", __func__);
 		err = -EINVAL;
-		goto err1;
-	}
-
-	gc = of_node_to_gpiochip(gpio_np);
-	if (!gc) {
-		pr_debug("%s: gpio controller %s isn't registered\n",
-			 np->full_name, gpio_np->full_name);
-		err = -ENODEV;
-		goto err1;
-	}
-
-	gpio_cells = of_get_property(gpio_np, "#gpio-cells", &size);
-	if (!gpio_cells || size != sizeof(*gpio_cells) ||
-			*gpio_cells != gc->of_gpio_n_cells) {
-		pr_debug("%s: wrong #gpio-cells for %s\n",
-			 np->full_name, gpio_np->full_name);
-		err = -EINVAL;
-		goto err1;
+		goto err0;
 	}
 
-	err = gc->of_xlate(gc, np, gpio_spec, NULL);
-	if (err < 0)
-		goto err1;
-
 	mm_gc = to_of_mm_gpio_chip(gc);
 	qe_gc = to_qe_gpio_chip(mm_gc);
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
 
+	err -= gc->base;
 	if (test_and_set_bit(QE_PIN_REQUESTED, &qe_gc->pin_flags[err]) == 0) {
 		qe_pin->controller = qe_gc;
 		qe_pin->num = err;
@@ -206,8 +182,6 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 
 	if (!err)
 		return qe_pin;
-err1:
-	of_node_put(gpio_np);
 err0:
 	kfree(qe_pin);
 	pr_debug("%s failed with status %d\n", __func__, err);
-- 
1.7.5.4
