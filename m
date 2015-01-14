From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 1/2] pinctrl: at91: allow disabled gpio controllers
Date: Wed, 14 Jan 2015 21:45:12 +0100
Message-ID: <20150114204512.GB14457@ns203013.ovh.net>
References: <1417193367-12422-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1417193367-12422-1-git-send-email-ludovic.desroches@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org, nicolas.ferre@atmel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17:49 Fri 28 Nov     , Ludovic Desroches wrote:
> This patch allows to have gpio controller with status set to disabled.
> 
> gpio_banks represents all the gpio banks available on the device whereas
> nbanks represents the gpio banks used. Having a disabled gpio controller
> involves that nbanks value is lower than gpio_banks and that some
> pointers in the gpio_chips array are NULL. This patch deals with these
> specific cases.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
> 
> Hi,
> 
> Without this patch, pinctrl is broken on sama5d4 because pinctrl-at91 doesn't
> support unused gpio bank.

the problem is different

The current code does support this partially

but need to have few by using gpio_banks for the pinctrl part instead of
info->banks
as we already known the last enabled bank

> 
> 
>  drivers/pinctrl/pinctrl-at91.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index 94643bb..95ae122 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -981,7 +981,8 @@ static void at91_pinctrl_child_count(struct at91_pinctrl *info,
>  
>  	for_each_child_of_node(np, child) {
>  		if (of_device_is_compatible(child, gpio_compat)) {
> -			info->nbanks++;
> +			if (of_device_is_available(child))
> +				info->nbanks++;
>  		} else {
>  			info->nfunctions++;
>  			info->ngroups += of_get_child_count(child);
> @@ -1003,11 +1004,11 @@ static int at91_pinctrl_mux_mask(struct at91_pinctrl *info,
>  	}
>  
>  	size /= sizeof(*list);
> -	if (!size || size % info->nbanks) {
> +	if (!size || size % gpio_banks) {
>  		dev_err(info->dev, "wrong mux mask array should be by %d\n", info->nbanks);
>  		return -EINVAL;
>  	}
> -	info->nmux = size / info->nbanks;
> +	info->nmux = size / gpio_banks;
>  
>  	info->mux_mask = devm_kzalloc(info->dev, sizeof(u32) * size, GFP_KERNEL);
>  	if (!info->mux_mask) {
> @@ -1185,7 +1186,7 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
>  {
>  	struct at91_pinctrl *info;
>  	struct pinctrl_pin_desc *pdesc;
> -	int ret, i, j, k;
> +	int ret, i, j, k, ngpio_chips_enabled = 0;
>  
>  	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>  	if (!info)
> @@ -1200,12 +1201,14 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
>  	 * to obtain references to the struct gpio_chip * for them, and we
>  	 * need this to proceed.
>  	 */
> -	for (i = 0; i < info->nbanks; i++) {
> -		if (!gpio_chips[i]) {
> -			dev_warn(&pdev->dev, "GPIO chip %d not registered yet\n", i);
> -			devm_kfree(&pdev->dev, info);
> -			return -EPROBE_DEFER;
> -		}
> +	for (i = 0; i < gpio_banks; i++) {
> +		if (gpio_chips[i])
> +			ngpio_chips_enabled++;
> +	}
> +	if (ngpio_chips_enabled < info->nbanks) {
> +		dev_warn(&pdev->dev, "All GPIO chips are not registered yet\n");
> +		devm_kfree(&pdev->dev, info);
> +		return -EPROBE_DEFER;
>  	}
>  
>  	at91_pinctrl_desc.name = dev_name(&pdev->dev);
> @@ -1234,8 +1237,9 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
>  	}
>  
>  	/* We will handle a range of GPIO pins */
> -	for (i = 0; i < info->nbanks; i++)
> -		pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
> +	for (i = 0; i < gpio_banks; i++)
> +		if (gpio_chips[i])
> +			pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
>  
>  	dev_info(&pdev->dev, "initialized AT91 pinctrl driver\n");
>  
> @@ -1681,6 +1685,8 @@ static void at91_gpio_probe_fixup(void)
>  
>  	for (i = 0; i < gpio_banks; i++) {
>  		at91_gpio = gpio_chips[i];
> +		if (!at91_gpio)
> +			continue;

here Nack

as if you disable ANY of the bank that use pioc you break the IRQ support

attached a patch we the idea how to handle the current issue
only compiled not tested (too late here)

Best Regards,
J.
>  
>  		/*
>  		 * GPIO controller are grouped on some SoC:
> -- 
> 2.0.3
> 

--ikeVEW9yuYc//A+q
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-pinctrl-at91-allow-to-have-disable-gpio-bank.patch"

>From c94cb27d4d4feb2d3af8d7eeffa34f8ea9484db7 Mon Sep 17 00:00:00 2001
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Thu, 15 Jan 2015 04:00:46 +0800
Subject: [PATCH 1/1] pinctrl: at91: allow to have disable gpio bank

Today we expect that all the bank are enabled, and count the number of banks
used by the pinctrl based on it instead of using the last bank id enabled.

So switch to it

And set the chained IRQ at runtime based on enabled banks

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 drivers/pinctrl/pinctrl-at91.c | 94 ++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 50 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 354a81d..170e67f 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -655,12 +655,18 @@ static int pin_check_config(struct at91_pinctrl *info, const char *name,
 	int mux;
 
 	/* check if it's a valid config */
-	if (pin->bank >= info->nbanks) {
+	if (pin->bank >= gpio_banks) {
 		dev_err(info->dev, "%s: pin conf %d bank_id %d >= nbanks %d\n",
-			name, index, pin->bank, info->nbanks);
+			name, index, pin->bank, gpio_banks);
 		return -EINVAL;
 	}
 
+	if (!gpio_chips[pin->bank]) {
+		dev_err(info->dev, "%s: pin conf %d bank_id %d not enabled\n",
+			name, index, pin->bank);
+		return -ENXIO;
+	}
+
 	if (pin->pin >= MAX_NB_GPIO_PER_BANK) {
 		dev_err(info->dev, "%s: pin conf %d pin_bank_id %d >= %d\n",
 			name, index, pin->pin, MAX_NB_GPIO_PER_BANK);
@@ -982,12 +988,10 @@ static void at91_pinctrl_child_count(struct at91_pinctrl *info,
 	struct device_node *child;
 
 	for_each_child_of_node(np, child) {
-		if (of_device_is_compatible(child, gpio_compat)) {
-			info->nbanks++;
-		} else {
-			info->nfunctions++;
-			info->ngroups += of_get_child_count(child);
-		}
+		if (of_device_is_compatible(child, gpio_compat))
+			continue;
+		info->nfunctions++;
+		info->ngroups += of_get_child_count(child);
 	}
 }
 
@@ -1005,11 +1009,11 @@ static int at91_pinctrl_mux_mask(struct at91_pinctrl *info,
 	}
 
 	size /= sizeof(*list);
-	if (!size || size % info->nbanks) {
-		dev_err(info->dev, "wrong mux mask array should be by %d\n", info->nbanks);
+	if (!size || size % gpio_banks) {
+		dev_err(info->dev, "wrong mux mask array should be by %d\n", gpio_banks);
 		return -EINVAL;
 	}
-	info->nmux = size / info->nbanks;
+	info->nmux = size / gpio_banks;
 
 	info->mux_mask = devm_kzalloc(info->dev, sizeof(u32) * size, GFP_KERNEL);
 	if (!info->mux_mask) {
@@ -1133,7 +1137,7 @@ static int at91_pinctrl_probe_dt(struct platform_device *pdev,
 		of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
 	at91_pinctrl_child_count(info, np);
 
-	if (info->nbanks < 1) {
+	if (gpio_banks < 1) {
 		dev_err(&pdev->dev, "you need to specify at least one gpio-controller\n");
 		return -EINVAL;
 	}
@@ -1146,7 +1150,7 @@ static int at91_pinctrl_probe_dt(struct platform_device *pdev,
 
 	dev_dbg(&pdev->dev, "mux-mask\n");
 	tmp = info->mux_mask;
-	for (i = 0; i < info->nbanks; i++) {
+	for (i = 0; i < gpio_banks; i++) {
 		for (j = 0; j < info->nmux; j++, tmp++) {
 			dev_dbg(&pdev->dev, "%d:%d\t0x%x\n", i, j, tmp[0]);
 		}
@@ -1164,7 +1168,7 @@ static int at91_pinctrl_probe_dt(struct platform_device *pdev,
 	if (!info->groups)
 		return -ENOMEM;
 
-	dev_dbg(&pdev->dev, "nbanks = %d\n", info->nbanks);
+	dev_dbg(&pdev->dev, "nbanks = %d\n", gpio_banks);
 	dev_dbg(&pdev->dev, "nfunctions = %d\n", info->nfunctions);
 	dev_dbg(&pdev->dev, "ngroups = %d\n", info->ngroups);
 
@@ -1202,7 +1206,7 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 	 * to obtain references to the struct gpio_chip * for them, and we
 	 * need this to proceed.
 	 */
-	for (i = 0; i < info->nbanks; i++) {
+	for (i = 0; i < gpio_banks; i++) {
 		if (!gpio_chips[i]) {
 			dev_warn(&pdev->dev, "GPIO chip %d not registered yet\n", i);
 			devm_kfree(&pdev->dev, info);
@@ -1211,14 +1215,14 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	at91_pinctrl_desc.name = dev_name(&pdev->dev);
-	at91_pinctrl_desc.npins = info->nbanks * MAX_NB_GPIO_PER_BANK;
+	at91_pinctrl_desc.npins = gpio_banks * MAX_NB_GPIO_PER_BANK;
 	at91_pinctrl_desc.pins = pdesc =
 		devm_kzalloc(&pdev->dev, sizeof(*pdesc) * at91_pinctrl_desc.npins, GFP_KERNEL);
 
 	if (!at91_pinctrl_desc.pins)
 		return -ENOMEM;
 
-	for (i = 0 , k = 0; i < info->nbanks; i++) {
+	for (i = 0 , k = 0; i < gpio_banks; i++) {
 		for (j = 0; j < MAX_NB_GPIO_PER_BANK; j++, k++) {
 			pdesc->number = k;
 			pdesc->name = kasprintf(GFP_KERNEL, "pio%c%d", i + 'A', j);
@@ -1236,7 +1240,7 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	/* We will handle a range of GPIO pins */
-	for (i = 0; i < info->nbanks; i++)
+	for (i = 0; i < gpio_banks; i++)
 		pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
 
 	dev_info(&pdev->dev, "initialized AT91 pinctrl driver\n");
@@ -1614,9 +1618,10 @@ static void gpio_irq_handler(unsigned irq, struct irq_desc *desc)
 static int at91_gpio_of_irq_setup(struct platform_device *pdev,
 				  struct at91_gpio_chip *at91_gpio)
 {
+	struct gpio_chip	*gpiochip_prev = NULL;
 	struct at91_gpio_chip   *prev = NULL;
 	struct irq_data		*d = irq_get_irq_data(at91_gpio->pioc_virq);
-	int ret;
+	int ret, i;
 
 	at91_gpio->pioc_hwirq = irqd_to_hwirq(d);
 
@@ -1642,24 +1647,33 @@ static int at91_gpio_of_irq_setup(struct platform_device *pdev,
 		return ret;
 	}
 
-	/* Setup chained handler */
-	if (at91_gpio->pioc_idx)
-		prev = gpio_chips[at91_gpio->pioc_idx - 1];
-
 	/* The top level handler handles one bank of GPIOs, except
 	 * on some SoC it can handle up to three...
 	 * We only set up the handler for the first of the list.
 	 */
-	if (prev && prev->next == at91_gpio)
+	gpiochip_prev = irq_get_handler_data(at91_gpio->pioc_virq);
+	if (!gpiochip_prev) {
+		/* Then register the chain on the parent IRQ */
+		gpiochip_set_chained_irqchip(&at91_gpio->chip,
+					     &gpio_irqchip,
+					     at91_gpio->pioc_virq,
+					     gpio_irq_handler);
 		return 0;
+	}
 
-	/* Then register the chain on the parent IRQ */
-	gpiochip_set_chained_irqchip(&at91_gpio->chip,
-				     &gpio_irqchip,
-				     at91_gpio->pioc_virq,
-				     gpio_irq_handler);
+	prev = container_of(gpiochip_prev, struct at91_gpio_chip, chip);
 
-	return 0;
+	/* we can only have 2 banks before */
+	for (i = 0; i < 2; i++) {
+		if (prev->next) {
+			prev = prev->next;
+		} else {
+			prev->next = at91_gpio;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
 }
 
 /* This structure is replicated for each GPIO block allocated at probe time */
@@ -1676,24 +1690,6 @@ static struct gpio_chip at91_gpio_template = {
 	.ngpio			= MAX_NB_GPIO_PER_BANK,
 };
 
-static void at91_gpio_probe_fixup(void)
-{
-	unsigned i;
-	struct at91_gpio_chip *at91_gpio, *last = NULL;
-
-	for (i = 0; i < gpio_banks; i++) {
-		at91_gpio = gpio_chips[i];
-
-		/*
-		 * GPIO controller are grouped on some SoC:
-		 * PIOC, PIOD and PIOE can share the same IRQ line
-		 */
-		if (last && last->pioc_virq == at91_gpio->pioc_virq)
-			last->next = at91_gpio;
-		last = at91_gpio;
-	}
-}
-
 static struct of_device_id at91_gpio_of_match[] = {
 	{ .compatible = "atmel,at91sam9x5-gpio", .data = &at91sam9x5_ops, },
 	{ .compatible = "atmel,at91rm9200-gpio", .data = &at91rm9200_ops },
@@ -1806,8 +1802,6 @@ static int at91_gpio_probe(struct platform_device *pdev)
 	gpio_chips[alias_idx] = at91_chip;
 	gpio_banks = max(gpio_banks, alias_idx + 1);
 
-	at91_gpio_probe_fixup();
-
 	ret = at91_gpio_of_irq_setup(pdev, at91_chip);
 	if (ret)
 		goto irq_setup_err;
-- 
2.1.3


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--ikeVEW9yuYc//A+q--
