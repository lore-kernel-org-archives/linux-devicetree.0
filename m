From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/2] ARM: sun8i: dt: Add mali node
Date: Mon, 30 Jan 2017 15:00:15 +0100
Message-ID: <20170130140015.dopcfbula6spu2xo@lukather>
References: <a4d90de597cfcfab5fddeeb538505774a980818b.1485180017.git-series.maxime.ripard@free-electrons.com>
 <681511dd6370b9146ae8e3f8009eba1e15d36cc0.1485180017.git-series.maxime.ripard@free-electrons.com>
 <20170127202119.cnnuuojtjor6rleg@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4880230537610462990=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170127202119.cnnuuojtjor6rleg@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Carlo Caione <carlo@caione.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4880230537610462990==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ldmwckukedrsl4t7"
Content-Disposition: inline


--ldmwckukedrsl4t7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Jan 27, 2017 at 02:21:19PM -0600, Rob Herring wrote:
> On Mon, Jan 23, 2017 at 03:00:46PM +0100, Maxime Ripard wrote:
> > The A23 and A33 have an ARM Mali 400 GPU. Now that we have a binding, a=
dd
> > it to our DT.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/s=
un8i-a23-a33.dtsi
> > index e4991a78ad73..982705719ef2 100644
> > --- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> > @@ -486,6 +486,32 @@
> >  			#size-cells =3D <0>;
> >  		};
> > =20
> > +		mali: gpu@01c40000 {
>=20
> Drop leading 0.
>=20
> > +			compatible =3D "allwinner,sun8i-a23-mali",
> > +				     "allwinner,sun7i-a20-mali", "arm,mali-400";
> > +			reg =3D <0x01c40000 0x10000>;
>=20
> Does this really use 64K or that's just the register spacing? Set it
> to what's used.

The memory maps in our datasheet allocates 64k for that block. I
always thought that we had to put the size of the whole memory block
allocated to that device.

For now, the driver only uses space up to 0xe000 (so we wouldn't
"waste" a lot of space anyway), but what if at some point the driver
needs more than what we put in the DT?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ldmwckukedrsl4t7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYj0bqAAoJEBx+YmzsjxAgJiYP/3SPlVqG7n3FHeqm1jwVQ2F/
zZk0k6joz9gJSsc4/EWazV0orbF8P0cB9OLfZG3ElqFS9zq/ZwakZ6PkpDqrhUVo
mpHkUwfl1hNh/cC41U91nzTP0ci0JRNvg+T/KmFhI2ns8YqOitpHoJsBgpjYbMDN
+ldxcF1ne/8CyfIBNhpaQLwI+zcG8reaP5n/iX7EF5/r7/+KdQBstrAr0nMAa97f
0SxTno1LPcsDbFuXZexDiKpsFoCwlVjaRjy+ZsxuvJ/CFY+BCD7JBb1xmyy783cp
epP84ZjlAt/vcYJJYNA7MbyZt0LPFMhS6Sn9VH2fgxxyC4Dv1CB2p/rP1y0SDSdW
y9WB6NJ1NvGnR58hDzzJAZpyX0VW2hyKd2kMlhe7ZYh8+IEcp4a4ySTTWPVG/JR4
aJtmhJUDNFnDkiKboOhHJ+O5K7Dhqhe/kZqGn2RYqssk2rI2MOgpuwyMQJSCyYLe
FS/Awv8cX5lGt0FAsbuBBwGnlUS9pMwWRcEf+7ZkInuyrS+B1GeKwTpVOGyoxOLm
bnVLWWzevhmr3yrqZ3oG3A17EiS0j55NpdMvrSjcDtnVO1Qo0+Z353vDq1w7l89S
A0g0eWPoepe3mb/Omjp0KORJrtsyRacF5nOF7Sr7Lj6kPghxgNcDQda/Fpm/vg1Y
OYjWGM0i+SP4azKUKdno
=lh/4
-----END PGP SIGNATURE-----

--ldmwckukedrsl4t7--


--===============4880230537610462990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4880230537610462990==--
