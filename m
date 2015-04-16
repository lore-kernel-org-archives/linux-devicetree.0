From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RESEND] Doc: dt: arch_timer: discourage clock-frequency
 use
Date: Thu, 16 Apr 2015 12:47:50 +0100
Message-ID: <20150416114749.GK2866@leverpostej>
References: <1426874267-24413-1-git-send-email-mark.rutland@arm.com>
 <CAL_JsqJfyknhZxGvbWcj1Vj1FGRt40qT9b=xrbhm0wfu-BduTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJfyknhZxGvbWcj1Vj1FGRt40qT9b=xrbhm0wfu-BduTw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > Rob, are you happy to take this through your tree?
> 
> Yes, I'll take it.

Are you still planning on taking this for v4.1? I couldn't spot it in a
public branch yet.

Mark

> 
> Rob
> 
> >
> > Mark.
> >
> > [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-August/282804.html
> > [2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-August/282830.html
> >
> >
> > diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
> > index 256b4d8..e774128 100644
> > --- a/Documentation/devicetree/bindings/arm/arch_timer.txt
> > +++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
> > @@ -17,7 +17,10 @@ to deliver its interrupts via SPIs.
> >  - interrupts : Interrupt list for secure, non-secure, virtual and
> >    hypervisor timers, in that order.
> >
> > -- clock-frequency : The frequency of the main counter, in Hz. Optional.
> > +- clock-frequency : The frequency of the main counter, in Hz. Should be present
> > +  only where necessary to work around broken firmware which does not configure
> > +  CNTFRQ on all CPUs to a uniform correct value. Use of this property is
> > +  strongly discouraged; fix your firmware unless absolutely impossible.
> >
> >  - always-on : a boolean property. If present, the timer is powered through an
> >    always-on power domain, therefore it never loses context.
> > @@ -46,7 +49,8 @@ Example:
> >
> >  - compatible : Should at least contain "arm,armv7-timer-mem".
> >
> > -- clock-frequency : The frequency of the main counter, in Hz. Optional.
> > +- clock-frequency : The frequency of the main counter, in Hz. Should be present
> > +  only when firmware has not configured the MMIO CNTFRQ registers.
> >
> >  - reg : The control frame base address.
> >
> > --
> > 1.9.1
> >
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
