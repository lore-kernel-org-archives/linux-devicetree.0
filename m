From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/irq: Export of_irq_count()
Date: Tue, 5 Jan 2016 08:26:52 -0600
Message-ID: <CAL_Jsq+b1m0JM18LRdu41j88nv_ua7gayopqeUSsVhczc9PqpQ@mail.gmail.com>
References: <1450786942-13292-1-git-send-email-broonie@kernel.org>
 <CAL_JsqJELQc316UkkpzLrbSsYMYh69uxX5Jw8p4TpWm6eqmfuA@mail.gmail.com> <20160105000454.GB22188@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160105000454.GB22188-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 4, 2016 at 6:04 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 12/22, Rob Herring wrote:
>> On Tue, Dec 22, 2015 at 6:22 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> > Some of the Qualcomm pinctrl drivers have started trying to use
>> > of_irq_count() in modular code but this fails to build as the symbol is
>> > not exported.  Since there doesn't seem to be any reason not to export
>> > the symbol make it available to modules.
>>
>> The reason it has not been exported is because we want to stick with
>> the platform_* APIs for IRQs. There's not really an equivalent
>> function though. Perhaps we should make one? Usually it is just used
>> for allocating some driver data. If that is the case, is it really
>> enough data to not just allocate the max?
>>
>
> It's mostly used for allocation but we also do some pin type
> discovery by reading registers and that would fail if we went
> past the actual number of pins there are.
>
> So how about implementing platform_irq_count()? I'd like to keep
> these drivers as tristate if possible.

Ack.

> ----8<----
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index d77ed0c946dd..421c67f8fdef 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -118,6 +118,25 @@ int platform_get_irq(struct platform_device *dev, unsigned int num)
>  EXPORT_SYMBOL_GPL(platform_get_irq);
>
>  /**
> + * platform_irq_count - Count the number of IRQs a platform device uses
> + * @dev: platform device
> + *
> + * Return: Number of IRQs a platform device uses or EPROBE_DEFER
> + */
> +int platform_irq_count(struct platform_device *dev)
> +{
> +       int ret, nr = 0;
> +
> +       while ((ret = platform_get_irq(dev, nr)) == 0)
> +               nr++;
> +
> +       if (ret == -EPROBE_DEFER)
> +               return ret;
> +
> +       return nr;
> +}

Don't forget the export here. :)

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
