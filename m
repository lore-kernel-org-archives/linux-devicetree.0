From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arch: arm: Show the serial number from
 devicetree in cpuinfo
Date: Mon, 27 Apr 2015 10:27:28 +0200
Message-ID: <1430123248.3081.1.camel@collins>
References: <1429351135-11842-1-git-send-email-contact@paulk.fr>
	 <1429351135-11842-2-git-send-email-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-C4qIiRpwKwx1wNy73vaP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429351135-11842-2-git-send-email-contact-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-C4qIiRpwKwx1wNy73vaP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 18 avril 2015 =C3=A0 11:58 +0200, Paul Kocialkowski a =C3=A9crit =
:
> This grabs the serial number shown in cpuinfo from the serial-number devi=
cetree
> property in priority. When booting with ATAGs (and without device-tree), =
the
> provided number is still shown instead.

Any further comment on this?

> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/include/asm/system_info.h |  1 +
>  arch/arm/kernel/setup.c            | 27 +++++++++++++++++++++++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/include/asm/system_info.h b/arch/arm/include/asm/sy=
stem_info.h
> index 720ea03..3860cbd40 100644
> --- a/arch/arm/include/asm/system_info.h
> +++ b/arch/arm/include/asm/system_info.h
> @@ -17,6 +17,7 @@
> =20
>  /* information about the system we're running on */
>  extern unsigned int system_rev;
> +extern const char *system_serial;
>  extern unsigned int system_serial_low;
>  extern unsigned int system_serial_high;
>  extern unsigned int mem_fclk_21285;
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 1d60beb..349790f 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -93,6 +93,9 @@ unsigned int __atags_pointer __initdata;
>  unsigned int system_rev;
>  EXPORT_SYMBOL(system_rev);
> =20
> +const char *system_serial;
> +EXPORT_SYMBOL(system_serial);
> +
>  unsigned int system_serial_low;
>  EXPORT_SYMBOL(system_serial_low);
> =20
> @@ -821,8 +824,29 @@ arch_initcall(customize_machine);
> =20
>  static int __init init_machine_late(void)
>  {
> +#ifdef CONFIG_OF
> +	struct device_node *root;
> +	int ret;
> +#endif
> +
>  	if (machine_desc->init_late)
>  		machine_desc->init_late();
> +
> +#ifdef CONFIG_OF
> +	root =3D of_find_node_by_path("/");
> +	if (root) {
> +		ret =3D of_property_read_string(root, "serial-number",
> +					      &system_serial);
> +		if (ret)
> +			system_serial =3D NULL;
> +	}
> +#endif
> +
> +	if (!system_serial)
> +		system_serial =3D kasprintf(GFP_KERNEL, "%08x%08x",
> +					  system_serial_high,
> +					  system_serial_low);
> +
>  	return 0;
>  }
>  late_initcall(init_machine_late);
> @@ -1091,8 +1115,7 @@ static int c_show(struct seq_file *m, void *v)
> =20
>  	seq_printf(m, "Hardware\t: %s\n", machine_name);
>  	seq_printf(m, "Revision\t: %04x\n", system_rev);
> -	seq_printf(m, "Serial\t\t: %08x%08x\n",
> -		   system_serial_high, system_serial_low);
> +	seq_printf(m, "Serial\t\t: %s\n", system_serial);
> =20
>  	return 0;
>  }


--=-C4qIiRpwKwx1wNy73vaP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVPfLwAAoJEIT9weqP7pUMtmgP/2kIAQT7hoHSUL9sic4bJbmg
fuYTI/1H9dzsrDqg08GNwJtnmM2V2SxJ8wrv80NXyTbFYwRstX/axTSlRshutNGP
W4/roV1AMwZiW3AuYTCXgPUATOKpeGnOVdAEXKBRl+2QhQbB7fblVMIqu1BuXAe4
FbQYPZ9S9yiAv0a17sgtTZFjDwzvGTONMLwmv19bwBfqBrUDyUinsy6JFSsj7ztL
oE7y8QZv9/B13cUGOmCkFZX4ffowMpQ7/3Wj88GRuFzx37jXwq+j3INqUD21QM1y
EWjY65boGZz+IoD1MDY1Nzo8PWOm2jnA0J0AgW4oXNDu6a5RdRXhGTzqvrDPnRUD
TQ8rxfTLfe0jnCbCcZ3tWu+iEi+bdf19D5oyzJiGqwDVr8UN6mshXiRLXAWQjhJF
K3VKmwm8iXXj2lY89Qgx5XqACg5Yexyd00+vePfuPozQBuITpz73H1fZzMSWaGdS
4TxLh05VTE9LxcXCZFRLIaGzk+sx6GvlftpWuOgMQo50j0c+xAN4SOWVre8Fcbj1
CGyENLC6C3XamTBNP1+JG85gT9oUTfRpyG7kiE7izxbSGk/0lfn91+p1bgyfQ2d5
G+hekjWbfcbFFhJyPesI7xfeW1SRyO4tufflpeXgVbKjQAozRLOA87Ff24wLtGki
EBlR6xOfp/gd8bIdHOp+
=7WUR
-----END PGP SIGNATURE-----

--=-C4qIiRpwKwx1wNy73vaP--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
