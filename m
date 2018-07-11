From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH v2 00/18] Allwinner R40 HDMI refactoring
Date: Wed, 11 Jul 2018 15:36:03 +0200
Message-ID: <20180711133603.xfc5fxkocdl4okca@flea>
References: <20180710203511.18454-1-jernej.skrabec@siol.net>
 <2406320.TaIT7vHipu@jernej-laptop>
 <20180711093016.bcnsnogbj26azoo7@flea>
 <5673885.I9ZBC4zXdg@jernej-laptop>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hnnak6lg7buneo2o"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBR4PTDNAKGQE7C4BBIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <5673885.I9ZBC4zXdg@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hnnak6lg7buneo2o
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2018 at 11:34:58AM +0200, Jernej =C5=A0krabec wrote:
> Dne sreda, 11. julij 2018 ob 11:30:16 CEST je Maxime Ripard napisal(a):
> > On Wed, Jul 11, 2018 at 10:41:54AM +0200, Jernej =C5=A0krabec wrote:
> > > Dne sreda, 11. julij 2018 ob 10:30:36 CEST je Maxime Ripard napisal(a=
):
> > > > On Tue, Jul 10, 2018 at 10:34:53PM +0200, Jernej Skrabec wrote:
> > > > > This series fixes several issues found in R40 HDMI patch series a=
fter
> > > > > it was applied. Conversation can be found here:
> > > > > http://lists.infradead.org/pipermail/linux-arm-kernel/2018-June/5=
86011
> > > > > .htm
> > > > > l
> > > > >=20
> > > > > Patches are based on latest linux-next (next-20180710) and are or=
dered
> > > > > in such way that they don't break R40 HDMI at any time. Because o=
f
> > > > > that
> > > > > I suggest that whole series goes through drm-misc to preserve tha=
t
> > > > > order.
> > > > >=20
> > > > > I also tested those patches on H3 to make sure it doesn't break o=
ther
> > > > > platforms. However, it would be nice to test for regressions also=
 on
> > > > > older SoCs (with DE1).
> > > > >=20
> > > > > Best regards,
> > > > > Jernej
> > > >=20
> > > > Applied all patches but the patch 10, thanks!
> > > > Maxime
> > >=20
> > > Ok, I'll send patch 10 separately. However,  patch 4 needs a fix acco=
rding
> > > to test build robot:
> > >=20
> > > if (IS_ERR_VALUE(index))
> > > should be:
> > > if (index < 0)
> >=20
> > Yeah, sorry, I forgot to say it, but I fixed it locally (and the
> > return below as well).
> >=20
> > > Additionally, due to Arnds patch merged (drm/sun4i: fix build failure=
 with
> > > CONFIG_DRM_SUN8I_MIXER=3Dm), sun4i_tcon.c needs additional handling i=
f
> > > TCON_TOP driver is not build.
> >=20
> > I'll drop it then, I haven't pushed it yet.
>=20
> Which one? This series or patch from Arnd?

Arnd's

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

--hnnak6lg7buneo2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltGB8IACgkQ0rTAlCFN
r3QYJQ/+P1yS3MgYDX0jTqbk2BULEKMMiWss7TqkoiI/xkQXSUPdT1GW2FwPLjl0
JRplz1FoX/KnuM6Ii91Fp1gftkzv6Od/g2mp5d8D4GM1DZY282rVDO0+GhZNM5LB
4e/4Hu31RmONkRn7uDpJJmaffQVb25ReZCBH6wss3XRtL2m5fP9/7fSwzgCjK/ed
PvowGDR2tMyNP1PTaOLOSHY+T7WNocgwLRu0ROqw5NNriBLhQaY+Q/GHfsaVkFO2
hlC0C9OcAfVZGI1jVROlVDPuUnSYVwZ15C2+QENGX+RjZ4oF5tpscLwIcvSiH6U5
uW5P3OxPDNvKsa54ruPFHJ1hP3fjrFtSVJTVLXjfUu8Owm2vdOGMwkw5Wo84htiY
6Ouc9wjQCjv+ydoF+jX/TO9qifYcA70pA09DzAAbeWVcSJFBDQFEZCi+65FqHRiC
NaFJcxBW52wKdtDd7hsAod8J5woqAu98TNrN0Oe7OPukFKP2Sx/+61zr4nnPJANf
QXkY5vjXteVEJ+s4KSBqTu6KoDZymziidXiruBng86k5qMf9+qhThqAlC321FivP
4VzV58e4svieFzACUplWp9EEnBP+ki+7KPs5/aCuBkjMkckkxTQuWWYR1VYfn/Hx
AploudqjQ5uGCY0CpCP8AGSSo6DQlu8dNO8Gm5kwzIghUeVVA+Y=
=Gt5C
-----END PGP SIGNATURE-----

--hnnak6lg7buneo2o--
