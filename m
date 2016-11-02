From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: dts: imx: add Boundary Devices Nitrogen6_SOM2
 support
Date: Wed, 2 Nov 2016 15:35:37 +0800
Message-ID: <20161102073533.GA19126@dragon>
References: <20161025211955.5345-1-gary.bisson@boundarydevices.com>
 <20161025211955.5345-2-gary.bisson@boundarydevices.com>
 <20161101141338.GC9807@dragon>
 <CAAMH-yugLeHjaSwMx9ZoJ9qm44VKXcgO64xdsO=HBj59pj5cUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAMH-yugLeHjaSwMx9ZoJ9qm44VKXcgO64xdsO=HBj59pj5cUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 01, 2016 at 03:54:31PM +0100, Gary Bisson wrote:
> Hi Shawn,
> 
> On Tue, Nov 1, 2016 at 3:13 PM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, Oct 25, 2016 at 11:19:51PM +0200, Gary Bisson wrote:
> >> SoM based on i.MX6 Quad with 1GB of DDR3.
> >>
> >> https://boundarydevices.com/product/nit6x-som-v2/
> >>
> >> Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/Makefile                    |   1 +
> >>  arch/arm/boot/dts/imx6q-nitrogen6_som2.dts    |  53 ++
> >>  arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi | 770 ++++++++++++++++++++++++++
> >>  3 files changed, 824 insertions(+)
> >>  create mode 100644 arch/arm/boot/dts/imx6q-nitrogen6_som2.dts
> >>  create mode 100644 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi
> >
> > <snip>
> >
> >> +/ {
> >> +     chosen {
> >> +             stdout-path = &uart2;
> >> +     };
> >> +
> >> +     memory {
> >> +             reg = <0x10000000 0x40000000>;
> >> +     };
> >> +
> >> +     backlight_lcd: backlight_lcd {
> >
> > Please use hyphen instead of underscore in node name.  Please check
> > through the patch series.
> 
> Sorry about that, forgot (again). Just to make sure, the label can
> have underscore but not the name right? Or is it better to have hypens
> everywhere?

Hyphen cannot be used in labels.  Otherwise, DTC will complain.

> So I guess I need to make a pass on current boards as well.

I'm fine with the current boards and only expect it to be right with the
boards to be added.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
