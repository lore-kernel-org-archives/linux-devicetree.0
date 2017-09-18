From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 03/10] dmaengine: sun6i: Restructure code
 to allow extension for new SoCs
Date: Mon, 18 Sep 2017 10:08:55 +0200
Message-ID: <20170918080855.yxxfcfg2yttpyi5y@flea.lan>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-4-stefan.bruens@rwth-aachen.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dix4vvap7hvwuzv2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBGH67XGQKGQEZQVCWOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170917031956.28010-4-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--dix4vvap7hvwuzv2
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 17, 2017 at 05:19:49AM +0200, Stefan Br=C3=BCns wrote:
> The current code mixes three distinct operations when transforming
> the slave config to register settings:
>=20
>   1. special handling of DMA_SLAVE_BUSWIDTH_UNDEFINED, maxburst =3D=3D 0
>   2. range checking
>   3. conversion of raw to register values
>=20
> As the range checks depend on the specific SoC, move these out of the
> conversion to distinct operations.
>=20
> Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--dix4vvap7hvwuzv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZv38XAAoJEBx+YmzsjxAgDjkP/j3HZhePfBAo/C8Rxv2MQFlm
qK5o62XFog06/CrB21Xhy+37XJOfgXpR6nw/LTSmSFETAXm5VNAh+4+K2YvaSqz9
xcy+esyLbJ2fzq9cme02LRrtq2j0xXge2klr9hxYbS84M2qpeuGV9Nh4zwVL2bH+
ktZ7Sp0KfRhf6H3+QpZF/iuk3NKWHMDsUQVd5mm1Vrpsg4FcR2i498fq6rp660Sl
z1dd//3mKfRQCbhjJfZzFCnmtnfMwf6KfFXZzlkVS5eZ2sCKkd4G6hB34F2gZ3aY
QUdZdMnkNsRbrZNKI2hVsgUCktMcqQiRvTfQf4ILYFWM/7GTz3ns3tsEioHdYvYQ
WQ6jENM50ErZoQX7Y0GSGDvAL761QOELmAoogo2/FCA9yC1rL99/Qvzn+msl8Qk2
FX26I1tjoQoaf9Py3BxIHYBlgZ34xMO7nCoZAOj+genU1GuSqeJFP09UsJY/bs7T
jI98RKMcr5e+6n9dW9MVGqWLK8+ivbt1NuD3IdHOFx9ubZivRZMdTpWsNrEmLTaE
RKiOXg6zdVLcfkmLfg37ZTgzqi7CTK96IQniOQiqOLcAU23NB6DUUlx+dBMTbzOl
ncKXUMlAhp2/dxfJPoa7U59JSDFKDBnbu0yBsQ6iivBtiV+p0fVN2WbNk9I3ALme
n2JxSiPfTITpB5Vx+KnK
=n5sy
-----END PGP SIGNATURE-----

--dix4vvap7hvwuzv2--
