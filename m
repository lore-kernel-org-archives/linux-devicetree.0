From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Wed, 19 Apr 2017 13:47:31 +0200
Message-ID: <1492602451.2970.90.camel@pengutronix.de>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
         <d6d32063-5df3-3848-32f5-824c500a8927@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d6d32063-5df3-3848-32f5-824c500a8927-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-04-13 at 18:03 -0700, Steve Longerbeam wrote:
> 
> On 04/13/2017 08:48 AM, Philipp Zabel wrote:
> > This adds device tree binding documentation for mmio-based syscon
> > multiplexers controlled by a single bitfield in a syscon register
> > range.
> 
> Nice! (you beat me to it, I was about to embark on this myself :)
> 
> Looks good to me, just some minor comments below.
> 
[...]
> > +Define a syscon bitfield to be used to control a multiplexer. The parent
> I think "Define a register bitfield to be used ..." is more clear.
[...]
> > +- compatible : "gpio-mux"
> Er, "mmio-mux"

I'll change those, thanks.

[...]
> > +Example:
> > +
> > +	syscon {
> > +		compatible = "syscon";
> > +
> > +		mux: mux-controller@3 {
> > +			compatible = "mmio-mux";
> > +			reg = <0x3>;
> > +			bit-mask = <0x1>;
> > +			bit-shift = <5>;
> > +			#mux-control-cells = <0>;
> > +		};
> > +	};
> > +
> > +	video-mux {
> 
> I like this as an example consumer of a mmio-mux, but just
> the same some might argue this doesn't really fit here.

I don't think this is a problem, of course assuming that this video-mux
binding will actually come into existence.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
