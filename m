From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 02/16] arm64: dts: add sp804 timer node for Hi6220
Date: Mon, 4 Apr 2016 22:03:48 +0800
Message-ID: <20160404140348.GE402@leoy-linaro>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
 <1459589383-16914-3-git-send-email-guodong.xu@linaro.org>
 <CACRpkdbWuKx6=aF5xW=3EKfuUf-MYM_EEnovyhBnOGVOeHyCmQ@mail.gmail.com>
 <20160404014359.GA15178@leoy-linaro>
 <CACRpkdZ=_86Rhc+ei+3uE0dda9+onC8pQwosheMfEj4tOqmcDA@mail.gmail.com>
 <20160404134237.GC402@leoy-linaro>
 <CACRpkdb_aMpj3X-m-FdM-PCCSuXgHnect5+nWPFnGVzGx4zrbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb_aMpj3X-m-FdM-PCCSuXgHnect5+nWPFnGVzGx4zrbA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, XinWei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 04, 2016 at 03:53:47PM +0200, Linus Walleij wrote:
> On Mon, Apr 4, 2016 at 3:42 PM, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Mon, Apr 04, 2016 at 01:21:00PM +0200, Linus Walleij wrote:

[...]

> > Also have checked Hi6220's spec, there have no timer's dediated clock
> > enabling bits. This is the reason before I only registered one clock.
> > So according to you and Rob's comments, how about change as below?
> >
> >                 dual_timer0: timer@f8008000 {
> >                         compatible = "arm,sp804", "arm,primecell";
> >                         reg = <0x0 0xf8008000 0x0 0x1000>;
> >                         interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> >                                      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks = <&ao_ctrl HI6220_TIMER0_PCLK>,
> >                                  <&ao_ctrl HI6220_TIMER0_PCLK>,
> >                                  <&ao_ctrl HI6220_TIMER0_PCLK>;
> >                         clock-names = "apb_pclk", "apb_pclk", "apb_pclk";
> 
> This works for me, though I think only the last name
> matters so I would name the first two "timer1" and "timer2".

Will fix to "timer1" and "timer2" and sent out new patch.

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
