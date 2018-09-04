From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: Re: [PATCH net-next v2 1/7] net: phy: mscc: factorize code for LEDs
 mode
Date: Tue, 4 Sep 2018 19:56:26 +0200
Message-ID: <20180904175626.4xagnrkjtmtovxsr@qschulz>
References: <20180903084853.18092-1-quentin.schulz@bootlin.com>
 <20180904.104827.447303663667237271.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xvphf3rb6p6p2tuv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180904.104827.447303663667237271.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, allan.nielsen@microchip.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org


--xvphf3rb6p6p2tuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, Sep 04, 2018 at 10:48:27AM -0700, David Miller wrote:
> From: Quentin Schulz <quentin.schulz@bootlin.com>
> Date: Mon,  3 Sep 2018 10:48:47 +0200
>=20
> > LEDs modes are set the same way, except they are offset by 4 times the
> > index of the LED.
> >=20
> > Let's factorize all the code so that it's easier to add support for the
> > 4 LEDs of the VSC8584 PHY.
> >=20
> > Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
>=20
> Entire series applied to net-next.
>=20

Thanks!

> Please provide a proper "0/N ..." cover letter next time.
>=20

Sure, will do.

Quentin

--xvphf3rb6p6p2tuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAluOx0kACgkQhLiadT7g
8aOHFw//bLoKQWrointP4ck4O7wPLZHJZ3RO1Np6mhWiNgR+FjviVlmJEsOPSz7o
EjFNeXtQ9n2VgHWGErpln72ucO8aON5MM107XTuOrGN6wr6HORrHxSfhEoQ8kVJ1
1j/uPXVWvZHw7k200wWI1qisu9KZI934USBxWS17Ietayzn+TZPMm7cBibog0GuQ
GDfEZblvT1bhZS91sQKx+TMRsIfA1Wf51XphrP8uwzxwU5xFT5RNb+2o1FIp7ZwD
VC+dHdpeRV4RpWnH8wVR8FBmrulYCqU0tN90b2ap+K6lcQ8b0wZUY2aCvMezy8Bh
eBg5o/2B+NFL3Umc+Z+RM+X5b/QICVdx/RDFIKVIN0yKEFA0kr7sh7lNTDksBLS5
S6jVjHRPtvu59mrRzscsVtyPI8cMv/Twqu1IfwYvdLfWDk/3vBu8z9DYRwneQTwB
ig5aCaLVTJpkvQaG6+sYS2KXsGFd5arTa5CrgRi8xWV9MYIaD8h+x5sZhl6XX4eZ
I5msnimRJl4CoOLqxQzAh+LtueVWlszfm25IzQlZvwNuSMKrFSx/N+Nau9VH8qed
/8dy0eeq6SoFjgaPeHVrIeZwN9iUJbsGHwVIvkeCN1+qxETqwuvSybXNglSVrnDB
LHWu7iFZHkNe5u81oMG+SD/RjwimcLEVodZ1b82rwE7qLgqJitg=
=Pz88
-----END PGP SIGNATURE-----

--xvphf3rb6p6p2tuv--
