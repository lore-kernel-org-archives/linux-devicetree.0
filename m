From: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v2 2/3] mmc: sh_mmcif: Document r7s72100 DT bindings
Date: Mon, 26 Sep 2016 20:58:41 +0000
Message-ID: <SG2PR06MB11650CDC26D69220278ED4C78ACD0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160920154620.18653-1-chris.brandt@renesas.com>
 <20160920154620.18653-3-chris.brandt@renesas.com>
 <20160923191519.GA28901@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160923191519.GA28901@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 9/23/2016, Rob Herring wrote:
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> > b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> > index ff611fa..1443edb 100644
> > --- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> > @@ -8,12 +8,16 @@ Required properties:
> >
> >  - compatible: should be "renesas,mmcif-<soctype>", "renesas,sh-mmcif"
> as a
> >    fallback. Examples with <soctype> are:
> > +	- "renesas,mmcif-r7s72100" for the MMCIF found in r7s72100 SoCs
> >  	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
> >  	- "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
> >  	- "renesas,mmcif-r8a7791" for the MMCIF found in r8a7791 SoCs
> >  	- "renesas,mmcif-r8a7793" for the MMCIF found in r8a7793 SoCs
> >  	- "renesas,mmcif-r8a7794" for the MMCIF found in r8a7794 SoCs
> >
> > +- interrupts: either 1 shared interrupt, 2 separate interrupts (error
> > +and int),
> > +  or 3 separate interrupts (error, int, card detect)
>=20
> This should be based on the compatible strings. Surely, 1, 2, or 3 is not
> valid for all compatibles.


That is true. What is your suggestion? Add the specific number of interrupt=
s for each SoC to the documentation so there is no confusion?

For example:

- interrupts: Some SoCs have only 1 shared interrupt, while others have eit=
her
  2 or 3 individual interrupts (error, int, card detect). Below is the numb=
er
  of interrupts for each SoC.
    3: r7s72100 SoC
    2: r8a7740 SoC
    1: r8a7790 SoC
    1: r8a7791 SoC
    1: r8a7793 SoC
    1: r8a7794 SoC


Chris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
