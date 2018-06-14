From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 02/14] drivers: soc: sunxi: Add dedicated compatibles
 for the A13, A20 and A33
Date: Thu, 14 Jun 2018 15:02:31 +0200
Message-ID: <2d9de70f50bbf358592c3e219a3e4890bb0806d6.camel@bootlin.com>
References: <20180507124500.20434-1-paul.kocialkowski@bootlin.com>
         <20180507124500.20434-3-paul.kocialkowski@bootlin.com>
         <CAGb2v67An8RSCKEDSgW_jY7m8iw22K4rRHb02q67decmCBcjhg@mail.gmail.com>
         <20180511102033.i6jtzljbvkg47wz3@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-NuyhO5kvTiC4yiicAtYf"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180511102033.i6jtzljbvkg47wz3@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S . Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Hans Verkuil <hans.verkuil@cisco.com>, Arnd Bergmann <arnd@arndb.de>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>Ramesh Shanmugasundaram <ra>
List-Id: devicetree@vger.kernel.org


--=-NuyhO5kvTiC4yiicAtYf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 2018-05-11 at 12:20 +0200, Maxime Ripard wrote:
> On Thu, May 10, 2018 at 10:05:33PM -0700, Chen-Yu Tsai wrote:
> > On Mon, May 7, 2018 at 5:44 AM, Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > > This introduces platform-specific compatibles for the A13, A20 and A3=
3
> > > SRAM driver. No particular adaptation for these platforms is required=
 at
> > > this point, although this might become the case in the future.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  drivers/soc/sunxi/sunxi_sram.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi=
_sram.c
> > > index 74cb81f37bd6..43ebc3bd33f2 100644
> > > --- a/drivers/soc/sunxi/sunxi_sram.c
> > > +++ b/drivers/soc/sunxi/sunxi_sram.c
> > > @@ -315,6 +315,9 @@ static int sunxi_sram_probe(struct platform_devic=
e *pdev)
> > >=20
> > >  static const struct of_device_id sunxi_sram_dt_match[] =3D {
> > >         { .compatible =3D "allwinner,sun4i-a10-sram-controller" },
> > > +       { .compatible =3D "allwinner,sun5i-a13-sram-controller" },
> > > +       { .compatible =3D "allwinner,sun7i-a20-sram-controller" },
> > > +       { .compatible =3D "allwinner,sun8i-a33-sram-controller" },
> >=20
> > We should probably name these "system-controller". Maxime?

Would you like me to make that change for v4 of this series, or have it
a separate follow-up patch outside of this series?

> This would make sense yes, but we don't really need to add the A20 one
> to the driver, it's exactly the same than the A10.

Noted, I'll ditch the a20 compatible from the next revison of the
series.

Thanks for the feedback,

Paul

--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-NuyhO5kvTiC4yiicAtYf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlsiZ2cACgkQ3cLmz3+f
v9FTYgf/Z9ccTpj1p9hC/kdcYrczKVXwwfvmVYxuNppZNMbwJs5Cx0+9tFM++wKk
tunZP5oe7FvYLZT+RZz0uy6xhxYxvByNGzm1oqquCELEksl8UqY1TUFUjqTYEftk
6o+ldMq4D36PZe6B16F+gSBaJUHbdGvzf1ZcgGJDj87k1eU8QaVAvfT9SQQ9viA9
R7tnMPdroU1wEP+9Y95ExH1R0qZZ6WIhnGv5YEw6Jn4AhgxAL7JKHzW2sBL76To+
3fOQsTMxBRKGG93zLMESn21OujSgtPm4pIPBH37551qPJLcvSDe4k8t82DE059Ee
C8mQrYcPsGQrJfDvGzQqh6tiaHiUSA==
=sdUU
-----END PGP SIGNATURE-----

--=-NuyhO5kvTiC4yiicAtYf--
