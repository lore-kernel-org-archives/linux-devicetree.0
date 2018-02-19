From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 3/7] ARM: dts: sun8i: Add PRCM device node for the
 A83T dtsi
Date: Mon, 19 Feb 2018 09:48:22 +0100
Message-ID: <20180219084822.zudk3w55z75lx5gx@flea.lan>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
 <20180219081837.15482-4-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5935879829263143353=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219081837.15482-4-mylene.josserand@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@bootlin.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, quentin.schulz@bootlin.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, clabbe.montjoie@gmail.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5935879829263143353==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h5iq7xbklwuo4uuy"
Content-Disposition: inline


--h5iq7xbklwuo4uuy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 19, 2018 at 09:18:33AM +0100, Myl=E8ne Josserand wrote:
> As we found in Sun9i-A80, PRCM is a collection of clock controls,
> reset controls, and various power switches/gates.
> It is used with CPUCFG for SMP bringup and CPU hotplugging.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@bootlin.com>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
> index e45bab836620..3e7317ec3e43 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -699,6 +699,11 @@
>  			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> +		prcm@1f01400 {
> +			compatible =3D "allwinner,sun8i-a83t-prcm";
> +			reg =3D <0x1f01400 0x400>;
> +		};
> +
>  		r_ccu: clock@1f01400 {
>  			compatible =3D "allwinner,sun8i-a83t-r-ccu";
>  			reg =3D <0x01f01400 0x400>;

These two are exactly the same nodes.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--h5iq7xbklwuo4uuy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqKj1UACgkQ0rTAlCFN
r3QXGw//Xz19zmOzKQJsUbYJpNSgHLVlYy+K/kkJg7OrAiZ+MXQzPxbgu2seLL/h
wj8Ezy1PceI7HJ86TU7oArvWofpITV4lWUjs+GvB5+K/3BUxCXAhn2kzNO4yvh0z
N1Nqvsf5OhGsvJNxp3DgEp02/pyskjZUACfqSPxRlQ2DndXZyzzjOWiKvO1gEpQ0
lbHpKSxqE+KZv5CK1orprhtVWBl8KTpjj+ELgDnhGEUVhspm0MKx/5UFFBkzl9Rv
TkLlWCxHeBhoXYu/COAn4MmSi8NwqiXuHdwLaK33Xz9pcpXNx0qMwyBUU2kanKdi
WdAazYe/A/GoT8DdVnWcMect8omh+KPmM7lJ2KUedrg1gXaqHT6Eo2UT5AagxsTe
17w/D+2srv+iBGyHLxar3wk/ParU1Eln1DvUbCvpDtP9s89XV7WeslrKuzaN2QCN
/0bl3oSrQ1Q2cgPtMq196liQxrk5Hq0WIwsGKBvSw6HWEkfsGRui1R9LA/y00gCx
a50cDTKNLW7lNJ5unW7v0zw1IJ9PhQUscfImcd7sAENMxTiYaAIyy4MjNjmn//UY
puZPiITengGQhvX1hMCnOapz9CdnuU+B4XhE2vB9upRARGqhQYWUUlB9oeMI24XW
kyLER8JnOORKQky3sKigYRkl/ShQFDg+TeEV4QTHKizhaBGaUSk=
=YeS5
-----END PGP SIGNATURE-----

--h5iq7xbklwuo4uuy--


--===============5935879829263143353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5935879829263143353==--
