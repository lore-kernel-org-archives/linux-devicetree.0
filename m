From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
Date: Mon, 20 May 2019 16:42:58 +0200
Message-ID: <20190520144258.eauhvvwfxuhiczie@flea>
References: <20190518152355.11134-1-peron.clem@gmail.com>
 <20190518152355.11134-2-peron.clem@gmail.com>
 <20190520073529.nxptfbibexrqyzfi@flea>
 <CAJiuCcdrW7RcEKePCr1DaL-be8dA5oOjvHdxYkiu=h37z2e7tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vpv227evtpkmkqyk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJiuCcdrW7RcEKePCr1DaL-be8dA5oOjvHdxYkiu=h37z2e7tw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--vpv227evtpkmkqyk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 10:14:10AM +0200, Cl=E9ment P=E9ron wrote:
> >
> > > +     - "allwinner,sun4i-a10-wdt"
> > > +     - "allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
> > > +     - "allwinner,sun50i-h6-wdt","allwinner,sun50i-a64-wdt",
> > > +       "allwinner,sun6i-a31-wdt"
> >
> > Is there a reason to keep the A64 compatible?
>
> Yes, A64 and H6 has the exact same memory mapping looking at the datashee=
t.
> So if there is an errata or a new feature for the A64, it should be
> also compatible with the H6.
> Which is not the case with A31 (WDT_KEY_FIELD is not preset)

The thing is, if you use those three compatibles, then you're saying
that it's ok for the OS to use first the H6 driver, then the A64
driver, and then the A31 driver.

If the A31 isn't compatible, then it shouldn't be listed there. And if
it is, then you can skip the A64 compatible.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vpv227evtpkmkqyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOK88gAKCRDj7w1vZxhR
xQlAAPsE6kzsQQMSHryqgwmd6OWp/s6AtN+TcU7ip7ukhfmmlgEA24/Tc3t6XRAH
2cNOcp+yz6bb7jinJ2k9sXjsqBcyywo=
=7TNO
-----END PGP SIGNATURE-----

--vpv227evtpkmkqyk--
