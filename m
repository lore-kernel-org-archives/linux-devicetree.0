From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH 4/5] gpio: gpiolib: Add sysfs support for
 maintaining GPIO values on reset
Date: Fri, 20 Oct 2017 18:10:08 +1030
Message-ID: <1508485208.24322.46.camel@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
         <20171020033727.21557-5-andrew@aj.id.au>
         <CACRpkdZ9HpXXuauRtVjA9n1dwF3sUQ4gJL-FOUMcMBDCL9oxYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-nXOZj63Mu4q9oJeJSRLo"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ9HpXXuauRtVjA9n1dwF3sUQ4gJL-FOUMcMBDCL9oxYw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-nXOZj63Mu4q9oJeJSRLo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-20 at 09:29 +0200, Linus Walleij wrote:
> On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au>
> wrote:
>=20
> > Expose a new 'maintain' sysfs attribute to control both suspend and
> > reset tolerance.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> NAK. You will find the actual ABI documentation in
> Documentation/ABI/obsolete/sysfs-gpio

Right, I did a quick grep to find an attribute description in order to
judge what documentation to change. Unfortunately my grep didn't pick
up this file.

> that's why. This is being phased out and should not be extended.
> Everyone should use the character device, especially for new
> functionality.

Yeah, I expected this (and the NAK) would be the response but figured I
should ask the question.

Thanks,

Andrew
--=-nXOZj63Mu4q9oJeJSRLo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6ahYAAoJEJ0dnzgO5LT5P5AQAJrlMhDzuNBwIw7eJYSWCeNo
lkn/TYioF3Akxcwd6Y99FRDwc/GhirezWLgIJBKdSOCHSmPB8c1Vmb3QN/QMxCLT
Fe1qqDmDJ/V0QKxit6IboAO+/SanmN07EyPfmY3+2jlgtDYBJZESbD6ePU03wgGz
JwXnGcSnWyV1wfHHz4LeHhJj3TXQYCqiihELLyBis/9jF3wKUGQr2OE0eRM5Dq4D
xx4MlTZneasu8qLBBMP/ZC50lBLzDBS7VQ10NApT5W+msohvnLzGM+vKjF/3j5X4
zLe/6RHerMV/gfqI4ZnzTd7Iyhal2+4gbuZCiWPz0hi7LrhqZ6YcI8XPnLVtE8rG
vjvy7ErtQ6nz8paaSLZ4uFi5dlw4TMHCMKvIuYUWHkN/BeAy06F6oyJMq6W1C+vm
YIdzXY/Xdnudg4Af2PXcO4AbIxQ9UAgDLAwR/7oPN67Fs9SP1dewdQXApwj6+upY
1za15ZmwivdXylOSquk9q4s/sgsyfnrzMe+h3PUn66ZCA7sDX1XH0vffh8awOz3I
oqyyhsOth86z3e39uQeItHoxe99thMKcsXImeL8Tf42CdOcCOysBqu2np9263gOl
LNAQg0qYH1pXYP2ztmX+uQiAFxvqL3rQMLmckwrptvhJbGZ7NF0aI46eti7myfaL
NswkUQ6AtK/lJ0wQ/+Te
=7t2h
-----END PGP SIGNATURE-----

--=-nXOZj63Mu4q9oJeJSRLo--

