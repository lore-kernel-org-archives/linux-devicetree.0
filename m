From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH V4 1/7] clk: bcm2835: the minimum clock divider is 2
Date: Mon, 01 Feb 2016 17:52:56 -0800
Message-ID: <87egcv5153.fsf@eliezer.anholt.net>
References: <1452867667-2447-1-git-send-email-kernel@martin.sperl.org> <1452867667-2447-2-git-send-email-kernel@martin.sperl.org> <87oac03tuz.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <87oac03tuz.fsf@eliezer.anholt.net>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Remi Pommarel <repk@triplefau.lt>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Eric Anholt <eric@anholt.net> writes:

> kernel@martin.sperl.org writes:
>
>> From: Martin Sperl <kernel@martin.sperl.org>
>>
>> Testing with different clock divider values has shown
>> that (at least for the PCM clock) the clock divider
>> has to be at least 2, otherwise the clock will not
>> output a signal.
>
> For a MASH clock (PWM, PCM, SLIMBUS, but not the others), the minimum
> integer component of the divider is:
>
> mash 0: 1
> mash 1: 2
> mash 2: 3
> mash 3: 5

More specific MASH list:

GP0
GP1
(*not* gp2)
PCM
PWM
SLIM

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWsAv5AAoJELXWKTbR/J7oAssP/iu+jhkHebDtLFUQqBpO6kQH
i6WP8noJIjiTVeUTPzNq0bOaESDr3qU5IKSSH0mhGNQlC6rrYfZpvmFDXZlISWzC
tKn0RzwTQiaGguW+SvRqgrkoTaMNWBUwgloOuzW3ufPNmjz4q3Zia1SdzEtrOw56
d27rTkfcQICCr9SPBeqmNQKnpG8Vr4Y6bgexxVwXdLw2Vu4OIYIFbbnAHAOHEE4Q
AVH/IoO9WXh2pfOacJZw7fwSw2c7YzckQwgpWkf/DsOtFh3IU3eXQ5QtJvkfxwgO
XhqbrZhPj6ZUVDcimugi9GXLdzhQEUgANVv6ZizZp49+bYAnPXj/Br9Siq7dKGBr
Pc4leYEvHdkQgQ+9z9vjmIePdibTODjGPHvRN4l6Un+P5yHzCPGE7E3rQdnMMLla
BkCrpahnTxICH5w4z1cjrgxD33sy7Vev4dw5oKJrWtd+416GHhLUchas1fhbIIyc
+mr423eVaUGPgEUDXnXGKtn25b3NFgcr68liTI9O03JOmPrdUYfgfNlxqN+heiYd
42IMWYYJyn/0uvfshajouz016iRjnHL66qsvsnKeDX0YLW1IDIgxQQ7oBv2ZRXLJ
xDIwe45xh6TrS4KTxvnLFl1DXbDt++HvLn0Cp0uXWDm0q1xLhnXXIJ4B8v+NpVbp
129kSno9B77QnwZpcCM0
=OHg8
-----END PGP SIGNATURE-----
--=-=-=--
