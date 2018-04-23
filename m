From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm64: allwinner: h6: restore the usage of
 CCU slice macros
Date: Mon, 23 Apr 2018 09:47:34 +0200
Message-ID: <20180423074734.rb4ddxtymbxtrpzp@flea>
References: <20180403134024.43156-1-icenowy@aosc.io>
 <1524466728.25095.0.camel@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="od5hmecmkchcbpwp"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBF4763LAKGQE2D3BVJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1524466728.25095.0.camel-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--od5hmecmkchcbpwp
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 23, 2018 at 02:58:48PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2018-04-03=E4=BA=8C=E7=9A=84 21:40 +0800=EF=BC=8CIcenowy Zheng=
=E5=86=99=E9=81=93=EF=BC=9A
> > As the definition of CCU slice macros are already merged into the
> > source
> > tree, restore the usage of the macros now.
>=20
> Maxime, could you check this patch and pick it?

Applied, thanks!
maxime

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

--od5hmecmkchcbpwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrdj5UACgkQ0rTAlCFN
r3S4uA/+LcsK/bDAliFoDSFRJ4xs1DdCE4twZ3RO3CxMuQ4IkaJaCp1La8fj65lf
AWorEo4wHYL0OfJyyxurYlBUI1COaBdTPx2AdeV9sX6W+X+qyYzidsytSKL3PjPq
5EZCWX503QiTbzBaDkHacUirGg735wrSDky+/GP+9cHGYcIHWkxTXegOAryEqjUj
lG1yJebA3fpwugLJTp1URFdNoAQGjXzJ5QDID7SUJ7HfoZ2WHVmoJYzkBV64nGqy
5qQ/rL3nMG+X/kuios/J4wbpvoJx7cLUZl9bjtjLvIWP+EM4je0EABDdYaz7Lc1j
sniZW9aNciW9tKa4hHCDqhlqjmBU9ZQcHIZtqC7BlociWmfBEwYq3BsIsbzgGe3R
LUxNBjXaBsrGaxZ0AB1QcU5VXxYn+Uu8NxINk3eeh519l8Y9P4KRY1OixCP+hJDa
StNvXlK6KOpxJrjMVTT6LJsaA696wMfVuEOrf0+OzjLLRRJ1ribucC2WTLKPgKM9
tX3Igy7ax/p/nf1pG1lF8zTkp+ciYgypa0Y3cdbsn3J7yrqtCTb038lOWxiBc0Db
aehxkLeU6uTVb+gFr0/i7MUWtuP8WuUlLO5/tB6xLchHPymArd/L6+sLJP3rvgfT
r5uPxE7rR4dY9oT1cM0DLysz484GTI3X645GmrFWbwcMbpe3cDU=
=WPoO
-----END PGP SIGNATURE-----

--od5hmecmkchcbpwp--
