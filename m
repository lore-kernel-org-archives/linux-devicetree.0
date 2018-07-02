From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH v3 10/24] drm/sun4i: tcon: Generalize
 engine search algorithm
Date: Mon, 2 Jul 2018 10:56:21 +0200
Message-ID: <20180702085621.aq6ksr3amwnj42jc@flea>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <20180628182543.yyja6hiry7rx7fu2@flea>
 <3257762.ZQzN8rrT6c@jernej-laptop>
 <7152481.kAipQ5gD38@jernej-laptop>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="weag3fumpaj4truu"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBQOR47MQKGQEJC5VX2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <7152481.kAipQ5gD38@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--weag3fumpaj4truu
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 01, 2018 at 09:09:47PM +0200, Jernej =C5=A0krabec wrote:
> Dne petek, 29. junij 2018 ob 21:06:09 CEST je Jernej =C5=A0krabec napisal=
(a):
> > Dne =C4=8Detrtek, 28. junij 2018 ob 20:25:43 CEST je Maxime Ripard napi=
sal(a):
> > > On Thu, Jun 28, 2018 at 06:48:50AM +0200, Jernej =C5=A0krabec wrote:
> > > > Dne =C4=8Detrtek, 28. junij 2018 ob 04:06:52 CEST je Chen-Yu Tsai n=
apisal(a):
> > > > > On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec
> > > > > <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > >=20
> > > > wrote:
> > > > > > Current "old" method to find engine worked pretty well for DE2.
> > > > > > However,
> > > > > > it doesn't work when TCON TOP is between  mixer (engine) and TC=
ON.
> > > > > > TCON
> > > > > > TOP has multiple input ports, but current engine search algorit=
hm
> > > > > > expects only one.
> > > > > >=20
> > > > > > This can be fixed by first looking for output port id and selec=
ting
> > > > > > matching input by subtracting 1 for the next round. This work e=
ven
> > > > > > if
> > > > > > there is only one input and output.
> > > > > >=20
> > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > > > > ---
> > > > > >=20
> > > > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 22 ++++++++++++++++++----
> > > > > >  1 file changed, 18 insertions(+), 4 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > b/drivers/gpu/drm/sun4i/sun4i_tcon.c index
> > > > > > 08747fc3ee71..264bcc43da11
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > @@ -791,12 +791,14 @@ static int sun4i_tcon_init_regmap(struct
> > > > > > device
> > > > > > *dev,
> > > > > >=20
> > > > > >   */
> > > > > > =20
> > > > > >  static struct sunxi_engine *
> > > > > >  sun4i_tcon_find_engine_traverse(struct sun4i_drv *drv,
> > > > > >=20
> > > > > > -                               struct device_node *node)
> > > > > > +                               struct device_node *node,
> > > > > > +                               u32 port_id)
> > > > > >=20
> > > > > >  {
> > > > > > =20
> > > > > >         struct device_node *port, *ep, *remote;
> > > > > >         struct sunxi_engine *engine =3D ERR_PTR(-EINVAL);
> > > > > >=20
> > > > > > +       u32 reg =3D 0;
> > > > > >=20
> > > > > > -       port =3D of_graph_get_port_by_id(node, 0);
> > > > > > +       port =3D of_graph_get_port_by_id(node, port_id);
> > > > > >=20
> > > > > >         if (!port)
> > > > > >        =20
> > > > > >                 return ERR_PTR(-EINVAL);
> > > > > >=20
> > > > > > @@ -826,8 +828,20 @@ sun4i_tcon_find_engine_traverse(struct
> > > > > > sun4i_drv
> > > > > > *drv,
> > > > > >=20
> > > > > >                 if (remote =3D=3D engine->node)
> > > > > >                =20
> > > > > >                         goto out_put_remote;
> > > > > >=20
> > > > > > +       /*
> > > > > > +        * According to device tree binding input ports have ev=
en id
> > > > > > +        * number and output ports have odd id. Since component=
 with
> > > > > > +        * more than one input and one output (TCON TOP) exits,
> > > > > > correct
> > > > > > +        * remote input id has to be calculated by subtracting =
1
> > > > > > from
> > > > > > +        * remote output id. If this for some reason can't be d=
one,
> > > > > > 0
> > > > > > +        * is used as input port id.
> > > > > > +        */
> > > > >=20
> > > > > You need to call
> > > > >=20
> > > > >     of_node_put(port);
> > > > >=20
> > > > > to drop the reference to the original port.
> > > >=20
> > > > Thanks for noticing it. I guess I should send fix patch, since patc=
hes
> > > > from
> > > > drm-misc-next can't be dropped.
> > >=20
> > > Yeah, please send additional patches for all the issues pointed out b=
y
> > > Chen-Yu.
> >=20
> > Of course. I hope this can be resolved till the end of the next week. A=
fter
> > that, I will be away from PC for 2 weeks. Feel free to drop DT patches =
if
> > you think that it will come too close to merge window.
>=20
> Actually, can you drop it anyway? It needs a lot of changes and keeping H=
DMI=20
> working would need some effort.

No, we can't drop it, unfortunately.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--weag3fumpaj4truu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAls56LQACgkQ0rTAlCFN
r3SfOA//Rb53Vq1lID0WxKB9uSBs/bU3mPxug0skNSfmQpD3OJoS3aFabr41aoPS
wIiPeeMRnkxZydAc5EdosY9vJb8MRV5aYbVsEmiGXTPL1n8YE+Ppe/z4793BbAkg
QSF9DzukzzdIU0geZSX7IIOrQjzkBc1aV2CzQe/JOSqfQLKUZdZOKepRJy1wUWkm
5OPpn0DPbBk0tpZT+FnBqH7nLKFvrMa+cZ0CdeSJ+4PlRgc3W77dHleXE+xnyICZ
rDw65tJNZzhSlK3RBb3LjhBJn1Ez1C9iRZaBpBzkcezLpaIuoESOg3z+bnGLZYGn
I/nmlmz7cqb4MjBjcb2zZd0ihYXVa0I6Mzsc+VzQECOxMmfhIZ/Sutw+BDH23Gqo
wW1KIpJWJyIyU4SZHn/Z96+fQNzHXe7N+Qu1gcgp3DHxukXGjhp3U1BpUAuV6dJ3
oiUrQCqES7WNlS7S0w3UTe1bubSKTsMFbI2tCXvnYXzGMKRM7zZF1H3hEQ8FRp/z
aVXjUeqQ2QwtEglFOQpwhAIWBWUMhacEyPw5/ITt1T6cDZ2vXqUBeAT5LUXv6zEy
R273T3N1rdym5glKXTK398Z7hUGCmzSPtJoVmKyJqZJvH3nzAmK43cLcoJ9wjG3S
Y5CJmViV40CxlUisvMu7jZP7cb8bbY3IpnbZt4MJcDcIK8z+6aE=
=z0jz
-----END PGP SIGNATURE-----

--weag3fumpaj4truu--
