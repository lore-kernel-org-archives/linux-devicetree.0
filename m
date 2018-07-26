From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: activate spi flash on pine64 LTS
 board
Date: Thu, 26 Jul 2018 09:31:38 +0200
Message-ID: <20180726073138.fexu4nxaamqmrbzb@flea>
References: <Akash_Gajjar@mentor.com>
 <1532587906-5415-1-git-send-email-Akash_Gajjar@mentor.com>
 <20180726072924.bnvljmd2sf6bf5ae@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oeexq2bajwy2ctlp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180726072924.bnvljmd2sf6bf5ae@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: icenowy@aosc.xyz, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--oeexq2bajwy2ctlp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2018 at 09:29:24AM +0200, Maxime Ripard wrote:
> 1;5202;0c
> On Thu, Jul 26, 2018 at 12:21:46PM +0530, Akash Gajjar wrote:
> > This board has SPI flash. add spi flash support in device tree.
> > Tested on pine64 LTS.
> >=20
> > Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
>=20
> Queued for 4.20, thanks!

No, sorry, I ended up droping that patch.

You mention that the Pine64 LTS has an SPI flash, yet you change the
sopine baseboard dts. Why is that?

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--oeexq2bajwy2ctlp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltZeNkACgkQ0rTAlCFN
r3Ttig/+PcyaeKtRma4H+5ZJMY00IMKNcQxgzSGQdRxuDZyme44ganZjlgS8AYJl
QFV5oVvk4SeULzuW1Oo+Syrx8TIMS2sZhhWdcMB9S4/ODPT57vdsrw1wE1V3oxQI
16dSKqI58pByh3miYFlSXJtUUS21CnrSAuFcYgewzZ2j8uo3Z22RkIJEXfekUU6b
a+iFybgNtpKLJUi48D/QVbnAy1QTPdtRNldGSEiAmtWVjNLVin//l+CLlx73nJBv
NDaRYt4aaspD4qllA9mptK8JbQmDxQL+ObVoSm1S6XNy/HR112OQuoxW9jNh1iHn
qhmb0Ydqe50kPck9HMa1E8ipO35Fc8JZXn8ZgGm53pXP9/eKvCBG8vuOITFBdxN3
W7EWicAHYR3K55n29IGR5kBJA9/34Xn0IubeJwTu1IWzV6ZRP9FyzIq2l7u7EZP3
0lfGRAU4cMVtSWwoqYUSai+It+i63UYD6eKXyYoPudpa/8e/aFjoIvY1fYxehjOl
rVIrmJX0z9FJEHy5Ls2fFFTNUOJl2lcMDUGTflan2PDoPwSpA8aaGr1SKiQF5leG
3QkGyGE7c0iPCVeFKghsvwiUsy+6oidNLhfEvnKVlbkEnUZUFTofBjXEXZAUGspw
knLQopE6tZYFjuboD2PR5PEASIxTMjw2+limvIrNxNe1k31mgHY=
=asom
-----END PGP SIGNATURE-----

--oeexq2bajwy2ctlp--
