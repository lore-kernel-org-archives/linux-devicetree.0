From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4 1/7] pinctrl: bcm2835: add pull defines to dt bindings
Date: Mon, 19 Sep 2016 11:07:17 +0100
Message-ID: <87zin49p9m.fsf@eliezer.anholt.net>
References: <1474274603-24215-1-git-send-email-kraxel@redhat.com> <1474274603-24215-2-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1474274603-24215-2-git-send-email-kraxel@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: swarren@wwwdotorg.org, bcm-kernel-feedback-list@broadcom.com, Gerd Hoffmann <kraxel@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Gerd Hoffmann <kraxel@redhat.com> writes:

> Also delete (unused) private enum from driver.
> The pull defines can be used instead if needed.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Eric Anholt <eric@anholt.net>

gpio maintainers, could I pull this through my dt tree?  Or does this
need to be split in two?


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJX37jWAAoJELXWKTbR/J7oMFoP/RRjqf5C3FaEUez87TjcJhdy
HBtSa9Or6AyhBVqNnecg0n7sj/TCFlPIO501c9CyfGBZMfuNKL5NFB0L/8L+EW5/
jjwZEY7QmSUdnuyaayV50PTRwMamaIRICpGnLWg5mMO8y8K5QLOlxN/0uu4dtd93
hxtdInYag6OnLpngBnTqcyutjEf1QvHrsAWYNlql5rUk0QgWqpHiI175MszK1k5N
j1HdG5l3tmng2VFsghKmUeJ6RgvD9tDPWUkdZN9okcHhJp6ghE2NRH4yo0xx15a/
m4hB2hmNy9HiOTs8oxWOiqMYU6xvMmDiZYMdoBiwa8fz/AAZwnzrN2ynzQp5/cK1
bo8QQ3HKUBB2pMzTkkEUXGEOteQYZEj9qq6JEgV2I0V0kIFAdKUW7wAhkoXtwW0F
Wv72/SFLAbcTpWB30cdxvuS+XwvUdETSf60HeQj32ufi8KBvqpGpQB6StjnzdZct
Y9SK0/mK/mR1IL8RbjrxSxWgzNGLsb3uOVAnmyEm4Qy0Y9WUpiHQa1VxA+ejnJ0T
t4X1nQBSHNtOaHmtHqjWHLNs5+2lJncAwzVPyw/9j10iwz7MATqD7aXrIiR/A3Z0
tf2Te55tpkTstMBTAaXwBDbAOi0eMEMqHyNaH/hRfvLT1asW8cO4MJx3XxAqhsFs
DGW0h8OTifB5yfkmH58Q
=YwHe
-----END PGP SIGNATURE-----
--=-=-=--
