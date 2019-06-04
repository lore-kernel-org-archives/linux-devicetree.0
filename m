Return-Path: <SRS0=chGP=UD=gmail.com=thierry.reding@kernel.org>
Date: Tue, 4 Jun 2019 15:22:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 28/28] PCI: tegra: Change link retry log level to debug
Message-ID: <20190604132254.GU16519@ulmo>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
 <20190516055307.25737-29-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kSOhxpxUsM1s2qz/"
Content-Disposition: inline
In-Reply-To: <20190516055307.25737-29-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--kSOhxpxUsM1s2qz/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 11:23:07AM +0530, Manikanta Maddireddy wrote:
> Driver checks for link up three times before giving up, each retry attempt
> is printed as an error. Letting users know that PCIe link is down and in =
the
> process of being brought up again is for debug, not an error condition.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V4: No change
>=20
> V3: Changed dev_err to dev_dbg
>=20
> V2: Updated commit log
>=20
>  drivers/pci/controller/pci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--kSOhxpxUsM1s2qz/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2cK4ACgkQ3SOs138+
s6HOaQ//aYSYk26RIhZPjP4NCUdL8P7gXfov4RmSEnWQWJ21VBAHzfBdmcpKd9S/
JiEiYtnCpR9gHrKHOqR5TTbFaOcCZ4mgHfp58iXJvchMKvrxPSbaoN17TFl0nDy/
oMS3gCBsI9AMF9D+c1P/98jFydG1Wjr26fg+ROtG9+jZ93Cc9bdBp2IgHG5OLKvC
B5ZpOP0DVW1b98xovgUpWFOXnOke86owLa6oLVsoFhc+SnRuqzERycHcEBuRvFph
Q7d8UfWPhdS5JONqb1hs8qF3LFWSgFoHS4sgR7Lm+eoXl+pV33pNhsHF6Ab2LdBo
JTLbJCrmFkAWGy8DIk06GO25wdURUutKgDKCV1+hzLc+S4QHvtnaQta5R2LcPLul
/RoXgppX/8oKwWtVlNJtDRwyutA2tNEindB5WftJEnuPo1jvFCb2Wba7gEROuSxp
4tHWivdeRdgINTiSFE4jo4dkY6grXvwwcupZnTH9i4yu1UQs4cMF1qAIf1Smz5bX
3lkdp+ZLNQi7VLs86e6mAZIPJUz13WQPZPnamiiJucmCiXUbUWHW80qUb1Wn2oW+
qlPWd6k/pB3r36j5gVCyvdeJQAdSxIU0yd5oIifqYUG6WPrwyFUJC0Kk8L9oy4lf
66GaZEHYX+iH7IOlQ7e+ceANSlcCfGe1+M1EUr+4ijJ1amNHV+A=
=0bFR
-----END PGP SIGNATURE-----

--kSOhxpxUsM1s2qz/--
