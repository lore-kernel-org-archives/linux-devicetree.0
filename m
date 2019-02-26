Return-Path: <SRS0=eAy/=RB=the-dreams.de=wsa@kernel.org>
Date: Tue, 26 Feb 2019 16:39:21 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
Message-ID: <20190226153921.GC839@kunai>
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
 <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline
In-Reply-To: <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Gareth Williams <gareth.williams.jx@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Luis Oliveira <Luis.Oliveira@synopsys.com>
List-ID: <devicetree@vger.kernel.org>


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > + - clock-names : Contains the names of the clocks:
> > +    "ic_clk", for the core clock used to generate the external I2C clo=
ck.
> > +    "pclk", the peripheral clock, required for register accesses.
> > +
>=20
> Actually it looks there is need to revert back to bus clock (or better) in
> comments but keep the "pclk" property.
>=20
> The specification I have tells the ic_clk is the peripheral clock which r=
uns
> the logic and the pclk (exactly pclk) is for bus interface and where
> registers are.

Can we make it "bus interface clock" then? I'd think this is a tad
better.


--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlx1XaUACgkQFA3kzBSg
KbbIQRAAnTk3dnyBP4T/I2tBw+MfOtLMupey696eq0DUhYzQP+2rrOvYndO8x2QU
AMJwIgeicC0554BJ7ZIEUPlNBp3IBRtUzFG5yqnP6UQ8rozr7nlUmJrilXASdRU2
QDwwWSGYfDBpJTY2EqOOwTEoDp4SR0bB4ihPt4D9AnD8Rmh2SyEm5Xs2S6b+O+qW
K20U/Tv/OedEfF20vNMQXCrDTBmQ9mhbHc0RBukmfeANJthfNlkKFUui3DAx3sXI
y8VP9sAYmlDVJN4zeCzg0t+d0n88e+/Uo6S1EMzYamifQx0vaUhVTizJnq5b4kJx
FRIvL0KEQTaT16hliF8zED5mIOPMP5lJS5qVklKggeHTBFB+e4aNIJZtTNeEY8Nt
VAtzIZkDAJuooYXGIGmb3M1SNoXs8WmeRMiczA7BjLWoblitTqfxrODHIZxbrZ5M
knp1jiJ3Sx6lknciGk3kj7MrWXOXHf1cY+yWjf7tn+I+9RLR5hlZlgwL0lm7EgFX
gAqaWOTSadR76iZaNfB35wbxGeUy41DhB/HR/uHijoyD9fPuifqNGKCS7BC66tnA
amOxWZNe9ENwcKqW+qjF9dgFH72mNKIHHvgSRc3avWxDuW+NY0RrUybV+L9/pMZL
V00IXOC3LPYK/X/MtbbIb+80c6P7GTAzaoCmJV+TYTvvcVTrFy0=
=W7Px
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
