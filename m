From: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 5/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Tue, 02 Jun 2015 10:32:37 -0500
Message-ID: <556DCC95.806@codeaurora.org>
References: <=fu.wei@linaro.org> <1433217907-928-1-git-send-email-fu.wei@linaro.org> <1433217907-928-6-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433217907-928-6-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/01/2015 11:05 PM, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:

> +/*
> + * help functions for accessing 32bit registers of SBSA Generic Watchdog
> + */
> +static void sbsa_gwdt_cf_write(unsigned int reg, u32 val,
> +			       struct watchdog_device *wdd)
> +{
> +	struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
> +
> +	writel_relaxed(val, gwdt->control_base + reg);
> +}
> +
> +static void sbsa_gwdt_rf_write(unsigned int reg, u32 val,
> +			       struct watchdog_device *wdd)
> +{
> +	struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
> +
> +	writel_relaxed(val, gwdt->refresh_base + reg);
> +}
> +
> +static u32 sbsa_gwdt_cf_read(unsigned int reg, struct watchdog_device *wdd)
> +{
> +	struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
> +
> +	return readl_relaxed(gwdt->control_base + reg);
> +}

I still think you should get rid of these functions and just call 
readl_relaxed() and writel_relaxed() every time, but I won't complain 
again if you keep them.

> +static irqreturn_t sbsa_gwdt_interrupt(int irq, void *dev_id)
> +{
> +	struct sbsa_gwdt *gwdt = (struct sbsa_gwdt *)dev_id;
> +	struct watchdog_device *wdd = &gwdt->wdd;
> +
> +	if (wdd->pretimeout)
> +		/* The pretimeout is valid, go panic */
> +		panic("SBSA Watchdog pre-timeout");
> +	else
> +		/* We don't use pretimeout, trigger WS1 now*/
> +		sbsa_gwdt_set_wcv(wdd, 0);

I don't like this.  The triggering of the hardware reset should never 
depend on an interrupt being handled properly.  You should always 
program WCV correctly in advance.  This is especially true since 
pre-timeout will probably rarely be used.  So what happens if the CPU is 
totally hung and this interrupt handler is never called?  When will the 
timeout occur?

> +static int sbsa_gwdt_probe(struct platform_device *pdev)
> +{
> +	u64 first_period_max = U64_MAX;
> +	struct device *dev = &pdev->dev;
> +	struct watchdog_device *wdd;
> +	struct sbsa_gwdt *gwdt;
> +	struct resource *res;
> +	void *rf_base, *cf_base;
> +	int ret, irq;
> +	u32 status;
> +
> +	gwdt = devm_kzalloc(dev, sizeof(*gwdt), GFP_KERNEL);
> +	if (!gwdt)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, gwdt);

You should probably do this *after* calling platform_get_irq_byname().

> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "refresh");
> +	rf_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(rf_base))
> +		return PTR_ERR(rf_base);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "control");
> +	cf_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(cf_base))
> +		return PTR_ERR(cf_base);
> +
> +	irq = platform_get_irq_byname(pdev, "ws0");
> +	if (irq < 0) {
> +		dev_err(dev, "unable to get ws0 interrupt.\n");
> +		return irq;
> +	}
> +
> +	/*
> +	 * Get the frequency of system counter from the cp15 interface of ARM
> +	 * Generic timer. We don't need to check it, because if it returns "0",
> +	 * system would panic in very early stage.
> +	 */
> +	gwdt->clk = arch_timer_get_cntfrq();
> +	gwdt->refresh_base = rf_base;
> +	gwdt->control_base = cf_base;
> +
> +	wdd = &gwdt->wdd;
> +	wdd->parent = dev;
> +	wdd->info = &sbsa_gwdt_info;
> +	wdd->ops = &sbsa_gwdt_ops;
> +	watchdog_set_drvdata(wdd, gwdt);
> +	watchdog_set_nowayout(wdd, nowayout);
> +
> +	wdd->min_pretimeout = 0;
> +	wdd->max_pretimeout = U32_MAX / gwdt->clk;
> +	wdd->min_timeout = 1;
> +	do_div(first_period_max, gwdt->clk);
> +	wdd->max_timeout = first_period_max;
> +
> +	wdd->pretimeout = DEFAULT_PRETIMEOUT;
> +	wdd->timeout = DEFAULT_TIMEOUT;
> +	watchdog_init_timeouts(wdd, pretimeout, timeout, dev);
> +
> +	status = sbsa_gwdt_cf_read(SBSA_GWDT_WCS, wdd);
> +	if (status & SBSA_GWDT_WCS_WS1) {
> +		dev_warn(dev, "System reset by WDT(WCV: %llx)\n",
> +			 sbsa_gwdt_get_wcv(wdd));

"System was previously reset via watchdog" is much clearer.

> +		wdd->bootstatus |= WDIOF_CARDRESET;
> +	}
> +	/* Check if watchdog is already enabled */
> +	if (status & SBSA_GWDT_WCS_EN) {
> +		dev_warn(dev, "already enabled!\n");

"watchdog is already enabled".  Never use exclamation marks in kernel 
messages.

> +		sbsa_gwdt_keepalive(wdd);
> +	}
> +
> +	/* update pretimeout to WOR */
> +	sbsa_gwdt_set_pretimeout(wdd, wdd->pretimeout);
> +
> +	ret = devm_request_irq(dev, irq, sbsa_gwdt_interrupt, 0,
> +			       pdev->name, gwdt);
> +	if (ret) {
> +		dev_err(dev, "unable to request IRQ %d\n", irq);
> +		return ret;
> +	}
> +
> +	ret = watchdog_register_device(wdd);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "Initialized with %ds timeout, %ds pretimeout @ %u Hz\n",
> +		 wdd->timeout, wdd->pretimeout, gwdt->clk);

if (wdd->pretimeout)
	"watchdog initialized to %us timeout and %us pre-timeout at %u Hz\n", 
wdd->timeout, wdd->pretimeout, gwdt->clk
else
	"watchdog initialized to %us timeout at %u Hz\n", wdd->timeout, gwdt->clk

I think it's unlikely that users will use pre-timeout, so your code 
should treat pre-timeout as a special case, not the normal usage.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
