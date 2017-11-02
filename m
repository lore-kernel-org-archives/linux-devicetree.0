From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH] ARM: dts: iwg20d-q7: Add support for ttySC3
Date: Thu, 2 Nov 2017 09:20:14 +0000
Message-ID: <TY1PR06MB0895FCBA06AF6FF82E1CF939C05C0@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1507539981-4193-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUprE7QuXF_sX47JyrvuZXhXnQFufy4OHeJ5ExwwoogKw@mail.gmail.com>
 <TY1PR06MB0895612044D5E21BCBFEF46BC0740@TY1PR06MB0895.apcprd06.prod.outlook.com>
 <20171102080412.n3wfabxt2ayswxzp@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171102080412.n3wfabxt2ayswxzp-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH] ARM: dts: iwg20d-q7: Add support for ttySC3
>
> On Mon, Oct 09, 2017 at 01:45:07PM +0000, Fabrizio Castro wrote:
> > Hello Geert,
> >
> > thank you for your feedback!
> >
> > >
> > > Hi Fabrizio, Chris,
> > >
> > > On Mon, Oct 9, 2017 at 11:06 AM, Fabrizio Castro
> > > <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > > > Signed-off-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> > >
> > > Thanks for your patch!
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> > >
> > > > --- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > > > +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > > > @@ -11,6 +11,7 @@
> > > >  / {
> > > >         aliases {
> > > >                 serial0 =3D &scif0;
> > > > +               serial3 =3D &scifb1;
> > >
> > > Given this port is not labeled "serial3", but called "data uart", you=
 may want
> > > to add a comment to avoid confusion:
> >
> > It's a little bit confusing, isn't it? The lines related to such
> > interface are named as UART0_x on the carrier board schematic, the
> > section of the schematic that contains the header is named "data uart
> > header", and the board documentation names it explicitly as "UART 3 -
> > /dev/ttySC3 (SCIFB1)".
> >
> > I don't think there is anything we can do to make this easier for the
> > user really, is there? :D If we decide to add a comment to serial 3, I
> > guess we need to be consistent and add comments for the other serial
> > interfaces too.  If you still prefer having a comment there I'll send a
> > v2 and patch(es) for adding comments to the other interfaces, just let =
me
> > know.
>
> I have applied this patch. If a comment is subsequently decided on
> then please send a follow-up patch.

Thank you Simon.

Cheers,
Fab



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
