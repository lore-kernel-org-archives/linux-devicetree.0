From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Update SERDES_MAX to be SERDES_MAX
 + 1
Date: Tue, 9 Oct 2018 09:27:23 +0200
Message-ID: <20181009072723.mshyvplpo2xmkyfl@qschulz>
References: <cover.1539036280.git.gustavo@embeddedor.com>
 <3a1a95a4832af33dcd1842b0298d257bbcf1f5ab.1539036280.git.gustavo@embeddedor.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="62cxvakkd2ytn7p2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3a1a95a4832af33dcd1842b0298d257bbcf1f5ab.1539036280.git.gustavo@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--62cxvakkd2ytn7p2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

On Tue, Oct 09, 2018 at 12:21:36AM +0200, Gustavo A. R. Silva wrote:
> SERDES_MAX is a valid value to index ctrl->phys in
> drivers/phy/mscc/phy-ocelot-serdes.c. But, currently,
> there is an out-of-bounds bug in the mentioned driver
> when reading from ctrl->phys, because the size of
> array ctrl->phys is SERDES_MAX.
>=20
> Partially fix this by updating SERDES_MAX to be SERDES6G_MAX + 1.
>=20
> Notice that this is the first part of the solution to
> the out-of-bounds bug mentioned above. Although this
> change is not dependent on any other one.
>=20

Reviewed-by: Quentin Schulz <quentin.schulz@bootlin.com>

Thanks,
Quentin

--62cxvakkd2ytn7p2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlu8WFsACgkQhLiadT7g
8aMl8BAAqrbt9R184yxGBaEGyA21uKcsKGZI3fq+kcmvkH229Y6dKUWuqK7xNo++
qRAN//jr9Vl5mcwXKPeeN9DhheaIX+O+mAHSVZG+E7xx/gA6uxhTxV552l0sSC8Y
D+7XRT0kvv3YXXoJj3lf6PewOKrW8PUOzQNprGbKAaDUZSfLglb6haC3/IwcNpUc
H2mju5ElUrzhfggDufAQd1TS7uTyoX0J5hkvC9pc1NIxcz+v7XZWBzZ6fUJPQV09
ASa5omZgaAPq2MV4/WTGKG6D2EO8Xa4FlWgsZ86PA1FOgwa0jpN+XIfkcarSF4ha
eNBKrV352Ib3MO7aRBy9wzu8iDFI5Tzu25CyTOPlac3xd1+3P/2VI26z033Rr1K5
s0fHT+R9ifRjh0MZ6Tx3tn2QY6gxEnA0AJaMiT+c1JJc0jQBwBvlCsloSUz1wVS5
5MO8lmmeEi1EljmnHTK5FY0Kr8kka180F1LEDMJAFfi4IBZhDAci9jtb/fNbQpJj
5WdYMKsx13LFGkRVNfkjg7V5n/s/fG0M7UAk05WW/0LT7lQWhNyCBYRkt48a1q04
zANiha7l8g/VALC/ueRBsCf1BpVR/cb0JD3F74avClwKrZm5zyvEYaqmqNpFS/K8
QOHCccKaTM1CiJbXtpTlB5T2464ooXKr3qEKIlnU8qlurcQNkMA=
=JOiR
-----END PGP SIGNATURE-----

--62cxvakkd2ytn7p2--
