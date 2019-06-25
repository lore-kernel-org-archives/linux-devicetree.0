From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/2] dt-bindings: power: supply: Add documentation for
 the VINDPM properties
Date: Wed, 26 Jun 2019 00:13:08 +0200
Message-ID: <20190625221308.youac2n3wr7ojvyk@earth.universe>
References: <20190520180712.32405-1-angus@akkea.ca>
 <20190520180712.32405-3-angus@akkea.ca>
 <20190613230906.GA10492@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ugu4qrkfrveoirjb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613230906.GA10492@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "Angus Ainslie (Purism)" <angus@akkea.ca>, angus.ainslie@puri.sm, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ugu4qrkfrveoirjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 13, 2019 at 05:09:06PM -0600, Rob Herring wrote:
> On Mon, May 20, 2019 at 11:07:12AM -0700, Angus Ainslie (Purism) wrote:
> > Add documentation on how to control VINDPM from the devicetree.
> >=20
> > Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> > ---
> >  .../devicetree/bindings/power/supply/bq25890.txt          | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/power/supply/bq25890.txt=
 b/Documentation/devicetree/bindings/power/supply/bq25890.txt
> > index dc0568933359..fe8b709dd666 100644
> > --- a/Documentation/devicetree/bindings/power/supply/bq25890.txt
> > +++ b/Documentation/devicetree/bindings/power/supply/bq25890.txt
> > @@ -26,9 +26,15 @@ Optional properties:
> >  - ti,use-ilim-pin: boolean, if present the ILIM resistor will be used =
and the
> >      input current will be the lower between the resistor setting and t=
he IINLIM
> >      register setting;
> > +- ti,use-vinmin-threshold: boolean, if present the FORCE_VINDPM bit wi=
ll be set
> > +    and the input voltage limit will be configured based on "ti,vinmin=
-threshold"
>=20
> Isn't presence of ti,vinmin-threshold enough to determine whether to set=
=20
> FORCE_VINDPM or not? Just get rid of the default being 4.4V.
>
> >  - ti,thermal-regulation-threshold: integer, temperature above which th=
e charge
> >      current is lowered, to avoid overheating (in degrees Celsius). If =
omitted,
> >      the default setting will be used (120 degrees);
> > +- ti,vinmin-threshold: integer, lower absolute threshold for VINDPM. I=
f the
> > +    voltage falls below this threshold the charge current is reduced u=
ntil the
> > +    input voltage rises above the input voltage limit. If omitted, the=
 default
> > +    setting will be used (4.4V);

We already have a "input-voltage-min-microvolt" property used by
Maxim chargers, please resuse that for the bq25890 instead of
creating a new property name.

-- Sebastian

> > =20
> >  Example:
> > =20
> > @@ -46,4 +52,6 @@ bq25890 {
> > =20
> >          ti,use-ilim-pin;
> >          ti,thermal-regulation-threshold =3D <120>;
> > +        ti,use-vinmin-threshold;
> > +        ti,vinmin-threshold =3D <3900000>;
> >  };
> > --=20
> > 2.17.1
> >=20

--ugu4qrkfrveoirjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0SnG0ACgkQ2O7X88g7
+pqDwhAAiOvtNtH70ZGzXyF9hiF1W3q9vQnI/q7O7DvRkYaPpRTAGMkAQf/83U1F
/RUm0zLghA48EfALEVqti+zMEg4FLpHW8TgaiblKHWKHF5mUbLoUO1sNi55VzEXu
8rYeRIhHqjCQPta4cFW/reZoJ6QUtqnpUgT90xNjy5l26VLp0INpEzWi9luzn+Sg
d7vW1T+hMcUJcCA26nobt/1pSK8vjGCKnxrAkNo2dsk6KU0zwtAJf25OSE7nJHkQ
MXAMI7S9QK7F2C9DXsZ/AcPng6lTTccx86cZcvh5S0Pss5gKItQdLQcDqTYiF6B3
8Zaj84rLyYuujPnVcDXMjhtnufE5PNMsebM7Ia3EFb0Zfuai1zv8gXicjdNxpZV8
37zIVuJ5zPkd6wMJOPkOsACNF/lN4UJtBxxG94Bo1ACHLDVyDInb6drN0IEvBIlm
KMU3bQT4tfTUBLIruAEdUR7AoJH4nWbPTuBUj0F0aQ554txdBMjJAHKm+TtQivMG
Ha99S4c6wDFiDs/8wdX1reJOjB8G5AAwZXKywcVDDhfM1GolxtLgYWWWH8fdO0G1
ECfdzda5L+EdAUFRFNoqQ8BjtAQzY2rMHLVGOMoRVObwyVPYAXhUO8dDuAp38Yqc
+DOcJo0/CzuxmGymnTjiCKOBb0O4WMPIAznhprDjW1XlpPjzxN8=
=/rvN
-----END PGP SIGNATURE-----

--ugu4qrkfrveoirjb--
