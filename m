From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: Adding a Basic DT for the Linksys ea6500 v2 wireless home router
Date: Sun, 7 Oct 2018 23:08:04 +0200
Message-ID: <86f391e5-9e38-c8b0-4753-4646c322c9bc@hauke-m.de>
References: <CACE8ZKbUhFyWg5oK1B8+aWAa0tdqKf5Kokj80+8x1X2EUaA_DQ@mail.gmail.com>
 <CACE8ZKZEpQjOW6CSvUuM9xhjtkSCF0bYxcfQ3htSabC=rVJcTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0EczQgxLtlvvHPgSNhqp0LOdiOlXjhanX"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACE8ZKZEpQjOW6CSvUuM9xhjtkSCF0bYxcfQ3htSabC=rVJcTA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Ren=c3=a9_Kjellerup?= <rk.katana.steel@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "Cc: Rob Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0EczQgxLtlvvHPgSNhqp0LOdiOlXjhanX
Content-Type: multipart/mixed; boundary="qfsNf4ClrbgmG0aCCye3TUXkBif4a2EL8";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: =?UTF-8?Q?Ren=c3=a9_Kjellerup?= <rk.katana.steel@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "Cc: Rob Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <86f391e5-9e38-c8b0-4753-4646c322c9bc@hauke-m.de>
Subject: Re: Adding a Basic DT for the Linksys ea6500 v2 wireless home router
References: <CACE8ZKbUhFyWg5oK1B8+aWAa0tdqKf5Kokj80+8x1X2EUaA_DQ@mail.gmail.com>
 <CACE8ZKZEpQjOW6CSvUuM9xhjtkSCF0bYxcfQ3htSabC=rVJcTA@mail.gmail.com>
In-Reply-To: <CACE8ZKZEpQjOW6CSvUuM9xhjtkSCF0bYxcfQ3htSabC=rVJcTA@mail.gmail.com>

--qfsNf4ClrbgmG0aCCye3TUXkBif4a2EL8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/04/2018 11:08 PM, Ren=C3=A9 Kjellerup wrote:
> Hi Hauke,
>=20
> thank you for suggesting adding the dts patch to mainline kernel,
> so here it is.
> I feel Rafal technically still have the copyrights, this is pretty
> much just a few string updates for the ea6500v2. However with this
> dts in latest OpenWrt 18.06 loads and installs on my device.
>=20
> I will be available to do more testing should it be required.
>=20
> Regrads
> Rene Kjellerup
> --
> -- as life grows older, I gain experience.
> -- http://www.alchemiestick.net/
>=20

Hi Rene,

Please send you patch inline in the mail and not as an attachment, I
would suggest to use "git send-email" for sending the patch.

Adding Rafal as copyright owner is ok, like you did it now. You could
mention in the file header on which dts file this is based.

Hauke


--qfsNf4ClrbgmG0aCCye3TUXkBif4a2EL8--

--0EczQgxLtlvvHPgSNhqp0LOdiOlXjhanX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAlu6dbQACgkQ8bdnhZyy
68eh+ggAyTJeOFkBTY9ZeBOSbxb3nkvlwfurQbInZF60fhaXTuvVQin0ttqlunGH
R0s+0+aA+x6wuGCmUaut7VZsDbxPOpCIcrBpjDJbjs0hQuE2M0Y67xF5O61pnpNZ
vfba/PsG9tsjkY3QpEz5+DMN/Lau+T+3kZCwpeKG0/WIkwZzWnndxqBgZqfBPGuJ
dTQXumfEj+xap+Y37e6vOBMbiDoOf7a3i5UEWzFnfrFTDm1qTfmnKrL+TCwLOjVt
gkTsi7PefgUSBpKPQbh6P1k1txSvVTIcgqJmy3rIi9NqaubpW562n7HYO0l3MNLx
PH4NIAAFqvqF7nz85W8erYyYbkLqxQ==
=Ltis
-----END PGP SIGNATURE-----

--0EczQgxLtlvvHPgSNhqp0LOdiOlXjhanX--
