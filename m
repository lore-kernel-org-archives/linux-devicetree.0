From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 04/15] dt-bindings: rtc: sun6i-rtc: Export
 internal RC oscillator
Date: Mon, 3 Dec 2018 10:06:18 +0100
Message-ID: <20181203090618.u4bi3owfpk2kcqik@flea>
References: <20181128093013.24442-1-wens@csie.org>
 <20181128093013.24442-5-wens@csie.org>
 <20181128103219.b625lttcgoluhgz5@flea>
 <CAGb2v67jPi-RFFkVrzHeh2XHeZV7ZN0tPCE=cOTpd6RQayH_Kg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="krs5icnvo4odeegk"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBFPESPQAKGQE7DP747A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v67jPi-RFFkVrzHeh2XHeZV7ZN0tPCE=cOTpd6RQayH_Kg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--krs5icnvo4odeegk
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Nov 28, 2018 at 07:18:26PM +0800, Chen-Yu Tsai wrote:
> On Wed, Nov 28, 2018 at 6:33 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Wed, Nov 28, 2018 at 05:30:01PM +0800, Chen-Yu Tsai wrote:
> > > Experiments showed that on at least the H3/H5/A64 the RTC's internal
> > > oscillator also feeds the CPUS mux in the PRCM.
> > >
> > > Export this clock through the device tree, instead of having to use
> > > a dummy fixed-clock device node, for the PRCM to consume. This will
> > > properly describe the relationship between the clocks.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/rtc/sun6i-rtc.txt | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
> > > index 78c4fb472eb7..1bd37faadecb 100644
> > > --- a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
> > > +++ b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
> > > @@ -24,7 +24,7 @@ Required properties:
> > >
> > >  Required properties for new device trees
> > >  - clocks     : phandle to the 32kHz external oscillator
> > > -- clock-output-names : names of the two clock outputs. See below.
> > > +- clock-output-names : names of the three clock outputs. See below.
> > >  - #clock-cells  : must be equal to 1.
> > >
> > >  The RTC provides the following clocks at the given indices:
> > > @@ -32,6 +32,7 @@ The RTC provides the following clocks at the given indices:
> > >  - 1: LOSC external output, known as X32KFOUT in the datasheet.
> > >       This clock is not available on the A31 and is deprecated for old
> > >       device trees still using the "allwinner,sun6i-a31-rtc" compatible.
> > > +- 2: InternalOSC, or internal RC oscillator
> >
> > It seems to be required only for a few RTC though (H3, H5 and R40?)
> 
> IMO there's no harm in exporting it for all SoCs. I still don't know
> if it's needed for the A31 either. And we don't have documents for the
> PRCM stuff for any of the SoCs involved.

I'm still a bit worried about this, since that means that we can't
ever remove it from the DT interface, even though we find out it might
cause some issues in the future.

If we don't really have a need for it right now, I'd prefer not to
expose it.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--krs5icnvo4odeegk--
