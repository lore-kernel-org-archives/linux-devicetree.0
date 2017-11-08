From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: sun8i: a83t: add dwmac-sun8i ethernet driver
Date: Wed, 8 Nov 2017 20:27:59 +0100
Message-ID: <20171108192759.GA26904@Red>
References: <20171107201326.17401-1-clabbe.montjoie@gmail.com>
 <CAGb2v64zkEoy=_9D7g+GC5ZxYg_zuaTo3LL1e=4RXLnL0VDWaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64zkEoy=_9D7g+GC5ZxYg_zuaTo3LL1e=4RXLnL0VDWaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 08, 2017 at 02:27:21PM +0800, Chen-Yu Tsai wrote:
> On Wed, Nov 8, 2017 at 4:13 AM, Corentin Labbe
> <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > The dwmac-sun8i is an ethernet MAC hardware that support 10/100/1000 speed.
> > This patch enable the dwmac-sun8i on the Allwinner a83t SoC Device-tree.
> 
> The subject should say "add .... device node", not driver.
> 
> >
> > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-a83t.dtsi | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > index 19acae1b4089..68e5135410ec 100644
> > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > @@ -336,6 +336,14 @@
> >                         #interrupt-cells = <3>;
> >                         #gpio-cells = <3>;
> >
> > +                       emac_rgmii_pins: emac-rgmii-pins {
> > +                               pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> > +                                      "PD11", "PD12", "PD13", "PD14", "PD18",
> > +                                      "PD19", "PD21", "PD22", "PD23";
> > +                               function = "gmac";
> > +                               drive-strength = <40>;
> > +                       };
> > +
> 
> You should mention this change in your commit log.
> 
> ChenYu
> 

Ok I will do it

Thanks
Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
