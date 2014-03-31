From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] GPIO: Add driver for Zynq GPIO controller
Date: Mon, 31 Mar 2014 10:22:09 +0200
Message-ID: <CACRpkdZEFsJubRVwCp6nTie7s7+DZOym6SWsA2ZynN_devi-2Q@mail.gmail.com>
References: <1395933906-2268-1-git-send-email-harinik@xilinx.com>
	<CACRpkdbU35xG1QtagB+9e9vxvehf1UQFaF4PikJhsPNAMw=D1Q@mail.gmail.com>
	<CAFcVECJsEp_s2V5=oK_UJahGRUpWYWMCxTMxqdpX+O0qebP41A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFcVECJsEp_s2V5=oK_UJahGRUpWYWMCxTMxqdpX+O0qebP41A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harini Katakam <harinikatakamlinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 29, 2014 at 5:44 AM, Harini Katakam
<harinikatakamlinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sat, Mar 29, 2014 at 3:20 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Thu, Mar 27, 2014 at 4:25 PM, Harini Katakam <harinik-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:

>>> +/* Read/Write access to the GPIO PS registers */
>>> +static inline u32 zynq_gpio_readreg(void __iomem *offset)
>>> +{
>>> +       return readl_relaxed(offset);
>>> +}
>>> +
>>> +static inline void zynq_gpio_writereg(void __iomem *offset, u32 val)
>>> +{
>>> +       writel_relaxed(val, offset);
>>> +}
>>
>> I think this is unnecessary and confusing indirection.
>> Just use the readl_relaxed/writel_relaxed functions directly in
>> the code.
>>
>
> This is just to be flexible.

Define exactly what you mean with "flexible" in this context. I
only see unnecessary overhead and hard-to-read code.

>> This is also pretty convoluted. Are you sure you don't want to
>> implement one gpiochip per bank instead? I guess the final "+1"
>> means there is actually one IRQ per bank even?
>
> There is only one IRQ for all four banks.

OK I get it. Then it makes sense to have all banks registered as
one device and the IRQ tied to this one device.

>>> +static const struct dev_pm_ops zynq_gpio_dev_pm_ops = {
>>> +       SET_SYSTEM_SLEEP_PM_OPS(zynq_gpio_suspend, zynq_gpio_resume)
>>> +       SET_RUNTIME_PM_OPS(zynq_gpio_runtime_suspend, zynq_gpio_runtime_resume,
>>> +                          zynq_gpio_idle)
>>> +};
>>
>> Is this runtime PM implementation aligned with Ulf Hansson's recent
>> new helpers to simplify suspend+runtime PM coexistance?
>>
>
> I'm sorry i just looked at them -
> pm_runtime_force_suspend/resume are not used here.

Sorry, I was more thinking of change
717e5d458e3bfca495a38dca61c64f274c049e46
"PM / Runtime: Implement the pm_generic_runtime functions for CONFIG_PM"

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
