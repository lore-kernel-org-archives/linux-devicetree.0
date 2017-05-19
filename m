From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [RFC PATCH 02/11] drm: sun4i: add support for
 H3 mixers
Date: Fri, 19 May 2017 20:00:15 +0200
Message-ID: <2675772.KPXzA3y97S@jernej-laptop>
References: <20170517164354.16399-1-icenowy@aosc.io> <20170519174729.q5qk2vqlibzx3zrv@flea.home> <695DFDD0-1925-433C-AB88-B90EE461C203@aosc.io>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBM7F7TEAKGQE4NESQYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <695DFDD0-1925-433C-AB88-B90EE461C203-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

Dne petek, 19. maj 2017 ob 19:49:58 CEST je Icenowy Zheng napisal(a):
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
1:47:29, Maxime Ripard <maxime.ripard@free-
electrons.com> =E5=86=99=E5=88=B0:
> >On Thu, May 18, 2017 at 12:43:45AM +0800, Icenowy Zheng wrote:
> >> From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >>=20
> >> Allwinner H3 SoC has two mixers, one has 1 VI channel and 3 UI
> >
> >channels,
> >
> >> and the other has 1 VI and 1 UI.
> >>=20
> >> Add support for these two variants.
> >>=20
> >> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> ---
> >>=20
> >>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>=20
> >> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> >
> >b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> >
> >> index cb193c5f1686..d658a3a8159a 100644
> >> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> >> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> >> @@ -390,11 +390,29 @@ static const struct sun8i_mixer_cfg
> >
> >sun8i_v3s_mixer_cfg =3D {
> >
> >>  	.ui_num =3D 1,
> >> =20
> >>  };
> >>=20
> >> +static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg =3D {
> >> +	.vi_num =3D 1,
> >> +	.ui_num =3D 3,
> >> +};
> >> +
> >> +static const struct sun8i_mixer_cfg sun8i_h3_mixer1_cfg =3D {
> >> +	.vi_num =3D 1,
> >> +	.ui_num =3D 1,
> >> +};
> >> +
> >>=20
> >>  static const struct of_device_id sun8i_mixer_of_table[] =3D {
> >> =20
> >>  	{
> >>  =09
> >>  		.compatible =3D "allwinner,sun8i-v3s-de2-mixer",
> >>  		.data =3D &sun8i_v3s_mixer_cfg,
> >>  =09
> >>  	},
> >>=20
> >> +	{
> >> +		.compatible =3D "allwinner,sun8i-h3-de2-mixer0",
> >> +		.data =3D &sun8i_h3_mixer0_cfg
> >> +	},
> >> +	{
> >> +		.compatible =3D "allwinner,sun8i-h3-de2-mixer1",
> >> +		.data =3D &sun8i_h3_mixer1_cfg
> >> +	},
> >
> >So the only difference between the two is the number of ui planes?
>=20
> Not only., but currently we only implemented this.
>=20
> More functions differ, but we still don't support them...
>=20

As far as I can tell, they only differ in ui & vi number of planes and betw=
een=20
different SoCs, max plane size.

Icenowy,
Do you know any other property they differ? I think everything else is base=
d=20
mostly on ui & vi number of planes.

Best regards,
Jernej

> >Why not create a property to give the number then, instead of a
> >compatible?
> >
> >Maxime
>=20
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group. To unsubscribe from this group and stop receiving
> emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org=
.
> For more options, visit https://groups.google.com/d/optout.


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
