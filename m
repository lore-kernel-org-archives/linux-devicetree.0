From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v8 5/5] regulator: RK808: Remove pdata from the regulator
Date: Wed, 3 Sep 2014 14:51:38 -0700
Message-ID: <CAD=FV=Xzz=SCHC1T5K1s1BcoLZGhUvYf+QMFUEyaPFZsHtSwfA@mail.gmail.com>
References: <1409752307-29044-1-git-send-email-zyw@rock-chips.com>
	<1409763974-29854-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409763974-29854-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Olof
List-Id: devicetree@vger.kernel.org

Chris,

On Wed, Sep 3, 2014 at 10:06 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> Tested-by: Heiko <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>
> Changes in v8:
> Adviced by Doug
> - remove rk808_regulator_dts() function
> - remove the check about "client->dev.of_node"

Nice, this cleaned this up a lot.  Thanks!


>  static int rk808_regulator_probe(struct platform_device *pdev)
>  {
>         struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
>         struct i2c_client *client = rk808->i2c;
> -       struct rk808_board *pdata = dev_get_platdata(&client->dev);
>         struct regulator_config config = {};
>         struct regulator_dev *rk808_rdev;
> -       struct regulator_init_data *reg_data;
> -       int i = 0;

As Heiko mentioned, you need "struct device_node *np, *reg_np;" here.

>         int ret = 0;
> +       int i = 0;

nit: I think neither "ret" nor "i" needs to be initted here.


Otherwise I agree that this looks really good!

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
