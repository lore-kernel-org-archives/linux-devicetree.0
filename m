From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] usb: chipidea: Hook into mux framework to toggle usb
 switch
Date: Mon, 17 Jul 2017 12:22:48 -0500
Message-ID: <20170717172248.feign2ej7wr2s6tt@rob-hp-laptop>
References: <20170712010255.26855-1-stephen.boyd@linaro.org>
 <20170712010255.26855-3-stephen.boyd@linaro.org>
 <2db7bc39-9274-6007-d971-59e2a577d437@axentia.se>
 <149998498328.4532.10720468535933872401@sboyd-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <149998498328.4532.10720468535933872401@sboyd-linaro>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 03:29:43PM -0700, Stephen Boyd wrote:
> Quoting Peter Rosin (2017-07-11 23:45:24)
> > On 2017-07-12 03:02, Stephen Boyd wrote:
> > > @@ -102,4 +107,7 @@ Example:
> > >               rx-burst-size-dword = <0x10>;
> > >               extcon = <0>, <&usb_id>;
> > >               phy-clkgate-delay-us = <400>;
> > > +             mux-controls = <&usb_switch>;
> > > +             mux-control-names = "usb_switch";

Pointless to have a name when there is only 1.

> > > +             usb-switch-states = <0>, <1>;
> > 
> > I don't see the need for usb-switch-states? Just assume states 0/1 and
> > if someone later needs some other states, make them add a property that
> > overrides the defaults. Just document that 0 is host and 1 is device.
> > 
> 
> Fine by me. Rob H do you agree?

Yes.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
