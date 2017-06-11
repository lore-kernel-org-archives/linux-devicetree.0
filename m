From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: update STM32 timers clock names
Date: Sun, 11 Jun 2017 12:20:09 +0100
Message-ID: <20170611122009.37ed409b@kernel.org>
References: <1496993874-9870-1-git-send-email-fabrice.gasnier@st.com>
        <1496993874-9870-3-git-send-email-fabrice.gasnier@st.com>
        <CA+M3ks4z46rPmjBt=pfJQBBjr5Hr7Oj4P=tv5wjo9WB_Ca_vsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+M3ks4z46rPmjBt=pfJQBBjr5Hr7Oj4P=tv5wjo9WB_Ca_vsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin GAIGNARD <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 9 Jun 2017 09:43:42 +0200
Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> 2017-06-09 9:37 GMT+02:00 Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>:
> > Clock name has been updated during driver/DT binding review:
> > https://lkml.org/lkml/2016/12/13/718
> > Update DT binding doc to reflect this.
> >
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Same fixes tag as previous as this is an example of the binding for the
mfd rather than actually part of the IIO binding.

Fixes: d0f949e220fd ("mfd: Add STM32 Timers driver")
Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I'm assuming Rob / Mark or Lee will pick this up.  If people
do want it to go through the IIO tree let me know.

Jonathan
> > ---
> >  Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt b/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
> > index 55a653d..6abc755 100644
> > --- a/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
> > +++ b/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
> > @@ -14,7 +14,7 @@ Example:
> >                 compatible = "st,stm32-timers";
> >                 reg = <0x40010000 0x400>;
> >                 clocks = <&rcc 0 160>;
> > -               clock-names = "clk_int";
> > +               clock-names = "int";
> >
> >                 timer@0 {
> >                         compatible = "st,stm32-timer-trigger";
> > --
> > 1.9.1
> >  
> Acked-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
