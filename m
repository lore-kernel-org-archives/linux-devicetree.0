From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2 3/4] clk: bcm2835: Add support for programming the audio domain clocks.
Date: Mon, 28 Sep 2015 14:19:43 -0700
Message-ID: <87si5yutqo.fsf@eliezer.anholt.net>
References: <1441922305-2298-1-git-send-email-eric@anholt.net> <1441922305-2298-3-git-send-email-eric@anholt.net> <5600B663.8000501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5600B663.8000501@wwwdotorg.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 09/10/2015 02:58 PM, Eric Anholt wrote:
>> This adds support for enabling, disabling, and setting the rate of the
>> audio domain clocks.  It will be necessary for setting the pixel clock
>> for HDMI in the VC4 driver and let us write a cpufreq driver.  It will
>> also improve compatibility with user changes to the firmware's
>> config.txt, since our previous fixed clocks are unaware of it.
>>=20
>> The firmware also has support for configuring the clocks through the
>> mailbox channel, but the pixel clock setup by the firmware doesn't
>> work, and it's Raspberry Pi specific anyway.  The only conflicts we
>> should have with the firmware would be if we made firmware calls that
>> result in clock management (like opening firmware V3D or ISP access,
>> which we don't support in upstream), or on hardware over-thermal or
>> under-voltage (when the firmware would rewrite PLLB to take the ARM
>> out of overclock).  If that happens, our cached .recalc_rate() results
>> would be incorrect, but that's no worse than our current state where
>> we used fixed clocks.
>>=20
>> The existing fixed clocks in the code are left in place to provide
>> backwards compatibility with old device tree files.
>
>> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835=
.c

>> +static const struct bcm2835_pll_ana_bits bcm2835_ana_default =3D {
>> +	0,
>> +	0,
>> +	~((7 << 19) | (15 << 15)),
>> +	(2 << 19) | (8 << 15),
>> +	~(7 << 7),
>> +	(6 << 1),
>> +
>> +	14
>
> Nit: Elide the blank line? In some other structs too.
>
> Are there #defines or names you can use for those initializers?

I've just used named initializers instad.  (These *are* the defines, so
another indirection wouldn't help anyone reading the driver).

>> +	clks[BCM2835_PLLA] =3D bcm2835_register_pll(cprman, &bcm2835_plla_data=
);
>> +	clks[BCM2835_PLLB] =3D bcm2835_register_pll(cprman, &bcm2835_pllb_data=
);
>
> These can fail; shouldn't there be error-checking? Or, does
> of_clk_add_provider() check for this?

When you get the clk from the of provider, the error gets passed
through, like it should.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWCa7wAAoJELXWKTbR/J7o1BIP/05NesNw767zkmH3kW/KzDXE
JwQnnc0QSQCsqibY1UgxvYJ4MRiA/+pkiMoCjg9oay+8fp8nJR475WgqDhv51wrR
V97op+1n6Fhi+Oo4K07adNBSUKJy+evM1h7Lxmv7ksQncIHxfkc0OA4r22xea8T1
cNKaYVmzbJPrwupFigt0OgNE1Raj4EkEoYFqfKoGEjfUBaOr4GrTT1Yl9at0rECJ
hflWa5GPNW7U9FAoTTVAgP/ZSQdxquPP1WABbIgdx8ayzCTGvkwO6nV3DtDRyh4p
iV/IKgmdfJkEKBaBHxhXejnIhTfkXHmpmfq4j2V12n/QrIOW8Eine/5KEDyXJ1I5
mMonfQDiOJuRlIWhde8XtQdNrfrniV3oXKrTprpTRYcDQJC2sVCojPRaTnr5Jq2W
1d3BbcESRRW6tJNFHhQFWXtsgiOLxuxquizaUAYOpj38z06KMasVqmYdo+DBWqXS
L6WR8T0zRKwyk063/jOLivR4ok7dB0PZ5VIkU+o1N7hpLzAgVLDoJawlIMS/quvM
zXF/fHJMbAx7iJ4AGmtUyj9KpwABxe7Rxk5BM7fiLKm0A+BLV4TuxWtP/VrX1trs
6/+3ojSD6CUNZR2LJrjPH5PTg5cqEK5T3z7BJFCef9eOQj+ix4RTaWr2auTCweyc
UPqz973/BB1Hyd+GpOR8
=xin0
-----END PGP SIGNATURE-----
--=-=-=--
