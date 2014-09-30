From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/1] video/atmel_lcdfb: Introduce regulator support
Date: Tue, 30 Sep 2014 14:45:11 +0300
Message-ID: <542A97C7.6010506@ti.com>
References: <1405427605-5288-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="9bW0oKS4t3Iw6uP12DBx3Qoglqb5Rkwt2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405427605-5288-1-git-send-email-alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--9bW0oKS4t3Iw6uP12DBx3Qoglqb5Rkwt2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 15/07/14 15:33, Alexander Stein wrote:
> This adds regulator support to enable/disable the LCD voltage, using
> 'lcd-supply' as regulator name.
>=20
> Signed-off-by: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
> ---
>  .../devicetree/bindings/video/atmel,lcdc.txt         |  3 +++
>  drivers/video/fbdev/atmel_lcdfb.c                    | 20 ++++++++++++=
++++++++
>  2 files changed, 23 insertions(+)

Thanks, queued for 3.18.

 Tomi



--9bW0oKS4t3Iw6uP12DBx3Qoglqb5Rkwt2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUKpfHAAoJEPo9qoy8lh71yRAQALImWgfmXyQ1BMCMMLyPf+bk
vkeozPHNr0Y4gCmp8gXfsTnLIo4Piq7iqHyAvllNREnTlgcGnWQi3ssiX/4Ghz/q
JtTWELsN/7PrRNPULgGn9Hdk7mdMECpuzv4I4kBD5hEvOWUy7SrlSgEA197emACB
N9S+Y6DfnVCql2umGOiGFZDvcnvRFHWkNaKOs4c8hLz2M+DaxsF5MMF6d7aw59Ut
EvhZZ13gKmwZTAtec4KtcYADv0YENyg8bqtBTdiv3Sscq9QVO0Ou4e8cb26AvCvq
oO+nmYodGtrVb6D/qLYZrzzoQnSyqLZarGnbZTbVjL22g8bEHlXSaqF2+fBNS6sg
iZDXmtGP/uwsSWy0cNpw4eCeMm5gomE0KVl+ej9p3pdqLZcdYLDpuKXRkAuG/lBr
dy8envSmPIQj8iU0g2+1S0JtWnKq5FQmrZrxR4gsCb9qpcA6soFtY/L99iUI05ZF
J1bVJ6/3kVvnlpMYY7Hb6YSV/fsebTqfEZXC9VOdTbv59ARIEbQIeYVFS32liPfj
KwwQGiNUS05UbkNnfRBdg1kgAMXgbc6nvgZ/SWUnIwqqNV4hh6GZxrXitQsTSWGl
e41+VYvEIhihaCb1K3eyyKf+5WXaYNSFWB2LSmwGs/1VO9+qnWvA2RrEgzKW/FQb
2AkxM9FCm432okixQrhx
=0x08
-----END PGP SIGNATURE-----

--9bW0oKS4t3Iw6uP12DBx3Qoglqb5Rkwt2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
