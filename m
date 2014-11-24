From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND v5 1/2] watchdog: ImgTec PDC Watchdog Timer Driver
Date: Mon, 24 Nov 2014 11:41:34 -0300
Message-ID: <5473439E.4000901@imgtec.com>
References: <1416597957-10516-1-git-send-email-Naidu.Tellapati@gmail.com> <1416597957-10516-2-git-send-email-Naidu.Tellapati@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416597957-10516-2-git-send-email-Naidu.Tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: naidu.tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi Naidu,

Just a few nitpicks on my side. See below.

On 11/21/2014 04:25 PM, naidu.tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> 
> This commit adds support for ImgTec PowerDown Controller Watchdog Timer.
> 
> Signed-off-by: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
[..]
> +
> +struct pdc_wdt_dev {
> +	struct device *dev;

'dev' is unused.

> +	struct watchdog_device wdt_dev;
> +	struct clk *wdt_clk;
> +	struct clk *sys_clk;
> +	unsigned long clk_rate;

'clk_rate' is unused.

> +	int min_delay;
> +	void __iomem *base;
> +};
> +
[..]
> +
> +/* Start the watchdog timer (delay should already be set */

Typo here: missing closing parenthesis.

[..]
> +
> +static int pdc_wdt_probe(struct platform_device *pdev)
> +{
> +	int ret, val;
> +	struct resource *res;
> +	struct pdc_wdt_dev *pdc_wdt;
> +
> +	pdc_wdt = devm_kzalloc(&pdev->dev, sizeof(*pdc_wdt), GFP_KERNEL);
> +	if (!pdc_wdt)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	pdc_wdt->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(pdc_wdt->base))
> +		return PTR_ERR(pdc_wdt->base);
> +
> +	pdc_wdt->sys_clk = devm_clk_get(&pdev->dev, "sys");
> +	if (IS_ERR(pdc_wdt->sys_clk)) {
> +		dev_err(&pdev->dev, "failed to get the sys clock.\n");
> +		ret = PTR_ERR(pdc_wdt->wdt_clk);
> +		goto out_wdt;

I'd say remove all uses of the out_wdt label and just return ret.

Reviewed-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Wim: Any comments? We're aiming at having this driver merged for v3.19.

Thanks!
-- 
Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
