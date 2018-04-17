From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v6 09/11] ARM: sun8i: smp: Add support for A83T
Date: Tue, 17 Apr 2018 13:20:38 +0200
Message-ID: <20180417112038.mw7bfhqw4xwvzxcw@flea>
References: <20180416215032.5023-1-mylene.josserand@bootlin.com>
 <20180416215032.5023-10-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lgwud7yazkhhokzr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180416215032.5023-10-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>
Cc: linux@armlinux.org.uk, wens@csie.org, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, clabbe.montjoie@gmail.com, quentin.schulz@bootlin.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--lgwud7yazkhhokzr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 16, 2018 at 11:50:30PM +0200, Myl=E8ne Josserand wrote:
> @@ -535,8 +599,12 @@ static int sunxi_mc_smp_cpu_kill(unsigned int l_cpu)
>  	return !ret;
>  }
> =20
> -static bool sunxi_mc_smp_cpu_can_disable(unsigned int __unused)
> +static bool sunxi_mc_smp_cpu_can_disable(unsigned int cpu)
>  {
> +	/* CPU0 hotplug not handled for sun8i-a83t */
> +	if (is_sun8i)
> +		if (cpu =3D=3D 0)
> +			return false;
>  	return true;

I think Chen-Yu told you how to implement the hotplug in the previous
iteration, did you have time to test it?

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--lgwud7yazkhhokzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrV2IYACgkQ0rTAlCFN
r3QEvQ//YNKIPOzNoGa2Ejl3faAXyCu/JYHhZv5UefGzirp0ZGAkXxwtGsVxVsU2
UA8ANWgoTabJ63vqsQE9C0cyVSOg6o/maP/dSwob3RsdeXvBY6Tmeb2UIm9MUYiM
UDkEM7Da1VVK15r6raCgnkb1Dk3jiGoWUD2TqXjT8VE97R6t0f9KYQeI2tm8RVUV
UB9o1kJ/tTvLdsCi32Y0DfDYUe/uWPa/x1n1Ks4sZgt/493Z/1zUN0qrIzR8Cwwp
P45P1byWjmK+Rm9DijUO6DiEutmpdLcThogh3K52KRuyWIIW6fdZCjLT11NUDpDo
Q/YCt7tF/0xsupP6dPQJYtveoMhXxK7HjI/HjA2RuW4+LC9794QI6/eVMe+5USLw
E49ReIJoY3THaVICOyTllKpRyiQ9Q78fnb45i5JiyUrP4pn4m1YtcEBt8MjZ0pre
G/MbGgMcUYSYixLjU6SJiiirWuwY6SDmpeIOSUP2YfFL1rZcHvt0KMfZoZ6GJz28
ojzBqXvNitOdLiTUvv6d1FIOZ2A1WZBtLdDQTR7bj1v0wKOGH9teqtsiucP3IRak
nA1U9TCrtMNW0I4Jq4nE0mpg3c4i0+p1cLzrU5FgQahoq2VGiZ1Mj1M6Nt83kHWx
u7Y2NQ0k86EhrSP4wR7GtXsaA2EzGqkvCyltVFQJ3daV/2QqAuI=
=tbwW
-----END PGP SIGNATURE-----

--lgwud7yazkhhokzr--
