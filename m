From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] USB Mux support for Chipidea
Date: Mon, 17 Jul 2017 12:18:47 -0500
Message-ID: <20170717171847.7jnkw5hf4wbh7up7@rob-hp-laptop>
References: <20170712010255.26855-1-stephen.boyd@linaro.org>
 <fc1f2836-cd9b-0905-21fc-d2d3029d1f52@axentia.se>
 <149998530228.4532.1798948469358915658@sboyd-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <149998530228.4532.1798948469358915658@sboyd-linaro>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 03:35:02PM -0700, Stephen Boyd wrote:
> Quoting Peter Rosin (2017-07-11 22:04:46)
> > On 2017-07-12 03:02, Stephen Boyd wrote:
> > > This patchset adds support for the TC7USB40MU usb mux found on 
> > > db410c 96boards platforms via the new multiplexer framework and
> > > hooks that into the chipidea driver. This allows us to properly
> > > control host or device mode on this board via the sysfs knob.
> > > 
> > > So far I've only tested this on db410c, and there are some rough
> > > edges to finish off before it can merge. Also I'm experiencing
> > > odd behavior with switching the role while gadget is enabled and
> > > the micro-usb cable is kept connected. Not sure what's wrong but
> > > it seems like the gadget never gets disconnected? I'll investigate
> > > more.
> > > 
> > > TODO:
> > > 
> > >  1. The mux framework has to be selected for consumers to use it. We'll
> > >     need some stubs in the consumer header file to allow compilation to
> > >     continue without mux always enabled by consumers.
> > 
> > Instead of "depends on MULTIPLEXER", just add "select MULTIPLEXER"
> > to the Kconfig. Otherwise, you'll have to convince Linus that we
> > really do need a Kconfig question for the subsystem :-)
> > 
> > https://lkml.org/lkml/2017/7/4/118
> 
> Ok. I'll add a select to the chipidea driver.
> 
> > 
> > >  2. We probably need some sort of mux_control_get_optional() API so that
> > >     we know if there was an error getting the mux control, instead of just
> > >     ignoring errors. For now I can pass up EPROBE_DEFER errors and ignore
> > >     other errors and consider it "missing from DT".
> > 
> > Yes, mux_control_get_optional should be easy to add.
> > 
> > >  3. Maybe we can get rid of the mux driver and just use mux-gpio.c with
> > >     a compatible string update? I split it off because we may want to
> > >     support the "S" pin on the TC7USB40MU one day that shuts off both
> 
> Oh this is a typo. I mean "OE" pin.
> 
> > >     mux outputs.
> > 
> > Maybe no need for a compatible update either, if it works to do something
> > like this in the DT?

Please keep the compatible. Use "gpio-mux" as a fallback if you wish.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
