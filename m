From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] watchdog: ImgTec PDC Watchdog Timer Driver
Date: Mon, 17 Nov 2014 11:47:51 -0800
Message-ID: <CAL1qeaG1xXXmasLiaM14A+RshnqewnHsuQvxb76CNnwiuAXn_A@mail.gmail.com>
References: <1416237194-12033-1-git-send-email-naidu.tellapati@imgtec.com>
	<1416237194-12033-2-git-send-email-naidu.tellapati@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416237194-12033-2-git-send-email-naidu.tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naidu Tellapati <naidu.tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jude Abraham <jude.abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arul Ramasamy <arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 7:13 AM,  <naidu.tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> From: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>
> This commit adds support for ImgTec PowerDown Controller Watchdog Timer.
>
> Signed-off-by: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

A couple comments below, but otherwise this is looking good.

> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig

> @@ -1235,6 +1235,16 @@ config BCM_KONA_WDT_DEBUG
>
>           If in doubt, say 'N'.
>
> +config IMGPDC_WDT
> +       tristate "Imagination Technologies PDC Watchdog Timer"
> +       depends on HAS_IOMEM

We probably don't want to make this visible for everyone with
HAS_IOMEM, so perhaps MIPS || (HAS_IOMEM && COMPILE_TEST)?  Do we want
to make this available for META as well?

> --- /dev/null
> +++ b/drivers/watchdog/imgpdc_wdt.c

> +#ifdef CONFIG_COMMON_CLK
> +#define to_pdc_wdt(_nb) container_of(_nb, struct pdc_wdt_dev, clk_nb)
> +
> +static int img_pdc_wdt_clk_notify(struct notifier_block *nb,
> +                                 unsigned long action, void *data)
> +{
> +       struct pdc_wdt_dev *wdt = to_pdc_wdt(nb);
> +
> +       switch (action) {
> +       case POST_RATE_CHANGE:
> +               if (wdt->clk_rate == data->new_rate)
> +                       return NOTIFY_OK;
> +
> +               /* We use the clock rate to calculate the max timeout */
> +               if (data->new_rate < 1 ||
> +                   data->new_rate > PDC_MAX_WD_CLK_RATE) {
> +                       dev_err(wdt->dev, "invalid clock rate\n");
> +                       return NOTIFY_BAD;
> +               }
> +               wdt->clk_rate = data->new_rate;
> +               if (order_base_2(wdt->clk_rate) == 0)
> +                       wdt->min_delay = 0;
> +               else
> +                       wdt->min_delay = order_base_2(wdt->clk_rate) - 1;
> +
> +               wdt->wdt_dev.max_timeout =
> +                               (1 << (PDC_WD_MAX_DELAY - wdt->min_delay));
> +               ret = watchdog_init_timeout(&wdt->wdt_dev, timeout, wdt->dev);
> +               if (ret < 0)
> +                       wdt->wdt_dev.timeout = wdt->wdt_dev.max_timeout;
> +
> +               pdc_wdt_stop(&wdt->wdt_dev);
> +               pdc_wdt_set_timeout(&wdt->wdt_dev, wdt->wdt_dev.timeout);
> +               pdc_wdt_start(&wdt->wdt_dev);
> +               break;
> +       default:
> +               break;
> +       }
> +       return NOTIFY_OK;
> +}
> +#endif

Do we really expect the watchdog clock to change out from under us?  I
think we can just get the rate in probe() and set the timeout bounds
based on that - no one outside the watchdog driver should be messing
with the watchdog clock, right?  I know the samsung driver does
something similar to this, but I believe that's because the watchdog
clock is derived from the CPU clock.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
