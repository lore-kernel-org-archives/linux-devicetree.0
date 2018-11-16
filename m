From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 08/15] ARM/arm64: sunxi: Move H3/H5 syscon
 label over to soc-specific nodes
Date: Fri, 16 Nov 2018 10:56:28 +0100
Message-ID: <0629767b61b22a7cc8ba8b51ab9e347ca06bbbb0.camel@bootlin.com>
References: <20181115145013.3378-1-paul.kocialkowski@bootlin.com>
	 <20181115145013.3378-9-paul.kocialkowski@bootlin.com>
	 <20181116093904.4ikn7ldksrm3mp5d@flea>
	 <CAGb2v65EckX0CDbZ5K9VmmayOe3eisOYgUxmPomPgp2_jE5Vww@mail.gmail.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCOO3QWNR4KRB7VHXLPQKGQEUCKBPWQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65EckX0CDbZ5K9VmmayOe3eisOYgUxmPomPgp2_jE5Vww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Le vendredi 16 novembre 2018 =C3=A0 17:47 +0800, Chen-Yu Tsai a =C3=A9crit =
:
> On Fri, Nov 16, 2018 at 5:39 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>=
 wrote:
> > On Thu, Nov 15, 2018 at 03:50:06PM +0100, Paul Kocialkowski wrote:
> > > Now that we have specific nodes for the H3 and H5 system-controller
> > > that allow proper access to the EMAC clock configuration register,
> > > we no longer need a common dummy syscon node.
> > >=20
> > > Switch the syscon label over to each platform's dtsi file.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/sun8i-h3.dtsi              | 2 +-
> > >  arch/arm/boot/dts/sunxi-h3-h5.dtsi           | 6 ------
> > >  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 2 +-
> > >  3 files changed, 2 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8=
i-h3.dtsi
> > > index 7157d954fb8c..b337a9282783 100644
> > > --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> > > +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> > > @@ -134,7 +134,7 @@
> > >       };
> > >=20
> > >       soc {
> > > -             system-control@1c00000 {
> > > +             syscon: system-control@1c00000 {
> > >                       compatible =3D "allwinner,sun8i-h3-system-contr=
ol";
> > >                       reg =3D <0x01c00000 0x1000>;
> > >                       #address-cells =3D <1>;
> > > diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/s=
unxi-h3-h5.dtsi
> > > index 4b1530ebe427..9175ff0fb59a 100644
> > > --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > @@ -152,12 +152,6 @@
> > >                       };
> > >               };
> > >=20
> > > -             syscon: syscon@1c00000 {
> > > -                     compatible =3D "allwinner,sun8i-h3-system-contr=
oller",
> > > -                             "syscon";
> > > -                     reg =3D <0x01c00000 0x1000>;
> > > -             };
> > > -
> >=20
> > You're also dropping the syscon compatible there. But I'm not sure how
> > it could work with the H3 EMAC driver that would overwrite the
> > compatible already.
>=20
> I assume you are referring to the previous patch? The node names are not
> the same, hence the previous patch is adding another node for the system
> controller, and this patch removes the old one with the "syscon" compatib=
le.
>=20
> We already patched the EMAC driver to support the new SRAM controller bas=
ed
> regmap, so other than making people unhappy about having to update their
> DT, I don't think there would be any problems. This also means H3 in -nex=
t
> currently has _two_ syscon nodes.

Yes, the point is indeed to only have a single node per platform (in
the platform dtsi) instead of two (one in the common h3-h5 dtsi and one
in the platform dtsi).

I guess updating the dt is not even a hard requirement after this
series: things will keep working with the dummy syscon node for giving
the EMAC driver access to the syscon registers.

Cheers,

Paul

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
