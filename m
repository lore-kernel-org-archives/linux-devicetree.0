From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 02/10] dmaengine: sun6i: Correct burst
 length field offsets for H3
Date: Mon, 18 Sep 2017 09:58:37 +0200
Message-ID: <20170918075837.quzrgygzzpdsooh2@flea.lan>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-3-stefan.bruens@rwth-aachen.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fkwssu6i56622utj"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLPZ7XGQKGQEJRWSAAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170917031956.28010-3-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fkwssu6i56622utj
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 17, 2017 at 05:19:48AM +0200, Stefan Br=C3=BCns wrote:
> For the H3, the burst lengths field offsets in the channel configuration
> register differs from earlier SoC generations.
>=20
> Using the A31 register macros actually configured the H3 controller
> do to bursts of length 1 always, which although working leads to higher
> bus utilisation.
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

--fkwssu6i56622utj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZv3ysAAoJEBx+YmzsjxAg8M4QAJrpPWkV4R5lsw+rs7ngoaKw
TKMz73h55EaySMh3NL1e/hjf9gOya6RZZt2cux9cYRHmUFs3Pfw4/1JvRwMBhEl6
uekcKF4IhKrTVhGKmMepBKtBQ64g7QuOFJhW4jOa8iNRZWVV19+CyUsM+YHi56cp
L6tPRrIkEUB8kgG9djraayQ7s2yWE9Uax7MDHEcmK6KsORxfiKkFAevHfN7yyaI0
15GRBuJ2RaPW6JW7pL7IkHfSEqIdiWN+D0OOgYBYhjaygmRc1Q+Z+CxmixhKFJwN
mOkYZST3zVSggSZuqFfKwKvQkXYWwvDBijwEuilteyLbl4feMXjdA3/o6NOkrTqL
CEKz15zD0nm3oEGut1pthbXFvEvVP8Ex1WygD/XTZ4xr6oFYCB1t8ueoJWO1vFGM
4olAM38NVudxUJ42U/sSovdhRE8fPcD6oWmWT9BH7QrU7UF200V2Z7wFPsLE2Dfj
eW1IvCX4ffyC3Te/YuZYaghZA6p9DdUldqhkBW5MPHDjWlR87djBkyVAX7hhsbjp
IxpU2uvY1E0P0TCznTwj3S0mbl2geEQKlPX1pLADyTwg5ZlEuI4IeiTbzWkx4X4T
g+ATL2EsA0Azj+4oWyJY4ZoCoYnXfbLlflpHp5xau6/pfjHoJD9d2xVKmxdb4W9S
MVkEJzxIAShdpwBTsmEb
=Uu7C
-----END PGP SIGNATURE-----

--fkwssu6i56622utj--
