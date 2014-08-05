From: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64, thunder: Add initial dts for Cavium Thunder
 SoC
Date: Tue, 5 Aug 2014 10:47:17 +0200
Message-ID: <20140805084717.GH4703@rric.localhost>
References: <CAL_JsqKgfjV4sEZOWuH4YcMjeOA_yNDvZLv_jTi_Sb=27cOD3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKgfjV4sEZOWuH4YcMjeOA_yNDvZLv_jTi_Sb=27cOD3g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <20140730174803.GF20162@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30.07.14 18:48:03, Mark Rutland wrote:
> > >> +             uaa0: serial@87e024000000 {
> > >> +                     compatible = "arm,pl011", "arm,primecell";
> > >> +                     reg = <0x87e0 0x24000000 0x0 0x1000>;
> > >> +                     interrupts = <1 21 4>;
> > >> +                     clocks = <&refclk50mhz>;
> > >> +                     clock-names = "apb_pclk";
> > >
> > > Is this actually the apb_pclk, or is the the uartclk? I assume it's the
> > > latter.
> > 
> > Shouldn't new bindings have both clocks here? A single clock was a
> > mistake I think (mine in fact).
> 
> I don't think we fixed it up in the end. It made drivers look a bit messy and
> it dropped off my priority queue.

On 31.07.14 10:22:19, Rob Herring wrote:
> On Thu, Jul 31, 2014 at 7:34 AM, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On 30.07.14 11:37:38, Rob Herring wrote:
> >> On Wed, Jul 30, 2014 at 10:46 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> >> > On Wed, Jul 30, 2014 at 04:06:31PM +0100, Robert Richter wrote:
> >> >> From: Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >> >> +             uaa0: serial@87e024000000 {
> >> >> +                     compatible = "arm,pl011", "arm,primecell";
> >> >> +                     reg = <0x87e0 0x24000000 0x0 0x1000>;
> >> >> +                     interrupts = <1 21 4>;
> >> >> +                     clocks = <&refclk50mhz>;
> >> >> +                     clock-names = "apb_pclk";
> >> >
> >> > Is this actually the apb_pclk, or is the the uartclk? I assume it's the
> >> > latter.
> >>
> >> Shouldn't new bindings have both clocks here? A single clock was a
> >> mistake I think (mine in fact).
> >
> > Do you mean
> >                         clock-names = "uartclk", "apb_pclk";
> > here?
> 
> Yes, but Mark said this change never happened so maybe it is fine. In
> any case, follow the pl011 binding documentation.

Right:

Documentation/devicetree/bindings/arm/primecell.txt:
- clocks : From common clock binding. First clock is phandle to clock for apb
        pclk. Additional clocks are optional and specific to those peripherals.
- clock-names : From common clock binding. Shall be "apb_pclk" for first clock.

Documentation/devicetree/bindings/serial/pl011.txt
- clocks:  When present, must refer to exactly one clock named
           "apb_pclk"

There is no binding documentation at all for "uartclk".

It seems we should should leave clock-names = "apb_pclk" as it is.

Mark, Rob, would this be ok?

Thanks,

-Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
