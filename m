From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 2/6] pinctrl: rockchip: save and restore gpio6_c6
 pinmux in suspend/resume
Date: Tue, 21 Oct 2014 21:33:19 -0700
Message-ID: <CAD=FV=W05jEfViCGyz76myP2k7-WFrXwB+o3pzCwCj5kob2TVg@mail.gmail.com>
References: <1413933461-25602-1-git-send-email-zyw@rock-chips.com>
	<1413933588-25721-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413933588-25721-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Chris,

On Tue, Oct 21, 2014 at 4:19 PM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:

> +static u32 rk3288_grf_gpio6c_iomux;

Somehow my instinct says that this should be in the "info" structure,
but I can't say exactly why (since by definition there can be only one
gpio6_c6).  ...no need to change this in my opinion.


>  static int rockchip_pinctrl_suspend(struct device *dev)
>  {
>         struct rockchip_pinctrl *info = dev_get_drvdata(dev);
> +       int ret = pinctrl_force_sleep(info->pctl_dev);
> +
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * RK3288 GPIO6_C6 mux would be modified by Maskrom when resume, so save
> +        * the setting here, and restore it at resume.
> +        */
> +       if (info->ctrl->type == RK3288) {
> +               ret = regmap_read(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
> +                                 &rk3288_grf_gpio6c_iomux);
> +               if (ret)
> +                       return ret;

I seriously doubt it matters, but as a nit it seems like you should
call pinctrl_force_default() in the error case (to undo
pinctrl_force_sleep).


Everything is just nits and this works for me, so:

Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
