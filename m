From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH V4 2/7] clk: bcm2835: clamp clock divider to highest integer only
Date: Mon, 01 Feb 2016 15:19:57 -0800
Message-ID: <87k2mo3tnm.fsf@eliezer.anholt.net>
References: <1452867667-2447-1-git-send-email-kernel@martin.sperl.org> <1452867667-2447-3-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1452867667-2447-3-git-send-email-kernel@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Remi Pommarel <repk@triplefau.lt>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> The clock divider calculation right now clamps the
> divider to the highest possible fractional divider.
> So typically (BIT(div_int_bits) - 1) + 4095 / 4096.
>
> As the fractional clock divider is alterating between
> (Fosc / div_int) and (Fosc / (div_int + 1))
> the divider will overflow for the (div_int + 1) case.
> As with the "underflow" case we have seen for (div < 2),
> we can assume that the same applies on the upper limit
> as well.
>
> So this patch will instead clamp to the divider to the
> max of (BIT(div_int_bits) - 1)

Looks like this restriction might be necessary, though it's not quite
spelled out in the docs.

This also needs to be conditional on it being a MASH clock, and the
limit on the divider changes in the same way based on the mash number as
for the minimum.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWr+gdAAoJELXWKTbR/J7okrEP/27LzAcVY/7Z8mLTgHV1EUWo
hFJJuh5S/5+cr0hfqEJzG6zmaSBDUqz9I+pkObuKWyQwmpJkMzOZpEeCzi2sXNE9
9rUbhcXhwJ/VFk3uWdxvUKKL1FYv0IynSPk91Ueo7sh+AXSj1qnVpHFprC6lKJtD
Rl/3qYk+L+cHxt0Ap37ZUwlG+v+5BE+abJ3NR3UWYtmJb3XMTZRhvfyR5Et0iX6J
IMAmIxWMptxGVE0VfQqtQXNDH8OysbO9G5HX09WYyC/jT5PI3tR+RkKxKlGIhATA
Pm7RyZpqSbEOzUWqLWxAUtVMwW6t61Bbx+eHdPcf6DiwmB0Iaa/hjVQvpYcjaqxx
ZqKk2jp6bbp7NN83/aJh5RIuJbwvIz4jbQlaZGKjzXGXxf7L6oTUcGnHZ9GUH308
xn65k1lvFZ8NeGQKWaMvqK9T02A1xduvSPcNHhaQxqp2ruajVBc+kEtIieXBmPyc
8+oQz15XbLotWHbT46+z9gmvuXoxHrPT4/Y1pvSkIciaDMhu0m870Cueussh/FVJ
KGLz4McO/vaqV+D1cZXO/Oe5ce94c6EBrcWmdVOAVQHhvSokqaMkX7/A/It713NZ
BNCnGsYxEgphc35+w8DzhChFvv7+RXTGflAKhjapvBT8uyxkQ3M+0U6NVQV3Ndql
UO2DQtsu1nZM7JZGoDnV
=NqSn
-----END PGP SIGNATURE-----
--=-=-=--
