From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun6i: ippo-q8h-v5: Fix serial0 alias
Date: Tue, 6 Jan 2015 10:54:10 +0100
Message-ID: <20150106095410.GG7853@lukather>
References: <1419510319-32400-1-git-send-email-hdegoede@redhat.com>
 <1419510319-32400-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O8XZ+2Hy8Kj8wLPZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1419510319-32400-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--O8XZ+2Hy8Kj8wLPZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 25, 2014 at 01:25:19PM +0100, Hans de Goede wrote:
> The Ippo q8h has its serial console connected to the r-uart. Adjust the
> serial0 alias to match.
>=20
> This fixes the kernel serial console no longer working since 3.19-rc1, be=
cause
> 8250_dw.c now honors dt aliases, causing the serial console to be ttyS5 r=
ather
> then being ttyS0, as it was in 3.18 and before.
>=20
> Note that adjusting bootargs instead is not an acceptable fix, because
> console=3DttyS0,115200 is used by a lot of bootscripts, etc. and this sho=
uld
> continue to work.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--O8XZ+2Hy8Kj8wLPZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUq7DCAAoJEBx+YmzsjxAg6ccP/1M1uRphwRZHWtwo/0U+4Z0L
BCDBMJ6xSuDqCbzhB8611llX5vIrcHa6g7m5T7+O7ahkIuzHqaWgFZnI59InGkNO
nk319f8IJm2QyvKx8sZHhndgUdekyPJZZq4cvdVHac1ceY7CfsxdVd5ESPlNHgpu
8+zbHsGWheSlZ+PpMJIR2/WrIo5gOs+C2a6DcDyd5m0X0ztbeBQQ9LX01RY5RJMl
2kQB/0/vSLOJcfjnSdh5xd2vuuLik5gGP8jD1T/4Bh0CJVIm/T9hP3KNBmTsboh+
4gE9+TC5/gI3ftJMvVsASxmdflJETxSgeDNaEN4wm8MnsqbxfVLm5fkATAz7jXV4
1fmHoD1ybB/pmqs0wyZM5vWGUCxTsjzLXRdI54/67R3wv6JCM4+DNx5w3ekaGXq3
ZEstZLAlGFPeS5YthsCmxIw0t8yNAoiCcEMOv9Fp3tWFLRqgXY1Y2yolW7qZacRP
diSPbANVUHknLNEaHBU/C0XkhJ1Btm9n2OB40wjygJ84S9gtl09kEfP9d5AKPNs0
jN/QuGulIYiLJO4Y7L1KXZF+cxICEJ5kgdPzf9wGTvz72tqNsuat8KYP/8VBh6/k
+tAOLOzBzb6NOepmzMsZJsRe0/fwbt9MT5ANDdFe+QCKPV6OJDcdgk7e4jYPtcf3
wEJudgN24QJw4iXh5ndN
=NC+5
-----END PGP SIGNATURE-----

--O8XZ+2Hy8Kj8wLPZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
