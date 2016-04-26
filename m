From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V17 1/3] dmaengine: qcom_hidma: implement lower level
 hardware interface
Date: Tue, 26 Apr 2016 18:10:00 +0300
Message-ID: <CAHp75VeZQnhaiSDuGJtgcKtek7yUwgQWd3J5QSJbdisehmBGqA@mail.gmail.com>
References: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
	<1460384473-5775-2-git-send-email-okaya@codeaurora.org>
	<20160426032805.GA2274@localhost>
	<571F8397.5000803@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571F8397.5000803-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 26, 2016 at 6:04 PM, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 4/25/2016 11:28 PM, Vinod Koul wrote:
>> On Mon, Apr 11, 2016 at 10:21:11AM -0400, Sinan Kaya wrote:

>>> +    while (cause) {
>>> +            if ((cause & BIT(HIDMA_IRQ_TR_CH_INVALID_TRE_BIT_POS)) ||
>>> +                (cause & BIT(HIDMA_IRQ_TR_CH_TRE_RD_RSP_ER_BIT_POS)) ||
>>> +                (cause & BIT(HIDMA_IRQ_EV_CH_WR_RESP_BIT_POS)) ||
>>> +                (cause & BIT(HIDMA_IRQ_TR_CH_DATA_RD_ER_BIT_POS)) ||
>>> +                (cause & BIT(HIDMA_IRQ_TR_CH_DATA_WR_ER_BIT_POS))) {
>>
>> Switch please
>
> Cause is a combined status register. Let's say it contains 0x41. I need to check
> if bit 0 or bit 6 is set in this value for each case condition. The value is not 0x40
> or 0x1.
>
> I created macro like this instead.
>
> +#define HIDMA_IS_ERR_INTERRUPT(cause)                          \
> +       (cause & BIT(HIDMA_IRQ_TR_CH_INVALID_TRE_BIT_POS))   || \
> +       (cause & BIT(HIDMA_IRQ_TR_CH_TRE_RD_RSP_ER_BIT_POS)) || \
> +       (cause & BIT(HIDMA_IRQ_EV_CH_WR_RESP_BIT_POS))       || \
> +       (cause & BIT(HIDMA_IRQ_TR_CH_DATA_RD_ER_BIT_POS))    || \
> +       (cause & BIT(HIDMA_IRQ_TR_CH_DATA_WR_ER_BIT_POS))

This looks overheaded.

#define HIDMA_XXX (BIT(a) | BIT (b) ... BIT(n))

>
> and replaced the if statement as follows
>
> if (HIDMA_IS_ERR_INTERRUPT(cause)) {

if (cause & HIDMA_XXX) {

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
