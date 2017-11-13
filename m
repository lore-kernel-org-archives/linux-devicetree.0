From: James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>
Subject: Re: [PATCH] MIPS: implement a "bootargs-append" DT property
Date: Mon, 13 Nov 2017 11:23:12 +0000
Message-ID: <20171113112312.GZ15260@jhogan-linux>
References: <1510420788-25184-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PxDrs/Fpf4pPiewX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510420788-25184-1-git-send-email-daniel-R/FLGEdV95bo9U+Z1CfBt0SU0eOFXohjCypLqA8HKkk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Gimpelevich <daniel-R/FLGEdV95bo9U+Z1CfBt0SU0eOFXohjCypLqA8HKkk@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--PxDrs/Fpf4pPiewX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2017 at 09:19:48AM -0800, Daniel Gimpelevich wrote:
> There are two uses for this:
>=20
> 1) It may be useful to split a device-specific kernel command line between
> a .dts file and a .dtsi file, with "bootargs" in one and "bootargs-append"
> in the other, such as for variations of a reference board.
>=20
> 2) There are kernel configuration options for prepending "bootargs" to the
> kernel command line that the bootloader has passed, but not for appending.
> A new option for this would be a less future-proof solution, since things
> like this should be in the dtb.
>=20
> This is tested on MIPS, but it can be useful on other architectures also.
>=20
> Signed-off-by: Daniel Gimpelevich <daniel-R/FLGEdV95bo9U+Z1CfBt0SU0eOFXohjCypLqA8HKkk@public.gmane.org>

The device tree maintainers should be on Cc. Adding them now.

Cheers
James

> ---
>  arch/mips/kernel/setup.c | 3 +++
>  drivers/of/fdt.c         | 4 ++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index fe39397..95e9bf2 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -826,7 +826,10 @@ static void __init arch_mem_init(char **cmdline_p)
>  	extern void plat_mem_setup(void);
> =20
>  	/* call board setup routine */
> +	strlcpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
>  	plat_mem_setup();
> +	if (strncmp(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE) =3D=3D =
0)
> +		boot_command_line[0] =3D '\0';
> =20
>  	/*
>  	 * Make sure all kernel memory is in the maps.  The "UP" and
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index ce30c9a..65dbda6 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1127,6 +1127,10 @@ int __init early_init_dt_scan_chosen(unsigned long=
 node, const char *uname,
>  	p =3D of_get_flat_dt_prop(node, "bootargs", &l);
>  	if (p !=3D NULL && l > 0)
>  		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
> +	p =3D of_get_flat_dt_prop(node, "bootargs-append", &l);
> +	if (p !=3D NULL && l > 0)
> +		strlcat(data, p, min_t(int, strlen(data) + l,
> +					COMMAND_LINE_SIZE));
> =20
>  	/*
>  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
> --=20
> 1.9.1
>=20
>=20

--PxDrs/Fpf4pPiewX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloJgJgACgkQbAtpk944
dnpf+xAAmG5LEovzRhR7TAmxD1nvBm0tHkZU+/HwJiu5w4nG305C6oMO/WKtdHDr
w5fgwnipppZnMpX+K39Nkr2pa0mB0AZS0SFHDehr/Kq03oN/LpGLTUgGVM7HyhBu
3qQoYuBOSiGnQTMBkxbSMGYFKHYqAEJYD8LcPr5g3LP7xXubVUXFYI/cQr1QnkH5
m2AgRHMTXAyIAkPTHxe+fzA2KaHaE2une6uA0bsMR9/rQv2nHoJy33X6r4+dyKPd
upXmxWsrnRmO3FDYnthyo587Jqpq+Equ/R1uGnPylePk/izjWlj5braseyUtdE0C
SfFIHTagkce2kTn9jeSOvDaj2UuD4curgVEBV44/b5kk2rKdUc1dXUVZd/nihvyH
/29pTCr9ROU3OCuMdwF838q9mvZV2mhFg2fQTLxrPJLKBKYkNWWVjSqLI0U0gng2
4msI/EXmjB//F1WQ3o8s8j8HAnUYVofJHMPBnOkreripEmfJxxyvx3m/nMfEG9AI
nO/zDzFPQZ/aS9yig+j2tjlktAZE/4GdcLHixkFHGWx8P/c77mIkXUq1dPLOFn7/
olhpkcR/qMWe6M+i2QzNrKaaROK/wQZfKbhl5AnmB/iHHWbPajuiYl1N+H7k9VJM
eN2qGIx7citvTK1GVykdR9tr++owNvKGaYVuPgjO/t3zzQNlBJo=
=DCvJ
-----END PGP SIGNATURE-----

--PxDrs/Fpf4pPiewX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
