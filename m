From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: fix '%zx' warning
Date: Wed, 26 Jul 2017 11:30:04 +1000
Message-ID: <20170726013004.GJ8978@umbus.fritz.box>
References: <E1da2Z7-0008GG-AV@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+Hr//EUsa8//ouuB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1da2Z7-0008GG-AV-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+Hr//EUsa8//ouuB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2017 at 05:20:09PM +0100, Russell King wrote:
> dtc uses an incorrect format specifier for printing a uint64_t value.
> uint64_t may be either 'unsigned long' or 'unsigned long long' depending
> on the host architecture.
>=20
> Fix this by using %llx and casting to unsigned long long, which ensures
> that we always have a wide enough variable to print 64 bits of hex.
>=20
>   HOSTCC  scripts/dtc/checks.o
> scripts/dtc/checks.c: In function 'check_simple_bus_reg':
> scripts/dtc/checks.c:876:2: warning: format '%zx' expects argument of typ=
e 'size_t', but argument 4 has type 'uint64_t' [-Wformat=3D]
>   snprintf(unit_addr, sizeof(unit_addr), "%zx", reg);
>   ^
> scripts/dtc/checks.c:876:2: warning: format '%zx' expects argument of typ=
e 'size_t', but argument 4 has type 'uint64_t' [-Wformat=3D]
>=20
> Fixes: 828d4cdd012c ("dtc: check.c fix compile error")
> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>

This (embarrassing) error is already fixed in upstream dtc.

> ---
>  scripts/dtc/checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> I've been carrying this patch for some time, but I guess hardly anyone
> builds DT based kernels on 32-bit x86 boxes anymore as it has remained
> unfixed.
>=20
> diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
> index 4b72b530c84f..62ea8f83d4a0 100644
> --- a/scripts/dtc/checks.c
> +++ b/scripts/dtc/checks.c
> @@ -873,7 +873,7 @@ static void check_simple_bus_reg(struct check *c, str=
uct dt_info *dti, struct no
>  	while (size--)
>  		reg =3D (reg << 32) | fdt32_to_cpu(*(cells++));
> =20
> -	snprintf(unit_addr, sizeof(unit_addr), "%zx", reg);
> +	snprintf(unit_addr, sizeof(unit_addr), "%llx", (unsigned long long)reg);
>  	if (!streq(unitname, unit_addr))
>  		FAIL(c, dti, "Node %s simple-bus unit address format error, expected \=
"%s\"",
>  		     node->fullpath, unit_addr);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+Hr//EUsa8//ouuB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll38JwACgkQbDjKyiDZ
s5LTVA/9GR8rfKnobUD7awxvz27KsH4J9kNccUpmZKkrki5Eo1V33yknCupLUhG3
RKrzuJ4d7A/NVTTCfZuH4MgeHdi3lv7kliHgY59qhE9Za1FCK2nT1o2kOuoay6+T
ymVBI8Ygy3fOCSgJftPQT4heo8oLr3R8302YAlcGnQT1KTX4z7N34ztP/W0+TLRA
DPnSyL1G1C5VQZZeNNgFUbAk6ig/vJrR7xhgF70PkJUoDgftC5CbbjrHcl1b1xmz
fFI/QVidCUgt7x5Z6Lu2ugJkJbUuulKCgxXMNfN1PItd3QYBH+/5gAAn6X8NFrE8
QUaqEbsiTQFwYUFGQTVbsMVMiwGt2HQK07Il+8zT4P8eU19+kFdZd5iLvCIvtrsM
p+7uDib7ASljnYHzo84PladrGZ113uEy0aTwwc59ZB5TXBFzH4kzjXZ7fT44s0dX
jtq4ujcYCcyUH7U+V6jMhbDv7UsdYSTGokmWRGNkTi8PYLrHFXfI5eN98MTV3XC1
uqkO/e0Dw8qHpgFbDTtdwfHVt6Le7F7/f9fPp9MvIkR3Vb4y7Ekjk5XUEfofFiN/
O7IkHoDwZXDZcHgMhWmC+IWhgdXBWVxHtl1M79bc3tILiYZ1mkACpb+C9EuT9Rpc
lBxO5o1nCpeEKyQgS5PSZ+bovTm5lQh5k0l1OxnW5q4kj1mfLc8=
=+sQG
-----END PGP SIGNATURE-----

--+Hr//EUsa8//ouuB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
