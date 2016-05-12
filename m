From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v4 01/11] clk: sunxi: Add display and
 TCON0 clocks driver
Date: Thu, 12 May 2016 10:30:47 +0200
Message-ID: <20160512083047.GY3733@lukather>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160506223002.GE3492@codeaurora.org>
 <20160508200308.GF6167@lukather>
 <20160509223238.GW3492@codeaurora.org>
 <20160509223924.GX3492@codeaurora.org>
 <1462907459.9981.0.camel@plaes.org>
 <20160511221541.GG3492@codeaurora.org>
 <1463024360.16747.4.camel@plaes.org>
 <20160512065943.GX3733@lukather>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8VKnE9k7k7imdYv5"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBOP62C4QKGQENQQNCEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160512065943.GX3733@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--8VKnE9k7k7imdYv5
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2016 at 08:59:43AM +0200, Maxime Ripard wrote:
> On Thu, May 12, 2016 at 06:39:20AM +0300, Priit Laes wrote:
> > On Wed, 2016-05-11 at 15:15 -0700, Stephen Boyd wrote:
> > > On 05/10, Priit Laes wrote:
> > > >=20
> > > > On Mon, 2016-05-09 at 15:39 -0700, Stephen Boyd wrote:
> > > > >=20
> > > > > On 05/09, Stephen Boyd wrote:
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > Ok I applied this one to clk-next.
> > > > > >=20
> > > > > And I squashed this in to silence the following checker warning.
> > > > >=20
> > > > > drivers/clk/sunxi/clk-sun4i-display.c:110:33: warning: Variable
> > > > > length array is used.
> > > > >=20
> > > > > ---8<---
> > > > > diff --git a/drivers/clk/sunxi/clk-sun4i-display.c
> > > > > b/drivers/clk/sunxi/clk-sun4i-display.c
> > > > > index f02e250e64ed..f8ff6c4a5633 100644
> > > > > --- a/drivers/clk/sunxi/clk-sun4i-display.c
> > > > > +++ b/drivers/clk/sunxi/clk-sun4i-display.c
> > > > > @@ -107,7 +107,7 @@ static int
> > > > > sun4i_a10_display_reset_xlate(struct
> > > > > reset_controller_dev *rcdev,
> > > > > =C2=A0static void __init sun4i_a10_display_init(struct device_nod=
e
> > > > > *node,
> > > > > =C2=A0					=C2=A0=C2=A0const struct
> > > > > sun4i_a10_display_clk_data *data)
> > > > > =C2=A0{
> > > > > -	const char *parents[data->parents];
> > > > > +	const char *parents[4];
> > > > This change breaks at least de_[bf]e clocks which have 3 clock
> > > > parents.
> >=20
> > > I just used the largest data->parents number, which was 4. How
> > > does that break anything?
> >=20
> > If you look at the=C2=A0sun4i_a10_display_init, it contains this block:
> >=20
> > =C2=A0 =C2=A0 ret =3D of_clk_parent_fill(node, parents, ARRAY_SIZE(pare=
nts));
> > =C2=A0=C2=A0=C2=A0=C2=A0if (ret !=3D ARRAY_SIZE(parents)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_err("%s: Could not r=
etrieve the parents\n", clk_name);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto unmap;
> > =C2=A0=C2=A0=C2=A0=C2=A0}
> >=20
> > of_clk_parent_fill returns 3 for de_be/de_fe nodes, and
> > ARRAY_SIZE(parents) is 4.
>=20
> Replacing both ARRAY_SIZE(parents) by data->parents would work though.

I just tested on top of current next, and indeed the following patch
is needed.

Stephen, could you squash it in the former patch?

diff --git a/drivers/clk/sunxi/clk-sun4i-display.c b/drivers/clk/sunxi/clk-=
sun4i-display.c
index 70803aa7028c..9780fac6d029 100644
--- a/drivers/clk/sunxi/clk-sun4i-display.c
+++ b/drivers/clk/sunxi/clk-sun4i-display.c
@@ -128,8 +128,8 @@ static void __init sun4i_a10_display_init(struct device=
_node *node,
 		return;
 	}
=20
-	ret =3D of_clk_parent_fill(node, parents, ARRAY_SIZE(parents));
-	if (ret !=3D ARRAY_SIZE(parents)) {
+	ret =3D of_clk_parent_fill(node, parents, data->parents);
+	if (ret !=3D data->parents) {
 		pr_err("%s: Could not retrieve the parents\n", clk_name);
 		goto unmap;
 	}

Thanks!
Maxime					 =20

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--8VKnE9k7k7imdYv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXND83AAoJEBx+YmzsjxAgf1IQAJ1UEiWAWz/bJ6uEhMjY9ZWz
8fBlBkRyjllOW+WMgMUSv9r8VJhUjQ/0g9g2lyS0k0U0l24s9hTvcGdfrDXqDVMJ
E6aSdiQEGnSZkSseioTLd1MMtgACb29ilb71LQDjna7bYydsUZRVa7TOgN/Rs28p
t+w/GJTFxJFpxWLoD0z/jKy3eb0a/ec1X6nar/cWYqC62o27gGCzolgSis0ZcT1v
9/9SRlKaenE4a+xTt4fVnCnfIe+86itvTTyv0BN+TOqVtRTQKoPQQ6IgVzp0tAH8
XLsnHtOss/jKM6YU2hBOD/yaOILlukTgJGb7IfEr7b1AbpAgNUp2cUQO6/b64CJE
zbWHMNd9gMWquED1WUwM3NF1wyLQbD+Pc33dRr+MA9yGR5U+RU6c7KgbT3iEuyFq
wdCOhT3T4Fhl/LoS5ryc30/X2qpMIdiCiMig6D/UihTiftCWiM2bydFBZfpXx5kE
9FfF4MMcgPi1IfdDBESw/lLJiwVSjRktNobUCQcUkCh8KPQgctHQDWR9roJ9urNC
jJ/ULcTnqWl9qY/hDylzxY73C+KVV0iHWh6WerYtMgcRKcNixFa4idFvta419QIZ
1jfMqPvB6piVIAjQW/krbu5HGNVmL38M9fmXNbD4qFajRzrNP1kc4P1x+F90xDsH
ot7VHWLsQ26r5+aZV1Pl
=N8ET
-----END PGP SIGNATURE-----

--8VKnE9k7k7imdYv5--
