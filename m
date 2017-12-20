From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH 5/5] ARM: dts: iwg20d-q7-common: Enable SGTL5000 audio
 codec
Date: Wed, 20 Dec 2017 10:02:54 +0000
Message-ID: <KL1PR06MB1702453058AFB66AA8110825B80C0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1513103111-45830-1-git-send-email-biju.das@bp.renesas.com>
 <1513103111-45830-6-git-send-email-biju.das@bp.renesas.com>
 <20171220095806.jqtkmximxybsq6tr@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220095806.jqtkmximxybsq6tr-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks Simon for this information.

Next time I will make sure that  compiler won't give any warning message wi=
th make dtbs W=3D1

Regards,
Biju

> -----Original Message-----
> From: Simon Horman [mailto:horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org]
> Sent: 20 December 2017 09:58
> To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland
> <mark.rutland-5wv7dgnIgG8@public.gmane.org>; Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>; Magnus
> Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; Chris Paterson
> <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-renesas-
> soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH 5/5] ARM: dts: iwg20d-q7-common: Enable SGTL5000
> audio codec
>
> On Tue, Dec 12, 2017 at 06:25:11PM +0000, Biju Das wrote:
> > This patch enables SGTL5000 audio codec on the carrier board.
> >
> > Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>
> Somehow I missed applying this one.
> I have now done so with the minor update noted below.
>
> > ---
> >  arch/arm/boot/dts/iwg20d-q7-common.dtsi | 24
> ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > index 54470c6..2070b14 100644
> > --- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > @@ -20,6 +20,20 @@
> >  stdout-path =3D "serial0:115200n8";
> >  };
> >
> > +audio_clock: audio_clock {
> > +compatible =3D "fixed-clock";
> > +#clock-cells =3D <0>;
> > +clock-frequency =3D <26000000>;
> > +};
> > +
> > +reg_1p5v: 1p5v {
> > +compatible =3D "regulator-fixed";
> > +regulator-name =3D "1P5V";
> > +regulator-min-microvolt =3D <1500000>;
> > +regulator-max-microvolt =3D <1500000>;
> > +regulator-always-on;
> > +};
> > +
> >  vcc_sdhi1: regulator-vcc-sdhi1 {
> >  compatible =3D "regulator-fixed";
> >
> > @@ -83,6 +97,16 @@
> >  compatible =3D "ti,bq32000";
> >  reg =3D <0x68>;
> >  };
> > +
> > +sgtl5000: codec@0a {
>
> s/@0a/@a/
>
> Base addresses should not have a leading 0.
>
> # make dtbs W=3D1
> DTC     arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dtb
> arch/arm/boot/dts/r8a7743-iwg20d-q7.dtb: Warning (unit_address_format):
> Node /soc/i2c@e6530000/codec@0a unit name should not have leading 0s
>
> > +compatible =3D "fsl,sgtl5000";
> > +#sound-dai-cells =3D <0>;
> > +reg =3D <0x0a>;
> > +clocks =3D <&audio_clock>;
> > +VDDA-supply =3D <&reg_3p3v>;
> > +VDDIO-supply =3D <&reg_3p3v>;
> > +VDDD-supply =3D <&reg_1p5v>;
> > +};
> >  };
> >
> >  &pci0 {
> > --
> > 1.9.1
> >


[https://www2.renesas.eu/media/email/unicef_2017.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
