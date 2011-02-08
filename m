From: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Subject: Re: [Nios2-dev] [PATCH v2] watchdog: Add driver for Altera Watchdog
	Timer
Date: Tue, 08 Feb 2011 23:54:33 +0100
Message-ID: <4D51C9A9.4060306@home.nl>
References: <1294829027-15029-1-git-send-email-tklauser@distanz.ch>
	<1297171322-32401-1-git-send-email-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1297171322-32401-1-git-send-email-tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Tobias,

One small remark below, looks ok otherwise.
Thanks for the work you put into this!

On 2/8/11 2:22 PM, Tobias Klauser wrote:
[...]
> +static struct miscdevice altera_wdt_miscdev = {
> +	.minor	= WATCHDOG_MINOR,
> +	.name	= "watchdog",
> +	.fops	=&altera_wdt_fops,
> +};
> +
> +static int __devinit altera_wdt_probe(struct platform_device *pdev)
> +{
> +	struct resource *res, *mem;
> +	const u32 *freq_prop, *timeout_prop;
Type should be const __be32 * here.
> +	unsigned long timeout;
> +	int ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENOENT;
> +
> +	mem = devm_request_mem_region(&pdev->dev, res->start,
> +				      resource_size(res), pdev->name);
> +	if (!mem)
> +		return -EBUSY;
> +
> +	altera_wdt_priv.base = devm_ioremap_nocache(&pdev->dev, mem->start,
> +						    resource_size(mem));
> +	if (!altera_wdt_priv.base)
> +		return -ENOMEM;
> +
> +	freq_prop = of_get_property(pdev->dev.of_node, "clock-frequency", NULL);
> +	if (!freq_prop)
> +		return -ENODEV;
> +
> +	timeout_prop = of_get_property(pdev->dev.of_node, "timeout", NULL);
> +	if (!timeout_prop)
> +		return -ENODEV;
> +
> +	/* Add 1 as the timeout property actually holds the load value */
> +	timeout = be32_to_cpup(timeout_prop) + 1;
> +	/* Convert timeout to msecs */
> +	timeout = timeout / (be32_to_cpup(freq_prop) / MSEC_PER_SEC);
> +	/* Tickle the watchdog twice per timeout period */
> +	altera_wdt_priv.wdt_timeout = msecs_to_jiffies(timeout / 2);
> +
> +	ret = misc_register(&altera_wdt_miscdev);
> +	if (ret)
> +		return ret;
> +
> +	altera_wdt_setup();
> +	altera_wdt_priv.next_heartbeat = jiffies + heartbeat * HZ;
> +	setup_timer(&altera_wdt_priv.timer, altera_wdt_ping, 0);
> +	mod_timer(&altera_wdt_priv.timer, jiffies + altera_wdt_priv.wdt_timeout);
> +
> +	pr_info(WATCHDOG_NAME " enabled (heartbeat=%d sec, nowayout=%d)\n",
> +		heartbeat, nowayout);
> +
> +	return 0;
> +}
> +
> +static int __devexit altera_wdt_remove(struct platform_device *pdev)
> +{
> +	misc_deregister(&altera_wdt_miscdev);
> +	return 0;
> +}
> +
> +static struct of_device_id altera_wdt_match[] = {
> +	{ .compatible = "ALTR,wdt-1.0", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, altera_wdt_match);
> +
> +static struct platform_driver altera_wdt_driver = {
> +	.probe		= altera_wdt_probe,
> +	.remove		= __devexit_p(altera_wdt_remove),
> +	.driver		= {
> +		.owner		= THIS_MODULE,
> +		.name		= WATCHDOG_NAME,
> +		.of_match_table	= altera_wdt_match,
> +	},
> +};
> +
> +static int __init altera_wdt_init(void)
> +{
> +	return platform_driver_register(&altera_wdt_driver);
> +}
> +
> +static void __exit altera_wdt_exit(void)
> +{
> +	platform_driver_unregister(&altera_wdt_driver);
> +}
> +
> +module_init(altera_wdt_init);
> +module_exit(altera_wdt_exit);
> +
> +MODULE_AUTHOR("Walter Goossens, Tobias Klauser<tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>");
> +MODULE_DESCRIPTION("Driver for Altera Watchdog Timer");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS_MISCDEV(WATCHDOG_MINOR);
> +MODULE_ALIAS("platform:" WATCHDOG_NAME);
