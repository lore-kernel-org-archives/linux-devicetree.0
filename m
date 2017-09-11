From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 10/13] openrisc: add simple_smp dts and defconfig for
 simulators
Date: Tue, 12 Sep 2017 00:37:12 +0200
Message-ID: <20170911223712.GA31546@amd>
References: <cover.1504129273.git.shorne@gmail.com>
 <37f0d48de4690694c18be3d32483dafee0730859.1504129273.git.shorne@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <37f0d48de4690694c18be3d32483dafee0730859.1504129273.git.shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Openrisc <openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org>, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-08-31 07:03:11, Stafford Horne wrote:
> From: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
>=20
> Simple enough to be compatible with simulation environments,
> such as verilated systems, QEMU and other targets supporting OpenRISC
> SMP.  This also supports our base FPGA SoC's if the cpu frequency is
> upped to 50Mhz.
>=20
> Signed-off-by: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
> [shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: Added defconfig]
> Signed-off-by: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/openrisc/boot/dts/simple_smp.dts      | 58 ++++++++++++++++++++++++=
++
>  arch/openrisc/configs/simple_smp_defconfig | 66 ++++++++++++++++++++++++=
++++++
>  2 files changed, 124 insertions(+)
>  create mode 100644 arch/openrisc/boot/dts/simple_smp.dts
>  create mode 100644 arch/openrisc/configs/simple_smp_defconfig
>=20
> diff --git a/arch/openrisc/boot/dts/simple_smp.dts b/arch/openrisc/boot/d=
ts/simple_smp.dts
> new file mode 100644
> index 000000000000..47c54101baae
> --- /dev/null
> +++ b/arch/openrisc/boot/dts/simple_smp.dts
> @@ -0,0 +1,58 @@
> +/dts-v1/;
> +/ {
> +	compatible =3D "opencores,or1ksim";

You may want to add some comment on top, explaining what this
is... and perhaps link to some page documenting how to set up
qemu/FPGAs?

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm3EBgACgkQMOfwapXb+vK4pwCggj7M/cmtkjf4eamJYoUFW7YH
HwAAn2sIyVXcnAH+9WyUx0IZCgIdRpAg
=e3vX
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
