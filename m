From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: uniphier: add nodes of thermal monitor and thermal zone for PXs2
Date: Mon, 04 Sep 2017 13:43:46 +0900
Message-ID: <20170904134345.9FEF.4A936039@socionext.com>
References: <1499255595-31805-2-git-send-email-hayashi.kunihiko@socionext.com> <CAK7LNAS2chLuW_PzeghNCTYf038qS_BgxMqJ6FoQbqT6hRJYSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNAS2chLuW_PzeghNCTYf038qS_BgxMqJ6FoQbqT6hRJYSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Yamada-san,

On Thu, 10 Aug 2017 19:44:38 +0900 <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:

> Hayashi-san
> 
> 
> 2017-07-05 20:53 GMT+09:00 Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> > Add nodes of thermal monitor and thermal zone for UniPhier PXs2 SoC.
> > The thermal monitor is included in sysctrl.
> > Furthermore, add cpuN labels for reference in cooling-device property.
> >
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> > ---
> 
> 
> Please add socionext,tmod-calibration
> in case the efuse is not brown.

I see.
I'll include it to the pvtctl node in uniphier-pxs2.dtsi.

> >
> > +       thermal-zones {
> > +               cpu_thermal {
> > +                       polling-delay-passive = <250>;  /* 250ms */
> > +                       polling-delay = <1000>;         /* 1000ms */
> > +                       thermal-sensors = <&pvtctl>;
> > +
> > +                       trips {
> > +                               cpu_crit: cpu_crit {
> > +                                       temperature = <95000>;  /* 95C */
> > +                                       hysteresis = <2000>;
> > +                                       type = "critical";
> > +                               };
> > +                               cpu_alert: cpu_alert {
> > +                                       temperature = <85000>;  /* 85C */
> > +                                       hysteresis = <2000>;
> > +                                       type = "passive";
> > +                               };
> > +                       };
> > +
> > +                       cooling-maps {
> > +                               map {
> > +                                       trip = <&cpu_alert>;
> > +                                       cooling-device = <&cpu0 (-1) (-1)>;
> > +                               };
> 
> 
> After all, I decided to use dt-bindings headers.
> Could you use THERMAL_NO_LIMIT for clarification?

Okay, I'll replace '(-1)' to THERMAL_NO_LIMIT and add the '#include' directive.

---
Best Regards,
Kunihiko Hayashi


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
