From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V7 4/4] dmaengine: qcom_hidma: add MSI support for interrupts
Date: Mon, 24 Oct 2016 10:30:12 +0300
Message-ID: <CAHp75VettN=-S+iqKQbqixRe2BM=AiS26VGM+8yLophbkc+Z8g@mail.gmail.com>
References: <1477067879-23750-1-git-send-email-okaya@codeaurora.org>
 <1477067879-23750-5-git-send-email-okaya@codeaurora.org> <CAHp75Vd+u5va3kyqcapeF9JATUfv5gBnoEM_W+frDmMXs5f2Uw@mail.gmail.com>
 <36163853-ac4a-e146-0c1b-eaf42e8b234d@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36163853-ac4a-e146-0c1b-eaf42e8b234d-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dave Jiang <dave.jiang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2016 at 5:55 AM, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 10/21/2016 12:11 PM, Andy Shevchenko wrote:
>>> +static void hidma_free_msis(struct hidma_dev *dmadev)
>>> > +{
>>> > +#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
>> Perhaps one #ifdef and two definitions of functions?
>
> I don't think it will make a difference. I'll have to move
> #ifdef around the caller of hidma_free_msis instead which
> I think is uglier.
>
> The hidma_write_msi_msg function gets called only when
> CONFIG_GENERIC_MSI_IRQ_DOMAIN is defined. If I don't put
> this around the function definition, I get unused function
> warning from the compiler. This is the reason why preprocessor
> definition is outside of the function definition.

I am talking about something like below:

#ifdef UGLY_DEFINE
myfunc_a()
{
}

myfunc_b()
{
}
#else
static inline myfunc_a() {}
static inline myfunc_b() {}
#endif


There is another way as well, namely use of IS_ENABLED(), IS_BUILTIN()
macros (I don't remember how exactly second one is spelt).

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
