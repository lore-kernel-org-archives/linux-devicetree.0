From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 10/29] drm/sun4i: Rename DE2 registers
 related macros
Date: Tue, 9 Oct 2018 17:53:48 +0200
Message-ID: <20181009155348.exmeyvvelxwnv3b5@flea>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
 <20181007093905.11253-11-jernej.skrabec@siol.net>
 <20181008101828.hb4xtppbexwalbkk@flea>
 <11072788.dZi9MDiihb@jernej-laptop>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qlwprrpwi56itdhx"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBF466POQKGQEUKX7DMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <11072788.dZi9MDiihb@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--qlwprrpwi56itdhx
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 08, 2018 at 04:28:41PM +0200, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 08. oktober 2018 ob 12:18:28 CEST je Maxime Ripard napisa=
l(a):
> > Hi,
> >=20
> > On Sun, Oct 07, 2018 at 11:38:46AM +0200, Jernej Skrabec wrote:
> > > In preparation to introduce DE3 support, change prefix from "SUN8I_" =
to
> > > "DE2_". Current prefix suggest that it's valid only for one family,
> > > whereas in reality, DE2 unit is used also on sun50i family.
> > > Additionally, it will be easier to distinguish DE3 specific macros by
> > > using "DE3_" prefix.
> > >=20
> > > No functional change in this commit.
> >=20
> > I'm not too sure about this one. There's basically two ways to look at
> > this: you described the first one, and the second one would be to
> > treat it as we do for the compatibles: the IP was introduced on one
> > SoC family, and then got used on some other ones.
> >=20
> > Trying to always match the one you have however have a quite big
> > maintainance cost, as can be shown by your patch: you always have to
> > adapt comments, function names, defines, etc. This creates a lot of
> > useless churns (ie, non-functional changes) in the drivers, that need
> > to be written in the first place, and then reviewed.
> >=20
> > It's just not worth it.
>=20
> Well, using family neutral way would mean that there is no need
> anymore for adaptation in the future, but as you wish.

If you consider only the DE case, where it has been numbered by
design, yes. If you consider all the other controllers that haven't
been (like, SPI, or the USB PHY, for example), then you end up with
two drivers that are using the same names, with no easy way to tell
which is which

> What prefix should I use for DE3 specific registers?

We should just follow the same pattern, and use the first family where
it was introduced. So sun50i, I guess?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--qlwprrpwi56itdhx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlu8zwsACgkQ0rTAlCFN
r3QqwQ/+IoZy8t7aGMla11oE/6yNeaFJ34IxjnNbHLImveD7Ovr9f5ba3XSoQpxX
AX83BsNpV0Y3c42ZOIAE5O1sJ9dO0P9YAQXsWIhtglWpt6PByfJ6fP6oHmV2Oacn
4THjYt00r1vGtrjU9RpTVQ5deR1dLTLobPc1pB0gTCzRn3W7mnqdMs2p/yT2SMyT
sPqwmVvK7flMM1B/h6yG9nzTsWzj4Xh64+Y7w+eviUUVqS7PpL5yG+y2zFeag3rH
3KYKqWzaewOisFJZhHv9T/Q3NC1XXdNn8Dv4fg3i6zcPJFxi1oWFp44PXEMHEJsd
3FtTxLSbk8IvYSRWkd+qVKLKngstpA97wJ84MTpRaEeIVk39vwBYRuvQwwG6aior
+1juz0zdqLmDihnNfo/JhyEd8z32CPOxSAJBaWz9AspFynHtS17vM0qzFupQfiSK
w7iCl8cplcfoFRJj+qFexAzPeL6Q3HSNRu0nQJ/hRnXQs3QbXFNWalHJ8R9slzH2
S4hsP7X9xGx55xZEQM23CtHve1zMQ6uZPdJ8ncRmkFsAA6OL2YGCVTEauSxa8bge
dXD7ZMm3+ucSJ6c4jRFJb9VL13FVFxgYYn9u1HcY9B7DK97Y1UldMP4jHs+SQFGy
SI1gafvdOxtaIaATXp2SbPmAoh3PjKgVLr//lAjul9m822mnxLU=
=VJae
-----END PGP SIGNATURE-----

--qlwprrpwi56itdhx--
