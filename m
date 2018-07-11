From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 00/18] Allwinner R40 HDMI refactoring
Date: Wed, 11 Jul 2018 11:30:16 +0200
Message-ID: <20180711093016.bcnsnogbj26azoo7@flea>
References: <20180710203511.18454-1-jernej.skrabec@siol.net>
 <20180711083036.7attjq4hm5ay5gmn@flea>
 <2406320.TaIT7vHipu@jernej-laptop>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2i47dnbrxp5mgx2c"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBM44S7NAKGQETEL63MQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <2406320.TaIT7vHipu@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2i47dnbrxp5mgx2c
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2018 at 10:41:54AM +0200, Jernej =C5=A0krabec wrote:
> Dne sreda, 11. julij 2018 ob 10:30:36 CEST je Maxime Ripard napisal(a):
> > On Tue, Jul 10, 2018 at 10:34:53PM +0200, Jernej Skrabec wrote:
> > > This series fixes several issues found in R40 HDMI patch series after
> > > it was applied. Conversation can be found here:
> > > http://lists.infradead.org/pipermail/linux-arm-kernel/2018-June/58601=
1.htm
> > > l
> > >=20
> > > Patches are based on latest linux-next (next-20180710) and are ordere=
d
> > > in such way that they don't break R40 HDMI at any time. Because of th=
at
> > > I suggest that whole series goes through drm-misc to preserve that or=
der.
> > >=20
> > > I also tested those patches on H3 to make sure it doesn't break other
> > > platforms. However, it would be nice to test for regressions also on
> > > older SoCs (with DE1).
> > >=20
> > > Best regards,
> > > Jernej
> >=20
> > Applied all patches but the patch 10, thanks!
> > Maxime
>=20
> Ok, I'll send patch 10 separately. However,  patch 4 needs a fix accordin=
g to=20
> test build robot:
>=20
> if (IS_ERR_VALUE(index))
> should be:
> if (index < 0)

Yeah, sorry, I forgot to say it, but I fixed it locally (and the
return below as well).

> Additionally, due to Arnds patch merged (drm/sun4i: fix build failure wit=
h=20
> CONFIG_DRM_SUN8I_MIXER=3Dm), sun4i_tcon.c needs additional handling if TC=
ON_TOP=20
> driver is not build.

I'll drop it then, I haven't pushed it yet.

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

--2i47dnbrxp5mgx2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltFzicACgkQ0rTAlCFN
r3TQTg/6A8zff6ACPntglkg/UsbOyQbI4AOEX0zkwlHl6huT9/gBPWw1rdG29GY/
jUDkyyIxRMBTQAFW+4eBygfNnnsOHb/gJypXtl4I4tzgRnvzzFzQXd7xa+ARoEKX
ij6SYjYKDzk/M4boJILeAllt23LF/pCdP8ycluY/0PwZubbSrXYHIST+uszA8Opg
X6A/2V9ZeSl02izmRuQiDLHgVJqzGwZLmWfIVZWWtD88aUBXfid0VRfGcTH0lJuJ
zKa/xfB1DMjZc+clIy9tNuTjlZtQFwuoX+LReEOIk9OFKFeu0Ia2GFMvEKH4bW1E
c5/PNqeMtJVywROfkKE4Ujq60eXH7iU5AeYxI14/v+v6YJoFWSQADVIrUsmylkML
UW7uXbJPQdQgA2OdmknKubrPYibIQJsIS1QGH1J4izD18P7Vr5GO9MBCmL5+n9O3
ldUNinfKn3EwHrPMgZt0McXX6cNQrmQtV1VdoBzoj5qEQJfe6rNfUEKg48k0ZTys
KcAwRAlwxKnwksPf4j6TfjW2MSUa8uDdnBZcY3WYk8xDZrT3S8QUer58ofLlpout
ocFxmaeBBy+KCCMoCt0wHXRK05TDBdAxGiAUUratdaBhEnGqMgG150xh+RWs/M3c
reXmKl23TU4PKRkO2QTlDxZCWArsp5sx+Pf7ZHFdRfUx85fQGwM=
=DsbC
-----END PGP SIGNATURE-----

--2i47dnbrxp5mgx2c--
