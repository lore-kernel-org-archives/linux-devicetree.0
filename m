From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH RESEND v6 0/6] provide power off support for iMX6 with
 external PMIC
Date: Mon, 9 Apr 2018 13:43:03 +0200
Message-ID: <c3883979-8658-96d2-e62f-396aa5be332d@pengutronix.de>
References: <20180305102524.5905-1-o.rempel@pengutronix.de>
 <20180409113744.GA14582@dragon> <20180409114022.GE11532@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="g2pCk8Uj56ePxjNGAzQrsZUJfDr8wByNL"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180409114022.GE11532@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g2pCk8Uj56ePxjNGAzQrsZUJfDr8wByNL
Content-Type: multipart/mixed; boundary="TvrTA2pS7JKYsMy9WzeD1NqvW6wOQ9FIE";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Russell King <linux@armlinux.org.uk>
Message-ID: <c3883979-8658-96d2-e62f-396aa5be332d@pengutronix.de>
Subject: Re: [PATCH RESEND v6 0/6] provide power off support for iMX6 with
 external PMIC
References: <20180305102524.5905-1-o.rempel@pengutronix.de>
 <20180409113744.GA14582@dragon> <20180409114022.GE11532@sirena.org.uk>
In-Reply-To: <20180409114022.GE11532@sirena.org.uk>

--TvrTA2pS7JKYsMy9WzeD1NqvW6wOQ9FIE
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09.04.2018 13:40, Mark Brown wrote:
> On Mon, Apr 09, 2018 at 07:37:45PM +0800, Shawn Guo wrote:
>> On Mon, Mar 05, 2018 at 11:25:17AM +0100, Oleksij Rempel wrote:
>=20
>>> As this patch set touches multiple subsystems I think it would make
>>> sense for Shawn Guo to take the all patch set.
>>> The only part which didn't receive an ACK is regulator stuff. So I wo=
uld
>>> hope that Mark Brown can ACK it.
>=20
>> Besides regulator changes, I did not see an ACK on kernel/reboot.c
>> either.
>=20
> Right, that's the big blocker here.
>=20

Ok, Who should ACK it?


--TvrTA2pS7JKYsMy9WzeD1NqvW6wOQ9FIE--

--g2pCk8Uj56ePxjNGAzQrsZUJfDr8wByNL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlrLUccACgkQdQOiSHVI
77TVsgf/aAmByLZtRwbKkAWW7yBOKHJxklPPJ7/V6ZHppEhiX2Imv+F91ikGcpwX
ubux4WNizQ3gFZtU40RCOC4twLnty3lh2w1DUR9+H+79EwZGTo4NcQdYtrx1NYW8
yvGFx3bZtMvVwk/ABGgzj5Uix39nrtY1+G9Tar+VDjT1xMrTRNggj/UVGVo90a55
IqUf+U4h3UCrUD0bOL4768yuOSK2CukOUL02Xh+JVLFoMIkcfMdYk7pb6jMt6uen
GcphITM8GkhHxLYbV9tQ3tnVuYH5w0s1HsL9Lt+NhrTJruw77vwxfw4Vkb2YDDgh
CEjde5aDNPqUnZs49NgYKZcEGYWP/Q==
=M5YS
-----END PGP SIGNATURE-----

--g2pCk8Uj56ePxjNGAzQrsZUJfDr8wByNL--
