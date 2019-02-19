Return-Path: <SRS0=6lH8=Q2=the-dreams.de=wsa@kernel.org>
Date: Tue, 19 Feb 2019 21:23:48 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
Message-ID: <20190219202348.qhpjv24rnhgupek7@katana>
References: <1550589042-11096-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550589042-11096-2-git-send-email-gareth.williams.jx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bdo75lbtwoend5ij"
Content-Disposition: inline
In-Reply-To: <1550589042-11096-2-git-send-email-gareth.williams.jx@renesas.com>
To: Gareth Williams <gareth.williams.jx@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--bdo75lbtwoend5ij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 03:10:41PM +0000, Gareth Williams wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
>=20
> The driver requires an undocumented clock property, so detail it.
> Add documentation for a separate, optional, bus clock.

Is it named "bus clock" in the datasheets? If so, then be it, but if
possible, I'd avoid this term because it is ambigious (Is it the I2C bus
or the interconnect bus or...?). pclk sounds more precise to me.


--bdo75lbtwoend5ij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxsZdAACgkQFA3kzBSg
KbZM8A/+JpJk7b3PKMeXAMlgep5zcDk8JIxGUSBf958/bSMGmk84vcKM/m5dDUJ0
60uhqksU0XCInt/dQmZN9HyQRVDel2ZM/z0rJn2Yq0IScrZW1Yvr9gjDrTSpQZLI
dxeHIe1Oc7es2IcUv+00JX0guGn18eksQKz1m+aZCWZqSLXnhfcWFaXJMt3ipUt1
LXbr+FhLf2uYwdgs5ih/kUAhq8+BCMMg+ux3XwMPjtDWu2o2xYqX5rpaTNmrOspp
WXd7d1x8lIMhAy20ATXy0XPEPEe2wcjxRoH6U8K7+hilXK6eIvodzEQdNkUBUePH
FVCBr3IOk2AUtUgm2ilme9f4BmdmRbyMsH+aW2G+ZCLQFnq8qDZZQoNbwmzghhfM
VFEvZO6Pt1n+9fJjXiF7LejxsEtjy/gqNnmFP44yeolH12cRFmuDzp67me3fn2sv
nwqQTYg8yMQ9pMJr3QYWickbDtg/aYIhGOGRfEtX1TY/O31/klOSZg+fHei4ZG44
f3GfbtfvobTJnVR9uSgc5tAjkolat1znkEuaHrbM3TltNdMDFFcTmCNwxcDUnLPp
kSa7pZcM/K2rI20DmULl0Sp027kGWTnoy8eAvJzUo/12OaBEhLjl9tg/0I8u+dI5
AWq6uE7Zex9nnVBY+EwY32YP4Ec6bfWjHGvvN6djaBb8Z9bZpvo=
=79hq
-----END PGP SIGNATURE-----

--bdo75lbtwoend5ij--
