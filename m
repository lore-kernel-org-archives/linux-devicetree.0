From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ARM: at91: spi: request all csgpio in spi probe
Date: Tue, 29 Jul 2014 12:32:36 +0100
Message-ID: <20140729113236.GM17528@sirena.org.uk>
References: <b033d16ec31d26a895726ee72ec89b43943dfbae.1406547656.git.jiri.prchal@aksignal.cz>
 <20140728122103.GR9532@piout.net>
 <53D64ADA.1000102@aksignal.cz>
 <20140728223859.GA3214@piout.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nOkP3B9e3ta8qQbV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140728223859.GA3214@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nicolas.ferre@atmel.com, voice.shen@atmel.com
List-Id: devicetree@vger.kernel.org


--nOkP3B9e3ta8qQbV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 12:38:59AM +0200, Alexandre Belloni wrote:

> Mark: maybe it would make sense to do devm_gpio_request_one() in
> of_spi_register_master(), after of_get_named_gpio.

You need to transition all the drivers doing things manually but yes.
As I keep saying all the GPIO handling needs to be completely
refactored.

> While this solves the particular issue Ji=C5=99=C3=AD is seeing, this wil=
l not
> solve the case where PA14 (CS0) is not used by the spi driver at all. It
> will remained muxed as CS0 and toggle when the spi master needs to
> access CS0 until another driver muxes it to something else. I still
> believe we should explicitly ask pinctrl to mux them as gpios.

I'm just guessing as to what the issue that he's seeing is but isn't
this just saying that the board pinmuxing is wrong?  If the board
doesn't want the pin to be used by the SPI controller it shouldn't be=20
configuring it that way.

--nOkP3B9e3ta8qQbV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT14ZRAAoJELSic+t+oim9sM0P/jmBwEu0CH2FaGSh+517g5R4
KbrixTeEPmC1TlcJ6AKCtCzEW7v6amUpiBOm/8h2w7vcQEVNt4kVAzPwvQDXqmdr
IJ36hXXB9VGt1k51u0fW8wBvkl8xu/VzuS3pyuNZTvzjHr6BqJlAve8en4FH4Dk9
qJubrRG/C9HZLUbrD7TvIVtQ8Am01Ip+1LnLVtVGKLdh8Dqy/q3vBR5zbTcJYxMj
FBa4mugfAgkUg4SAf9DsxsG0Aj9SO3DZRBSArp2t9uXT6TxKhSbG6jmdZpXHZtF2
bZ7o70qIsuuJ6O5Rn22WoA7WgHmNxN/7uO3hRZg5Xj7zSTlc45ezvaq1tRq72+Xl
61xmHFZxkooB/d4wnlWM0/ukhx9yCCVnKFpG3031rbQ6b1kqVIHUAiEL/sIOd1/b
pHA+UXkn0CcpuE0xA2dNH10l3MbH92YU1ow9QgicIai795IZh8bPQGHAp/v3w/4n
0i0dd4LsKNu5G1inBqm5UIr1/KrBDeE0+78u0lHeRNkSRc+LhYZBoxNE4gm6CBMR
dQTkqbgLg6yo8SdQywA98uI+gM0NnXTj2rgMnJUbGaw/vKWK1nVef00XDQSsySmN
zKISdo2bbGMuLbKY9AOw4Q6DA0HmT1u9o9VzPVAFLaMD50jzEwDctJf+eP793wJ2
EL3kXOpSdZCzCWzES7k1
=lTuD
-----END PGP SIGNATURE-----

--nOkP3B9e3ta8qQbV--
