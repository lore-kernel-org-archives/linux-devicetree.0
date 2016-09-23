From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: rskrza1: add sdhi1 DT support
Date: Fri, 23 Sep 2016 09:41:24 +0200
Message-ID: <20160923074123.GD20129@verge.net.au>
References: <20160922213211.7988-1-chris.brandt@renesas.com>
 <20160922213211.7988-4-chris.brandt@renesas.com>
 <CAMuHMdWckFaU__BM=WAOvJ+fVjEvNdLCFy0GNiKwU159aZTdhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWckFaU__BM=WAOvJ+fVjEvNdLCFy0GNiKwU159aZTdhg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 23, 2016 at 09:09:07AM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 22, 2016 at 11:32 PM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> > Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/r7s72100-rskrza1.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> > index e5dea5b..548b51f 100644
> > --- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
> > +++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> > @@ -56,6 +56,10 @@
> >         };
> >  };
> >
> > +&sdhi1 {
> > +       status = "okay";
> 
> On all other boards, we have the bus-width property in the board-specific
> .dts instead of in the SoC-specific .dtsi.

I'd like us to be consistent as much as possible.
But I do wonder why it has been added as a board property.

> > +};
> > +
> >  &scif2 {
> >         status = "okay";
> >  };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
